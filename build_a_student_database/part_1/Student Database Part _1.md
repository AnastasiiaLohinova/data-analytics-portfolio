<!-- In this 140-lesson course, you will create a Bash script that uses SQL to enter information about your computer science students into PostgreSQL. -->
# I started with two .csv files with info about my computer science students. courses.csv and students.csv
psql --username=freecodecamp --dbname=postgres
<!-- output:
Border style is 2.
Title is " ".
Pager usage is off.
psql (12.17 (Ubuntu 12.17-1.pgdg22.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help. -->
\l
 <!-- output:
                               List of databases
+-----------+----------+----------+---------+---------+-----------------------+
|   Name    |  Owner   | Encoding | Collate |  Ctype  |   Access privileges   |
+-----------+----------+----------+---------+---------+-----------------------+
| postgres  | postgres | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| template0 | postgres | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |          |          |         |         | postgres=CTc/postgres |
| template1 | postgres | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |          |          |         |         | postgres=CTc/postgres |
+-----------+----------+----------+---------+---------+-----------------------+
(3 rows) -->
CREATE DATABASE students;
\l
<!-- postgres=>                                  List of databases
+-----------+--------------+----------+---------+---------+-----------------------+
|   Name    |    Owner     | Encoding | Collate |  Ctype  |   Access privileges   |
+-----------+--------------+----------+---------+---------+-----------------------+
| postgres  | postgres     | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| students  | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| template0 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
| template1 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
+-----------+--------------+----------+---------+---------+-----------------------+
(4 rows) -->
\c students
<!-- output:
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "students" as user "freecodecamp". -->
CREATE TABLE students();
CREATE TABLE majors();
CREATE TABLE courses();
CREATE TABLE majors_courses();
\d
<!-- output:
                List of relations
+--------+----------------+-------+--------------+
| Schema |      Name      | Type  |    Owner     |
+--------+----------------+-------+--------------+
| public | courses        | table | freecodecamp |
| public | majors         | table | freecodecamp |
| public | majors_courses | table | freecodecamp |
| public | students       | table | freecodecamp |
+--------+----------------+-------+--------------+
(4 rows) -->
ALTER TABLE students ADD COLUMN student_id SERIAL PRIMARY KEY;
ALTER TABLE students ADD COLUMN first_name VARCHAR(50) NOT NULL;
ALTER TABLE students ADD COLUMN last_name VARCHAR(50) NOT NULL;
ALTER TABLE students ADD COLUMN major_id INT;
ALTER TABLE students ADD COLUMN gpa NUMERIC(2,1);
\d students
<!-- output:
                                          Table "public.students"
+------------+-----------------------+-----------+----------+----------------------------------------------+
|   Column   |         Type          | Collation | Nullable |                   Default                    |
+------------+-----------------------+-----------+----------+----------------------------------------------+
| student_id | integer               |           | not null | nextval('students_student_id_seq'::regclass) |
| first_name | character varying(50) |           | not null |                                              |
| last_name  | character varying(50) |           | not null |                                              |
| major_id   | integer               |           |          |                                              |
| gpa        | numeric(2,1)          |           |          |                                              |
+------------+-----------------------+-----------+----------+----------------------------------------------+
Indexes:
    "students_pkey" PRIMARY KEY, btree (student_id) -->
ALTER TABLE majors ADD COLUMN major_id SERIAL PRIMARY KEY;
ALTER TABLE majors ADD COLUMN major VARCHAR(50) NOT NULL;
\d majors
<!-- students=>                                         Table "public.majors"
+----------+-----------------------+-----------+----------+------------------------------------------+
|  Column  |         Type          | Collation | Nullable |                 Default                  |
+----------+-----------------------+-----------+----------+------------------------------------------+
| major_id | integer               |           | not null | nextval('majors_major_id_seq'::regclass) |
| major    | character varying(50) |           | not null |                                          |
+----------+-----------------------+-----------+----------+------------------------------------------+
Indexes:
    "majors_pkey" PRIMARY KEY, btree (major_id) -->
ALTER TABLE students ADD FOREIGN KEY(major_id) REFERENCES majors(major_id);
\d students
<!-- students=>                                           Table "public.students"
+------------+-----------------------+-----------+----------+----------------------------------------------+
|   Column   |         Type          | Collation | Nullable |                   Default                    |
+------------+-----------------------+-----------+----------+----------------------------------------------+
| student_id | integer               |           | not null | nextval('students_student_id_seq'::regclass) |
| first_name | character varying(50) |           | not null |                                              |
| last_name  | character varying(50) |           | not null |                                              |
| major_id   | integer               |           |          |                                              |
| gpa        | numeric(2,1)          |           |          |                                              |
+------------+-----------------------+-----------+----------+----------------------------------------------+
Indexes:
    "students_pkey" PRIMARY KEY, btree (student_id)
Foreign-key constraints:
    "students_major_id_fkey" FOREIGN KEY (major_id) REFERENCES majors(major_id) -->
ALTER TABLE courses ADD COLUMN course_id SERIAL PRIMARY KEY;
ALTER TABLE courses ADD COLUMN course VARCHAR(100) NOT NULL;
\d courses
<!-- students=>                                           Table "public.courses"
+-----------+------------------------+-----------+----------+--------------------------------------------+
|  Column   |          Type          | Collation | Nullable |                  Default                   |
+-----------+------------------------+-----------+----------+--------------------------------------------+
| course_id | integer                |           | not null | nextval('courses_course_id_seq'::regclass) |
| course    | character varying(100) |           | not null |                                            |
+-----------+------------------------+-----------+----------+--------------------------------------------+
Indexes:
    "courses_pkey" PRIMARY KEY, btree (course_id) -->
ALTER TABLE majors_courses ADD COLUMN major_id INT;
ALTER TABLE majors_courses ADD FOREIGN KEY(major_id) REFERENCES majors(major_id);
ALTER TABLE majors_courses ADD COLUMN course_id INT;
ALTER TABLE majors_courses ADD FOREIGN KEY(course_id) REFERENCES courses(course_id);
\d majors_courses
<!-- output:
             Table "public.majors_courses"
+-----------+---------+-----------+----------+---------+
|  Column   |  Type   | Collation | Nullable | Default |
+-----------+---------+-----------+----------+---------+
| major_id  | integer |           |          |         |
| course_id | integer |           |          |         |
+-----------+---------+-----------+----------+---------+
Foreign-key constraints:
    "majors_courses_course_id_fkey" FOREIGN KEY (course_id) REFERENCES courses(course_id)
    "majors_courses_major_id_fkey" FOREIGN KEY (major_id) REFERENCES majors(major_id) -->
ALTER TABLE majors_courses ADD PRIMARY KEY(major_id, course_id);
\d majors_courses
<!-- students=>              Table "public.majors_courses"
+-----------+---------+-----------+----------+---------+
|  Column   |  Type   | Collation | Nullable | Default |
+-----------+---------+-----------+----------+---------+
| major_id  | integer |           | not null |         |
| course_id | integer |           | not null |         |
+-----------+---------+-----------+----------+---------+
Indexes:
    "majors_courses_pkey" PRIMARY KEY, btree (major_id, course_id)
Foreign-key constraints:
    "majors_courses_course_id_fkey" FOREIGN KEY (course_id) REFERENCES courses(course_id)
    "majors_courses_major_id_fkey" FOREIGN KEY (major_id) REFERENCES majors(major_id) -->
\d
<!-- students=>                       List of relations
+--------+-------------------------+----------+--------------+
| Schema |          Name           |   Type   |    Owner     |
+--------+-------------------------+----------+--------------+
| public | courses                 | table    | freecodecamp |
| public | courses_course_id_seq   | sequence | freecodecamp |
| public | majors                  | table    | freecodecamp |
| public | majors_courses          | table    | freecodecamp |
| public | majors_major_id_seq     | sequence | freecodecamp |
| public | students                | table    | freecodecamp |
| public | students_student_id_seq | sequence | freecodecamp |
+--------+-------------------------+----------+--------------+
(7 rows) -->
INSERT INTO majors(major) VALUES('Database Administration');
SELECT*FROM majors;
<!-- -- students=>                    
-- +----------+-------------------------+
-- | major_id |          major          |
-- +----------+-------------------------+
-- |        1 | Database Administration |
-- +----------+-------------------------+
-- (1 row) -->
INSERT INTO courses(course) VALUES('Data Structures and Algorithms');
SELECT*FROM courses;
<!--                        
+-----------+--------------------------------+
| course_id |             course             |
+-----------+--------------------------------+
|         1 | Data Structures and Algorithms |
+-----------+--------------------------------+
(1 row) -->
INSERT INTO majors_courses(major_id, course_id) VALUES(1, 1);
SELECT*FROM majors_courses;
<!-- students=>             
+----------+-----------+
| major_id | course_id |
+----------+-----------+
|        1 |         1 |
+----------+-----------+
(1 row) -->
INSERT INTO students(first_name, last_name, major_id, gpa) VALUES('Rhea', 'Kellems', 1, 2.5);
SELECT*FROM students;
<!-- students=>                             
+------------+------------+-----------+----------+-----+
| student_id | first_name | last_name | major_id | gpa |
+------------+------------+-----------+----------+-----+
|          1 | Rhea       | Kellems   |        1 | 2.5 |
+------------+------------+-----------+----------+-----+
(1 row) -->


# insert_data.sh
touch insert_data.sh
chmod +x insert_data.sh
./insert_data.sh
<!-- output:
major,course
Database Administration,Data Structures and Algorithms
Web Development,Web Programming
Database Administration,Database Systems
Data Science,Data Structures and Algorithms
Network Engineering,Computer Networks
Database Administration,SQL
Data Science,Machine Learning
Network Engineering,Computer Systems
Computer Programming,Computer Networks
Database Administration,Web Applications
Game Design,Artificial Intelligence
Data Science,Python
Computer Programming,Object-Oriented Programming
System Administration,Computer Systems
Game Design,Calculus
Web Development,Data Structures and Algorithms
Data Science,Calculus
Web Development,Object-Oriented Programming
Game Design,Game Architecture
System Administration,Computer Networks
Game Design,Algorithms
System Administration,UNIX
System Administration,Server Administration
Computer Programming,Computer Systems
Computer Programming,Python
Network Engineering,Network Security
Web Development,Web Applications
Network Engineering,Algorithms -->
./insert_data.sh
<!-- output:
major,course
Database
Web
Database
Data
Network
Database
Data
Network
Computer
Database
Game
Data
Computer
System
Game
Web
Data
Web
Game
System
Game
System
System
Computer
Computer
Network
Web
Network -->
declare -p IFS
<!-- output:
declare -- IFS=" 
" -->
./insert_data.sh
<!-- output:
major course
Database Administration Data Structures and Algorithms
Web Development Web Programming
Database Administration Database Systems
Data Science Data Structures and Algorithms
Network Engineering Computer Networks
Database Administration SQL
Data Science Machine Learning
Network Engineering Computer Systems
Computer Programming Computer Networks
Database Administration Web Applications
Game Design Artificial Intelligence
Data Science Python
Computer Programming Object-Oriented Programming
System Administration Computer Systems
Game Design Calculus
Web Development Data Structures and Algorithms
Data Science Calculus
Web Development Object-Oriented Programming
Game Design Game Architecture
System Administration Computer Networks
Game Design Algorithms
System Administration UNIX
System Administration Server Administration
Computer Programming Computer Systems
Computer Programming Python
Network Engineering Network Security
Web Development Web Applications
Network Engineering Algorithms -->

