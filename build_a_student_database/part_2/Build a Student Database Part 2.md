# In this 140-lesson course, you will complete your student database while diving deeper into SQL commands.
psql --username=freecodecamp --dbname=postgres
<!-- output: Border style is 2.
Title is " ".
Pager usage is off.
psql (12.17 (Ubuntu 12.17-1.pgdg22.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help. -->

postgres=> \l
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
psql -U postgres < students.sql
<!-- output:
Border style is 2.
Title is " ".
Pager usage is off.
SET
SET
SET
SET
SET
       
+------------+
| set_config |
+------------+
|            |
+------------+
(1 row)

SET
SET
SET
SET
DROP DATABASE
CREATE DATABASE
ALTER DATABASE
You are now connected to database "students" as user "postgres".
SET
SET
SET
SET
SET
       
+------------+
| set_config |
+------------+
|            |
+------------+
(1 row)

SET
SET
SET
SET
SET
SET
CREATE TABLE
ALTER TABLE
CREATE SEQUENCE
ALTER TABLE
ALTER SEQUENCE
CREATE TABLE
ALTER TABLE
CREATE TABLE
ALTER TABLE
CREATE SEQUENCE
ALTER TABLE
ALTER SEQUENCE
CREATE TABLE
ALTER TABLE
CREATE SEQUENCE
ALTER TABLE
ALTER SEQUENCE
ALTER TABLE
ALTER TABLE
ALTER TABLE
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
     
+--------+
| setval |
+--------+
|     39 |
+--------+
(1 row)

     
+--------+
| setval |
+--------+
|     42 |
+--------+
(1 row)

     
+--------+
| setval |
+--------+
|     36 |
+--------+
(1 row)

ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE -->
\l
<!-- postgres->                                  List of databases
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
output:
<!-- SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "students" as user "freecodecamp". -->
\d
<!-- students->                       List of relations
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
    "students_pkey" PRIMARY KEY, btree (student_id)
Foreign-key constraints:
    "students_major_id_fkey" FOREIGN KEY (major_id) REFERENCES majors(major_id) -->
SELECT*FROM students;
<!--                               
+------------+------------+--------------+----------+-----+
| student_id | first_name |  last_name   | major_id | gpa |
+------------+------------+--------------+----------+-----+
|          6 | Rhea       | Kellems      |       36 | 2.5 |
|          7 | Emma       | Gilbert      |          |     |
|          8 | Kimberly   | Whitley      |       37 | 3.8 |
|          9 | Jimmy      | Felipe       |       36 | 3.7 |
|         10 | Kyle       | Stimson      |          | 2.8 |
|         11 | Casares    | Hijo         |       41 | 4.0 |
|         12 | Noe        | Savage       |          | 3.6 |
|         13 | Sterling   | Boss         |       41 | 3.9 |
|         14 | Brian      | Davis        |          | 2.3 |
|         15 | Kaija      | Uronen       |       41 | 3.7 |
|         16 | Faye       | Conn         |       41 | 2.1 |
|         17 | Efren      | Reilly       |       37 | 3.9 |
|         18 | Danh       | Nhung        |          | 2.4 |
|         19 | Maxine     | Hagenes      |       36 | 2.9 |
|         20 | Larry      | Saunders     |       38 | 2.2 |
|         21 | Karl       | Kuhar        |       37 |     |
|         22 | Lieke      | Hazenveld    |       41 | 3.5 |
|         23 | Obie       | Hilpert      |       37 |     |
|         24 | Peter      | Booysen      |          | 2.9 |
|         25 | Nathan     | Turner       |       36 | 3.3 |
|         26 | Gerald     | Osiki        |       38 | 2.2 |
|         27 | Vanya      | Hassanah     |       41 | 4.0 |
|         28 | Roxelana   | Florescu     |       36 | 3.2 |
|         29 | Helene     | Parker       |       38 | 3.4 |
|         30 | Mariana    | Russel       |       37 | 1.8 |
|         31 | Ajit       | Dhungel      |          | 3.0 |
|         32 | Mehdi      | Vandenberghe |       36 | 1.9 |
|         33 | Dejon      | Howell       |       37 | 4.0 |
|         34 | Aliya      | Gulgowski    |       42 | 2.6 |
|         35 | Ana        | Tupajic      |       38 | 3.1 |
|         36 | Hugo       | Duran        |          | 3.8 |
+------------+------------+--------------+----------+-----+
(31 rows) -->

touch student_info.sh
# student_info.sh
chmod +x student_info.sh
./student_info.sh
<!-- output:

~~ My Computer Science Students ~~ -->

SELECT first_name FROM students;
<!--        
+------------+
| first_name |
+------------+
| Rhea       |
| Emma       |
| Kimberly   |
| Jimmy      |
| Kyle       |
| Casares    |
| Noe        |
| Sterling   |
| Brian      |
| Kaija      |
| Faye       |
| Efren      |
| Danh       |
| Maxine     |
| Larry      |
| Karl       |
| Lieke      |
| Obie       |
| Peter      |
| Nathan     |
| Gerald     |
| Vanya      |
| Roxelana   |
| Helene     |
| Mariana    |
| Ajit       |
| Mehdi      |
| Dejon      |
| Aliya      |
| Ana        |
| Hugo       |
+------------+
(31 rows) -->
SELECT first_name, last_name, gpa FROM students WHERE gpa < 2.5;
<!--                   
+------------+--------------+-----+
| first_name |  last_name   | gpa |
+------------+--------------+-----+
| Brian      | Davis        | 2.3 |
| Faye       | Conn         | 2.1 |
| Danh       | Nhung        | 2.4 |
| Larry      | Saunders     | 2.2 |
| Gerald     | Osiki        | 2.2 |
| Mariana    | Russel       | 1.8 |
| Mehdi      | Vandenberghe | 1.9 |
+------------+--------------+-----+
(7 rows) -->
SELECT first_name, last_name, gpa FROM students WHERE gpa >= 3.8;
<!--                 
+------------+-----------+-----+
| first_name | last_name | gpa |
+------------+-----------+-----+
| Kimberly   | Whitley   | 3.8 |
| Casares    | Hijo      | 4.0 |
| Sterling   | Boss      | 3.9 |
| Efren      | Reilly    | 3.9 |
| Vanya      | Hassanah  | 4.0 |
| Dejon      | Howell    | 4.0 |
| Hugo       | Duran     | 3.8 |
+------------+-----------+-----+
(7 rows) -->
SELECT first_name, last_name, gpa FROM students WHERE gpa != 4.0;
<!--                   
+------------+--------------+-----+
| first_name |  last_name   | gpa |
+------------+--------------+-----+
| Rhea       | Kellems      | 2.5 |
| Kimberly   | Whitley      | 3.8 |
| Jimmy      | Felipe       | 3.7 |
| Kyle       | Stimson      | 2.8 |
| Noe        | Savage       | 3.6 |
| Sterling   | Boss         | 3.9 |
| Brian      | Davis        | 2.3 |
| Kaija      | Uronen       | 3.7 |
| Faye       | Conn         | 2.1 |
| Efren      | Reilly       | 3.9 |
| Danh       | Nhung        | 2.4 |
| Maxine     | Hagenes      | 2.9 |
| Larry      | Saunders     | 2.2 |
| Lieke      | Hazenveld    | 3.5 |
| Peter      | Booysen      | 2.9 |
| Nathan     | Turner       | 3.3 |
| Gerald     | Osiki        | 2.2 |
| Roxelana   | Florescu     | 3.2 |
| Helene     | Parker       | 3.4 |
| Mariana    | Russel       | 1.8 |
| Ajit       | Dhungel      | 3.0 |
| Mehdi      | Vandenberghe | 1.9 |
| Aliya      | Gulgowski    | 2.6 |
| Ana        | Tupajic      | 3.1 |
| Hugo       | Duran        | 3.8 |
+------------+--------------+-----+
(25 rows) -->
./student_info.sh
<!-- output:

~~ My Computer Science Students ~~


First name, last name, and GPA of students with a 4.0 GPA:
Casares|Hijo|4.0
Vanya|Hassanah|4.0
Dejon|Howell|4.0 -->
SELECT*FROM majors;
<!--                    
+----------+-------------------------+
| major_id |          major          |
+----------+-------------------------+
|       36 | Database Administration |
|       37 | Web Development         |
|       38 | Data Science            |
|       39 | Network Engineering     |
|       40 | Computer Programming    |
|       41 | Game Design             |
|       42 | System Administration   |
+----------+-------------------------+
(7 rows) -->
SELECT*FROM majors WHERE major='Game Design';
<!--              
+----------+-------------+
| major_id |    major    |
+----------+-------------+
|       41 | Game Design |
+----------+-------------+
(1 row) -->
SELECT*FROM majors WHERE major!='Game Design';
<!--                    
+----------+-------------------------+
| major_id |          major          |
+----------+-------------------------+
|       36 | Database Administration |
|       37 | Web Development         |
|       38 | Data Science            |
|       39 | Network Engineering     |
|       40 | Computer Programming    |
|       42 | System Administration   |
+----------+-------------------------+
(6 rows) -->
SELECT*FROM majors WHERE major > 'Game Design';
# to see majors that come after it alphabetically.
<!--                   
+----------+-----------------------+
| major_id |         major         |
+----------+-----------------------+
|       37 | Web Development       |
|       39 | Network Engineering   |
|       42 | System Administration |
+----------+-----------------------+
(3 rows) -->
SELECT*FROM majors WHERE major <  'G';
<!--                    
+----------+-------------------------+
| major_id |          major          |
+----------+-------------------------+
|       36 | Database Administration |
|       38 | Data Science            |
|       40 | Computer Programming    |
+----------+-------------------------+
(3 rows) -->
SELECT*FROM students WHERE last_name < 'M';
<!--                             
+------------+------------+-----------+----------+-----+
| student_id | first_name | last_name | major_id | gpa |
+------------+------------+-----------+----------+-----+
|          6 | Rhea       | Kellems   |       36 | 2.5 |
|          7 | Emma       | Gilbert   |          |     |
|          9 | Jimmy      | Felipe    |       36 | 3.7 |
|         11 | Casares    | Hijo      |       41 | 4.0 |
|         13 | Sterling   | Boss      |       41 | 3.9 |
|         14 | Brian      | Davis     |          | 2.3 |
|         16 | Faye       | Conn      |       41 | 2.1 |
|         19 | Maxine     | Hagenes   |       36 | 2.9 |
|         21 | Karl       | Kuhar     |       37 |     |
|         22 | Lieke      | Hazenveld |       41 | 3.5 |
|         23 | Obie       | Hilpert   |       37 |     |
|         24 | Peter      | Booysen   |          | 2.9 |
|         27 | Vanya      | Hassanah  |       41 | 4.0 |
|         28 | Roxelana   | Florescu  |       36 | 3.2 |
|         31 | Ajit       | Dhungel   |          | 3.0 |
|         33 | Dejon      | Howell    |       37 | 4.0 |
|         34 | Aliya      | Gulgowski |       42 | 2.6 |
|         36 | Hugo       | Duran     |          | 3.8 |
+------------+------------+-----------+----------+-----+
(18 rows) -->
SELECT*FROM students WHERE last_name < 'M' OR gpa = 3.9;
<!--                             
+------------+------------+-----------+----------+-----+
| student_id | first_name | last_name | major_id | gpa |
+------------+------------+-----------+----------+-----+
|          6 | Rhea       | Kellems   |       36 | 2.5 |
|          7 | Emma       | Gilbert   |          |     |
|          9 | Jimmy      | Felipe    |       36 | 3.7 |
|         11 | Casares    | Hijo      |       41 | 4.0 |
|         13 | Sterling   | Boss      |       41 | 3.9 |
|         14 | Brian      | Davis     |          | 2.3 |
|         16 | Faye       | Conn      |       41 | 2.1 |
|         17 | Efren      | Reilly    |       37 | 3.9 |
|         19 | Maxine     | Hagenes   |       36 | 2.9 |
|         21 | Karl       | Kuhar     |       37 |     |
|         22 | Lieke      | Hazenveld |       41 | 3.5 |
|         23 | Obie       | Hilpert   |       37 |     |
|         24 | Peter      | Booysen   |          | 2.9 |
|         27 | Vanya      | Hassanah  |       41 | 4.0 |
|         28 | Roxelana   | Florescu  |       36 | 3.2 |
|         31 | Ajit       | Dhungel   |          | 3.0 |
|         33 | Dejon      | Howell    |       37 | 4.0 |
|         34 | Aliya      | Gulgowski |       42 | 2.6 |
|         36 | Hugo       | Duran     |          | 3.8 |
+------------+------------+-----------+----------+-----+
(19 rows) -->
SELECT*FROM students WHERE last_name < 'M' AND gpa = 3.9;
<!--                             
+------------+------------+-----------+----------+-----+
| student_id | first_name | last_name | major_id | gpa |
+------------+------------+-----------+----------+-----+
|         13 | Sterling   | Boss      |       41 | 3.9 |
+------------+------------+-----------+----------+-----+
(1 row) -->
SELECT*FROM students WHERE last_name < 'M' AND gpa = 3.9 OR gpa < 2.3;
<!-- students=>                               
+------------+------------+--------------+----------+-----+
| student_id | first_name |  last_name   | major_id | gpa |
+------------+------------+--------------+----------+-----+
|         13 | Sterling   | Boss         |       41 | 3.9 |
|         16 | Faye       | Conn         |       41 | 2.1 |
|         20 | Larry      | Saunders     |       38 | 2.2 |
|         26 | Gerald     | Osiki        |       38 | 2.2 |
|         30 | Mariana    | Russel       |       37 | 1.8 |
|         32 | Mehdi      | Vandenberghe |       36 | 1.9 |
+------------+------------+--------------+----------+-----+
(6 rows) -->
SELECT*FROM students WHERE last_name < 'M' AND(gpa = 3.9 OR gpa < 2.3);
<!--                             
+------------+------------+-----------+----------+-----+
| student_id | first_name | last_name | major_id | gpa |
+------------+------------+-----------+----------+-----+
|         13 | Sterling   | Boss      |       41 | 3.9 |
|         16 | Faye       | Conn      |       41 | 2.1 |
+------------+------------+-----------+----------+-----+
(2 rows) -->
SELECT*FROM courses WHERE course LIKE '_lgorithms';
<!--              
+-----------+------------+
| course_id |   course   |
+-----------+------------+
|        36 | Algorithms |
+-----------+------------+
(1 row) -->
SELECT*FROM courses WHERE course LIKE '%lgorithms';
<!--                        
+-----------+--------------------------------+
| course_id |             course             |
+-----------+--------------------------------+
|        23 | Data Structures and Algorithms |
|        36 | Algorithms                     |
+-----------+--------------------------------+
(2 rows) -->
SELECT*FROM courses WHERE course LIKE 'Web%';
<!--                 
+-----------+------------------+
| course_id |      course      |
+-----------+------------------+
|        24 | Web Programming  |
|        30 | Web Applications |
+-----------+------------------+
(2 rows) -->
SELECT*FROM courses WHERE course LIKE '_e%';
<!--                    
+-----------+-----------------------+
| course_id |        course         |
+-----------+-----------------------+
|        24 | Web Programming       |
|        30 | Web Applications      |
|        38 | Server Administration |
|        39 | Network Security      |
+-----------+-----------------------+
(4 rows) -->
SELECT*FROM courses WHERE course LIKE '% %';
<!--                        
+-----------+--------------------------------+
| course_id |             course             |
+-----------+--------------------------------+
|        23 | Data Structures and Algorithms |
|        24 | Web Programming                |
|        25 | Database Systems               |
|        26 | Computer Networks              |
|        28 | Machine Learning               |
|        29 | Computer Systems               |
|        30 | Web Applications               |
|        31 | Artificial Intelligence        |
|        33 | Object-Oriented Programming    |
|        35 | Game Architecture              |
|        38 | Server Administration          |
|        39 | Network Security               |
+-----------+--------------------------------+
(12 rows) -->
SELECT*FROM courses WHERE course NOT LIKE '% %';
<!-- students=>              
+-----------+------------+
| course_id |   course   |
+-----------+------------+
|        27 | SQL        |
|        32 | Python     |
|        34 | Calculus   |
|        36 | Algorithms |
|        37 | UNIX       |
+-----------+------------+
(5 rows) -->
SELECT*FROM courses WHERE course LIKE '%A%';
<!--                        
+-----------+--------------------------------+
| course_id |             course             |
+-----------+--------------------------------+
|        23 | Data Structures and Algorithms |
|        30 | Web Applications               |
|        31 | Artificial Intelligence        |
|        35 | Game Architecture              |
|        36 | Algorithms                     |
|        38 | Server Administration          |
+-----------+--------------------------------+
(6 rows) -->
SELECT*FROM courses WHERE course ILIKE '%A%';
<!-- students=>                        
+-----------+--------------------------------+
| course_id |             course             |
+-----------+--------------------------------+
|        23 | Data Structures and Algorithms |
|        24 | Web Programming                |
|        25 | Database Systems               |
|        28 | Machine Learning               |
|        30 | Web Applications               |
|        31 | Artificial Intelligence        |
|        33 | Object-Oriented Programming    |
|        34 | Calculus                       |
|        35 | Game Architecture              |
|        36 | Algorithms                     |
|        38 | Server Administration          |
+-----------+--------------------------------+
(11 rows) -->
SELECT*FROM courses WHERE course NOT ILIKE '%A%';
<!--                  
+-----------+-------------------+
| course_id |      course       |
+-----------+-------------------+
|        26 | Computer Networks |
|        27 | SQL               |
|        29 | Computer Systems  |
|        32 | Python            |
|        37 | UNIX              |
|        39 | Network Security  |
+-----------+-------------------+
(6 rows) -->
SELECT*FROM courses WHERE course NOT ILIKE '%A%' AND course LIKE '% %';
<!--                  
+-----------+-------------------+
| course_id |      course       |
+-----------+-------------------+
|        26 | Computer Networks |
|        29 | Computer Systems  |
|        39 | Network Security  |
+-----------+-------------------+
(3 rows) -->
SELECT*FROM students WHERE gpa IS NULL;
<!--                             
+------------+------------+-----------+----------+-----+
| student_id | first_name | last_name | major_id | gpa |
+------------+------------+-----------+----------+-----+
|          7 | Emma       | Gilbert   |          |     |
|         21 | Karl       | Kuhar     |       37 |     |
|         23 | Obie       | Hilpert   |       37 |     |
+------------+------------+-----------+----------+-----+
(3 rows)
 -->
SELECT*FROM students WHERE gpa IS NOT NULL;
<!-- students=>                               
+------------+------------+--------------+----------+-----+
| student_id | first_name |  last_name   | major_id | gpa |
+------------+------------+--------------+----------+-----+
|          6 | Rhea       | Kellems      |       36 | 2.5 |
|          8 | Kimberly   | Whitley      |       37 | 3.8 |
|          9 | Jimmy      | Felipe       |       36 | 3.7 |
|         10 | Kyle       | Stimson      |          | 2.8 |
|         11 | Casares    | Hijo         |       41 | 4.0 |
|         12 | Noe        | Savage       |          | 3.6 |
|         13 | Sterling   | Boss         |       41 | 3.9 |
|         14 | Brian      | Davis        |          | 2.3 |
|         15 | Kaija      | Uronen       |       41 | 3.7 |
|         16 | Faye       | Conn         |       41 | 2.1 |
|         17 | Efren      | Reilly       |       37 | 3.9 |
|         18 | Danh       | Nhung        |          | 2.4 |
|         19 | Maxine     | Hagenes      |       36 | 2.9 |
|         20 | Larry      | Saunders     |       38 | 2.2 |
|         22 | Lieke      | Hazenveld    |       41 | 3.5 |
|         24 | Peter      | Booysen      |          | 2.9 |
|         25 | Nathan     | Turner       |       36 | 3.3 |
|         26 | Gerald     | Osiki        |       38 | 2.2 |
|         27 | Vanya      | Hassanah     |       41 | 4.0 |
|         28 | Roxelana   | Florescu     |       36 | 3.2 |
|         29 | Helene     | Parker       |       38 | 3.4 |
|         30 | Mariana    | Russel       |       37 | 1.8 |
|         31 | Ajit       | Dhungel      |          | 3.0 |
|         32 | Mehdi      | Vandenberghe |       36 | 1.9 |
|         33 | Dejon      | Howell       |       37 | 4.0 |
|         34 | Aliya      | Gulgowski    |       42 | 2.6 |
|         35 | Ana        | Tupajic      |       38 | 3.1 |
|         36 | Hugo       | Duran        |          | 3.8 |
+------------+------------+--------------+----------+-----+
(28 rows) -->
SELECT*FROM students WHERE major_id IS NULL;
<!--                             
+------------+------------+-----------+----------+-----+
| student_id | first_name | last_name | major_id | gpa |
+------------+------------+-----------+----------+-----+
|          7 | Emma       | Gilbert   |          |     |
|         10 | Kyle       | Stimson   |          | 2.8 |
|         12 | Noe        | Savage    |          | 3.6 |
|         14 | Brian      | Davis     |          | 2.3 |
|         18 | Danh       | Nhung     |          | 2.4 |
|         24 | Peter      | Booysen   |          | 2.9 |
|         31 | Ajit       | Dhungel   |          | 3.0 |
|         36 | Hugo       | Duran     |          | 3.8 |
+------------+------------+-----------+----------+-----+
(8 rows) -->
# View the students who don't have a major, but don't include students without a GPA.
SELECT*FROM students WHERE major_id IS NULL AND gpa IS NOT NULL;
<!--                             
+------------+------------+-----------+----------+-----+
| student_id | first_name | last_name | major_id | gpa |
+------------+------------+-----------+----------+-----+
|         10 | Kyle       | Stimson   |          | 2.8 |
|         12 | Noe        | Savage    |          | 3.6 |
|         14 | Brian      | Davis     |          | 2.3 |
|         18 | Danh       | Nhung     |          | 2.4 |
|         24 | Peter      | Booysen   |          | 2.9 |
|         31 | Ajit       | Dhungel   |          | 3.0 |
|         36 | Hugo       | Duran     |          | 3.8 |
+------------+------------+-----------+----------+-----+
(7 rows) -->
# View the students who don't have a major and gpa.
SELECT*FROM students WHERE major_id IS NULL AND gpa IS NULL;
<!--                             
+------------+------------+-----------+----------+-----+
| student_id | first_name | last_name | major_id | gpa |
+------------+------------+-----------+----------+-----+
|          7 | Emma       | Gilbert   |          |     |
+------------+------------+-----------+----------+-----+
(1 row) -->
SELECT*FROM students ORDER BY gpa;
<!-- students=>                               
+------------+------------+--------------+----------+-----+
| student_id | first_name |  last_name   | major_id | gpa |
+------------+------------+--------------+----------+-----+
|         30 | Mariana    | Russel       |       37 | 1.8 |
|         32 | Mehdi      | Vandenberghe |       36 | 1.9 |
|         16 | Faye       | Conn         |       41 | 2.1 |
|         26 | Gerald     | Osiki        |       38 | 2.2 |
|         20 | Larry      | Saunders     |       38 | 2.2 |
|         14 | Brian      | Davis        |          | 2.3 |
|         18 | Danh       | Nhung        |          | 2.4 |
|          6 | Rhea       | Kellems      |       36 | 2.5 |
|         34 | Aliya      | Gulgowski    |       42 | 2.6 |
|         10 | Kyle       | Stimson      |          | 2.8 |
|         19 | Maxine     | Hagenes      |       36 | 2.9 |
|         24 | Peter      | Booysen      |          | 2.9 |
|         31 | Ajit       | Dhungel      |          | 3.0 |
|         35 | Ana        | Tupajic      |       38 | 3.1 |
|         28 | Roxelana   | Florescu     |       36 | 3.2 |
|         25 | Nathan     | Turner       |       36 | 3.3 |
|         29 | Helene     | Parker       |       38 | 3.4 |
|         22 | Lieke      | Hazenveld    |       41 | 3.5 |
|         12 | Noe        | Savage       |          | 3.6 |
|          9 | Jimmy      | Felipe       |       36 | 3.7 |
|         15 | Kaija      | Uronen       |       41 | 3.7 |
|         36 | Hugo       | Duran        |          | 3.8 |
|          8 | Kimberly   | Whitley      |       37 | 3.8 |
|         17 | Efren      | Reilly       |       37 | 3.9 |
|         13 | Sterling   | Boss         |       41 | 3.9 |
|         27 | Vanya      | Hassanah     |       41 | 4.0 |
|         33 | Dejon      | Howell       |       37 | 4.0 |
|         11 | Casares    | Hijo         |       41 | 4.0 |
|         23 | Obie       | Hilpert      |       37 |     |
|         21 | Karl       | Kuhar        |       37 |     |
|          7 | Emma       | Gilbert      |          |     |
+------------+------------+--------------+----------+-----+
(31 rows) -->
SELECT*FROM students ORDER BY gpa DESC;
<!-- students=>                               
+------------+------------+--------------+----------+-----+
| student_id | first_name |  last_name   | major_id | gpa |
+------------+------------+--------------+----------+-----+
|         23 | Obie       | Hilpert      |       37 |     |
|         21 | Karl       | Kuhar        |       37 |     |
|          7 | Emma       | Gilbert      |          |     |
|         27 | Vanya      | Hassanah     |       41 | 4.0 |
|         33 | Dejon      | Howell       |       37 | 4.0 |
|         11 | Casares    | Hijo         |       41 | 4.0 |
|         17 | Efren      | Reilly       |       37 | 3.9 |
|         13 | Sterling   | Boss         |       41 | 3.9 |
|         36 | Hugo       | Duran        |          | 3.8 |
|          8 | Kimberly   | Whitley      |       37 | 3.8 |
|         15 | Kaija      | Uronen       |       41 | 3.7 |
|          9 | Jimmy      | Felipe       |       36 | 3.7 |
|         12 | Noe        | Savage       |          | 3.6 |
|         22 | Lieke      | Hazenveld    |       41 | 3.5 |
|         29 | Helene     | Parker       |       38 | 3.4 |
|         25 | Nathan     | Turner       |       36 | 3.3 |
|         28 | Roxelana   | Florescu     |       36 | 3.2 |
|         35 | Ana        | Tupajic      |       38 | 3.1 |
|         31 | Ajit       | Dhungel      |          | 3.0 |
|         24 | Peter      | Booysen      |          | 2.9 |
|         19 | Maxine     | Hagenes      |       36 | 2.9 |
|         10 | Kyle       | Stimson      |          | 2.8 |
|         34 | Aliya      | Gulgowski    |       42 | 2.6 |
|          6 | Rhea       | Kellems      |       36 | 2.5 |
|         18 | Danh       | Nhung        |          | 2.4 |
|         14 | Brian      | Davis        |          | 2.3 |
|         26 | Gerald     | Osiki        |       38 | 2.2 |
|         20 | Larry      | Saunders     |       38 | 2.2 |
|         16 | Faye       | Conn         |       41 | 2.1 |
|         32 | Mehdi      | Vandenberghe |       36 | 1.9 |
|         30 | Mariana    | Russel       |       37 | 1.8 |
+------------+------------+--------------+----------+-----+
(31 rows) -->
SELECT*FROM students ORDER BY gpa DESC, first_name;
<!-- students=>                               
+------------+------------+--------------+----------+-----+
| student_id | first_name |  last_name   | major_id | gpa |
+------------+------------+--------------+----------+-----+
|          7 | Emma       | Gilbert      |          |     |
|         21 | Karl       | Kuhar        |       37 |     |
|         23 | Obie       | Hilpert      |       37 |     |
|         11 | Casares    | Hijo         |       41 | 4.0 |
|         33 | Dejon      | Howell       |       37 | 4.0 |
|         27 | Vanya      | Hassanah     |       41 | 4.0 |
|         17 | Efren      | Reilly       |       37 | 3.9 |
|         13 | Sterling   | Boss         |       41 | 3.9 |
|         36 | Hugo       | Duran        |          | 3.8 |
|          8 | Kimberly   | Whitley      |       37 | 3.8 |
|          9 | Jimmy      | Felipe       |       36 | 3.7 |
|         15 | Kaija      | Uronen       |       41 | 3.7 |
|         12 | Noe        | Savage       |          | 3.6 |
|         22 | Lieke      | Hazenveld    |       41 | 3.5 |
|         29 | Helene     | Parker       |       38 | 3.4 |
|         25 | Nathan     | Turner       |       36 | 3.3 |
|         28 | Roxelana   | Florescu     |       36 | 3.2 |
|         35 | Ana        | Tupajic      |       38 | 3.1 |
|         31 | Ajit       | Dhungel      |          | 3.0 |
|         19 | Maxine     | Hagenes      |       36 | 2.9 |
|         24 | Peter      | Booysen      |          | 2.9 |
|         10 | Kyle       | Stimson      |          | 2.8 |
|         34 | Aliya      | Gulgowski    |       42 | 2.6 |
|          6 | Rhea       | Kellems      |       36 | 2.5 |
|         18 | Danh       | Nhung        |          | 2.4 |
|         14 | Brian      | Davis        |          | 2.3 |
|         26 | Gerald     | Osiki        |       38 | 2.2 |
|         20 | Larry      | Saunders     |       38 | 2.2 |
|         16 | Faye       | Conn         |       41 | 2.1 |
|         32 | Mehdi      | Vandenberghe |       36 | 1.9 |
|         30 | Mariana    | Russel       |       37 | 1.8 |
+------------+------------+--------------+----------+-----+
(31 rows) -->
SELECT*FROM students ORDER BY gpa DESC, first_name LIMIT 10;
<!--                             
+------------+------------+-----------+----------+-----+
| student_id | first_name | last_name | major_id | gpa |
+------------+------------+-----------+----------+-----+
|          7 | Emma       | Gilbert   |          |     |
|         21 | Karl       | Kuhar     |       37 |     |
|         23 | Obie       | Hilpert   |       37 |     |
|         11 | Casares    | Hijo      |       41 | 4.0 |
|         33 | Dejon      | Howell    |       37 | 4.0 |
|         27 | Vanya      | Hassanah  |       41 | 4.0 |
|         17 | Efren      | Reilly    |       37 | 3.9 |
|         13 | Sterling   | Boss      |       41 | 3.9 |
|         36 | Hugo       | Duran     |          | 3.8 |
|          8 | Kimberly   | Whitley   |       37 | 3.8 |
+------------+------------+-----------+----------+-----+
(10 rows) -->
SELECT*FROM students WHERE gpa IS NOT NULL ORDER BY gpa DESC, first_name LIMIT 10;
<!--                             
+------------+------------+-----------+----------+-----+
| student_id | first_name | last_name | major_id | gpa |
+------------+------------+-----------+----------+-----+
|         11 | Casares    | Hijo      |       41 | 4.0 |
|         33 | Dejon      | Howell    |       37 | 4.0 |
|         27 | Vanya      | Hassanah  |       41 | 4.0 |
|         17 | Efren      | Reilly    |       37 | 3.9 |
|         13 | Sterling   | Boss      |       41 | 3.9 |
|         36 | Hugo       | Duran     |          | 3.8 |
|          8 | Kimberly   | Whitley   |       37 | 3.8 |
|          9 | Jimmy      | Felipe    |       36 | 3.7 |
|         15 | Kaija      | Uronen    |       41 | 3.7 |
|         12 | Noe        | Savage    |          | 3.6 |
+------------+------------+-----------+----------+-----+
(10 rows) -->
SELECT MIN(gpa) FROM students;
<!-- students=>     
+-----+
| min |
+-----+
| 1.8 |
+-----+
(1 row) -->
SELECT MAX(gpa) FROM students;
<!-- students=>     
+-----+
| max |
+-----+
| 4.0 |
+-----+
(1 row) -->
SELECT SUM(major_id) FROM students;
<!--     
+-----+
| sum |
+-----+
| 878 |
+-----+
(1 row) -->
SELECT AVG(major_id) FROM students;
<!-- students=>             
+---------------------+
|         avg         |
+---------------------+
| 38.1739130434782609 |
+---------------------+
(1 row) -->
SELECT CEIL(AVG(major_id)) FROM students;
<!-- students=>     
+------+
| ceil |
+------+
|   39 |
+------+
(1 row) -->
SELECT ROUND(AVG(major_id)) FROM students;
<!-- students=>      
+-------+
| round |
+-------+
|    38 |
+-------+
(1 row) -->
SELECT ROUND(AVG(major_id), 5) FROM students;
<!-- students=>       
+----------+
|  round   |
+----------+
| 38.17391 |
+----------+
(1 row) -->
SELECT COUNT(*) FROM majors;
<!--      
+-------+
| count |
+-------+
|     7 |
+-------+
(1 row) -->
SELECT COUNT(*) FROM students;
<!--      
+-------+
| count |
+-------+
|    31 |
+-------+
(1 row) -->
SELECT COUNT(major_id) FROM students;
<!--      
+-------+
| count |
+-------+
|    23 |
+-------+
(1 row) -->
SELECT DISTINCT(major_id) FROM students;
<!-- students=>       
+----------+
| major_id |
+----------+
|          |
|       42 |
|       41 |
|       38 |
|       36 |
|       37 |
+----------+
(6 rows) -->
# THE SAME RESULT
SELECT major_id FROM students GROUP BY major_id;
<!--       
+----------+
| major_id |
+----------+
|          |
|       42 |
|       41 |
|       38 |
|       36 |
|       37 |
+----------+
(6 rows) -->
SELECT major_id, COUNT(*) FROM students GROUP BY major_id;
<!--           
+----------+-------+
| major_id | count |
+----------+-------+
|          |     8 |
|       42 |     1 |
|       41 |     6 |
|       38 |     4 |
|       36 |     6 |
|       37 |     6 |
+----------+-------+
(6 rows) -->
SELECT major_id, MIN(gpa) FROM students GROUP BY major_id;
<!-- students=>          
+----------+-----+
| major_id | min |
+----------+-----+
|          | 2.3 |
|       42 | 2.6 |
|       41 | 2.1 |
|       38 | 2.2 |
|       36 | 1.9 |
|       37 | 1.8 |
+----------+-----+
(6 rows) -->
SELECT major_id, MIN(gpa), MAX(gpa) FROM students GROUP BY major_id;
<!-- students=>             
+----------+-----+-----+
| major_id | min | max |
+----------+-----+-----+
|          | 2.3 | 3.8 |
|       42 | 2.6 | 2.6 |
|       41 | 2.1 | 4.0 |
|       38 | 2.2 | 3.4 |
|       36 | 1.9 | 3.7 |
|       37 | 1.8 | 4.0 |
+----------+-----+-----+
(6 rows) -->
SELECT major_id, MIN(gpa), MAX(gpa) FROM students GROUP BY major_id HAVING MAX(gpa) = 4.0;
<!-- students=>             
+----------+-----+-----+
| major_id | min | max |
+----------+-----+-----+
|       41 | 2.1 | 4.0 |
|       37 | 1.8 | 4.0 |
+----------+-----+-----+
(2 rows) -->
SELECT major_id, MIN(gpa) AS min_gpa, MAX(gpa) FROM students GROUP BY major_id HAVING MAX(gpa) = 4.0;
<!--               
+----------+---------+-----+
| major_id | min_gpa | max |
+----------+---------+-----+
|       41 |     2.1 | 4.0 |
|       37 |     1.8 | 4.0 |
+----------+---------+-----+
(2 rows) -->
SELECT major_id, MIN(gpa) AS min_gpa, MAX(gpa) AS max_gpa  FROM students GROUP BY major_id HAVING MAX(gpa) = 4.0;
<!--                 
+----------+---------+---------+
| major_id | min_gpa | max_gpa |
+----------+---------+---------+
|       41 |     2.1 |     4.0 |
|       37 |     1.8 |     4.0 |
+----------+---------+---------+
(2 rows) -->
SELECT major_id, COUNT(*) AS number_of_students FROM students GROUP BY major_id;
<!--                  
+----------+--------------------+
| major_id | number_of_students |
+----------+--------------------+
|          |                  8 |
|       42 |                  1 |
|       41 |                  6 |
|       38 |                  4 |
|       36 |                  6 |
|       37 |                  6 |
+----------+--------------------+
(6 rows) -->
SELECT major_id, COUNT(*) AS number_of_students FROM students GROUP BY major_id HAVING COUNT(*) < 8;
<!--                  
+----------+--------------------+
| major_id | number_of_students |
+----------+--------------------+
|       42 |                  1 |
|       41 |                  6 |
|       38 |                  4 |
|       36 |                  6 |
|       37 |                  6 |
+----------+--------------------+
(5 rows) -->
SELECT*FROM students FULL JOIN majors ON students.major_id=majors.major_id;
<!-- students=>                                                 
+------------+------------+--------------+----------+-----+----------+-------------------------+
| student_id | first_name |  last_name   | major_id | gpa | major_id |          major          |
+------------+------------+--------------+----------+-----+----------+-------------------------+
|          6 | Rhea       | Kellems      |       36 | 2.5 |       36 | Database Administration |
|          7 | Emma       | Gilbert      |          |     |          |                         |
|          8 | Kimberly   | Whitley      |       37 | 3.8 |       37 | Web Development         |
|          9 | Jimmy      | Felipe       |       36 | 3.7 |       36 | Database Administration |
|         10 | Kyle       | Stimson      |          | 2.8 |          |                         |
|         11 | Casares    | Hijo         |       41 | 4.0 |       41 | Game Design             |
|         12 | Noe        | Savage       |          | 3.6 |          |                         |
|         13 | Sterling   | Boss         |       41 | 3.9 |       41 | Game Design             |
|         14 | Brian      | Davis        |          | 2.3 |          |                         |
|         15 | Kaija      | Uronen       |       41 | 3.7 |       41 | Game Design             |
|         16 | Faye       | Conn         |       41 | 2.1 |       41 | Game Design             |
|         17 | Efren      | Reilly       |       37 | 3.9 |       37 | Web Development         |
|         18 | Danh       | Nhung        |          | 2.4 |          |                         |
|         19 | Maxine     | Hagenes      |       36 | 2.9 |       36 | Database Administration |
|         20 | Larry      | Saunders     |       38 | 2.2 |       38 | Data Science            |
|         21 | Karl       | Kuhar        |       37 |     |       37 | Web Development         |
|         22 | Lieke      | Hazenveld    |       41 | 3.5 |       41 | Game Design             |
|         23 | Obie       | Hilpert      |       37 |     |       37 | Web Development         |
|         24 | Peter      | Booysen      |          | 2.9 |          |                         |
|         25 | Nathan     | Turner       |       36 | 3.3 |       36 | Database Administration |
|         26 | Gerald     | Osiki        |       38 | 2.2 |       38 | Data Science            |
|         27 | Vanya      | Hassanah     |       41 | 4.0 |       41 | Game Design             |
|         28 | Roxelana   | Florescu     |       36 | 3.2 |       36 | Database Administration |
|         29 | Helene     | Parker       |       38 | 3.4 |       38 | Data Science            |
|         30 | Mariana    | Russel       |       37 | 1.8 |       37 | Web Development         |
|         31 | Ajit       | Dhungel      |          | 3.0 |          |                         |
|         32 | Mehdi      | Vandenberghe |       36 | 1.9 |       36 | Database Administration |
|         33 | Dejon      | Howell       |       37 | 4.0 |       37 | Web Development         |
|         34 | Aliya      | Gulgowski    |       42 | 2.6 |       42 | System Administration   |
|         35 | Ana        | Tupajic      |       38 | 3.1 |       38 | Data Science            |
|         36 | Hugo       | Duran        |          | 3.8 |          |                         |
|            |            |              |          |     |       39 | Network Engineering     |
|            |            |              |          |     |       40 | Computer Programming    |
+------------+------------+--------------+----------+-----+----------+-------------------------+
(33 rows) -->
SELECT*FROM students LEFT JOIN majors ON students.major_id=majors.major_id;
<!--                                                 
+------------+------------+--------------+----------+-----+----------+-------------------------+
| student_id | first_name |  last_name   | major_id | gpa | major_id |          major          |
+------------+------------+--------------+----------+-----+----------+-------------------------+
|          6 | Rhea       | Kellems      |       36 | 2.5 |       36 | Database Administration |
|          7 | Emma       | Gilbert      |          |     |          |                         |
|          8 | Kimberly   | Whitley      |       37 | 3.8 |       37 | Web Development         |
|          9 | Jimmy      | Felipe       |       36 | 3.7 |       36 | Database Administration |
|         10 | Kyle       | Stimson      |          | 2.8 |          |                         |
|         11 | Casares    | Hijo         |       41 | 4.0 |       41 | Game Design             |
|         12 | Noe        | Savage       |          | 3.6 |          |                         |
|         13 | Sterling   | Boss         |       41 | 3.9 |       41 | Game Design             |
|         14 | Brian      | Davis        |          | 2.3 |          |                         |
|         15 | Kaija      | Uronen       |       41 | 3.7 |       41 | Game Design             |
|         16 | Faye       | Conn         |       41 | 2.1 |       41 | Game Design             |
|         17 | Efren      | Reilly       |       37 | 3.9 |       37 | Web Development         |
|         18 | Danh       | Nhung        |          | 2.4 |          |                         |
|         19 | Maxine     | Hagenes      |       36 | 2.9 |       36 | Database Administration |
|         20 | Larry      | Saunders     |       38 | 2.2 |       38 | Data Science            |
|         21 | Karl       | Kuhar        |       37 |     |       37 | Web Development         |
|         22 | Lieke      | Hazenveld    |       41 | 3.5 |       41 | Game Design             |
|         23 | Obie       | Hilpert      |       37 |     |       37 | Web Development         |
|         24 | Peter      | Booysen      |          | 2.9 |          |                         |
|         25 | Nathan     | Turner       |       36 | 3.3 |       36 | Database Administration |
|         26 | Gerald     | Osiki        |       38 | 2.2 |       38 | Data Science            |
|         27 | Vanya      | Hassanah     |       41 | 4.0 |       41 | Game Design             |
|         28 | Roxelana   | Florescu     |       36 | 3.2 |       36 | Database Administration |
|         29 | Helene     | Parker       |       38 | 3.4 |       38 | Data Science            |
|         30 | Mariana    | Russel       |       37 | 1.8 |       37 | Web Development         |
|         31 | Ajit       | Dhungel      |          | 3.0 |          |                         |
|         32 | Mehdi      | Vandenberghe |       36 | 1.9 |       36 | Database Administration |
|         33 | Dejon      | Howell       |       37 | 4.0 |       37 | Web Development         |
|         34 | Aliya      | Gulgowski    |       42 | 2.6 |       42 | System Administration   |
|         35 | Ana        | Tupajic      |       38 | 3.1 |       38 | Data Science            |
|         36 | Hugo       | Duran        |          | 3.8 |          |                         |
+------------+------------+--------------+----------+-----+----------+-------------------------+
(31 rows) -->
SELECT*FROM students RIGHT JOIN majors ON students.major_id=majors.major_id;
<!--                                                 
+------------+------------+--------------+----------+-----+----------+-------------------------+
| student_id | first_name |  last_name   | major_id | gpa | major_id |          major          |
+------------+------------+--------------+----------+-----+----------+-------------------------+
|          6 | Rhea       | Kellems      |       36 | 2.5 |       36 | Database Administration |
|          8 | Kimberly   | Whitley      |       37 | 3.8 |       37 | Web Development         |
|          9 | Jimmy      | Felipe       |       36 | 3.7 |       36 | Database Administration |
|         11 | Casares    | Hijo         |       41 | 4.0 |       41 | Game Design             |
|         13 | Sterling   | Boss         |       41 | 3.9 |       41 | Game Design             |
|         15 | Kaija      | Uronen       |       41 | 3.7 |       41 | Game Design             |
|         16 | Faye       | Conn         |       41 | 2.1 |       41 | Game Design             |
|         17 | Efren      | Reilly       |       37 | 3.9 |       37 | Web Development         |
|         19 | Maxine     | Hagenes      |       36 | 2.9 |       36 | Database Administration |
|         20 | Larry      | Saunders     |       38 | 2.2 |       38 | Data Science            |
|         21 | Karl       | Kuhar        |       37 |     |       37 | Web Development         |
|         22 | Lieke      | Hazenveld    |       41 | 3.5 |       41 | Game Design             |
|         23 | Obie       | Hilpert      |       37 |     |       37 | Web Development         |
|         25 | Nathan     | Turner       |       36 | 3.3 |       36 | Database Administration |
|         26 | Gerald     | Osiki        |       38 | 2.2 |       38 | Data Science            |
|         27 | Vanya      | Hassanah     |       41 | 4.0 |       41 | Game Design             |
|         28 | Roxelana   | Florescu     |       36 | 3.2 |       36 | Database Administration |
|         29 | Helene     | Parker       |       38 | 3.4 |       38 | Data Science            |
|         30 | Mariana    | Russel       |       37 | 1.8 |       37 | Web Development         |
|         32 | Mehdi      | Vandenberghe |       36 | 1.9 |       36 | Database Administration |
|         33 | Dejon      | Howell       |       37 | 4.0 |       37 | Web Development         |
|         34 | Aliya      | Gulgowski    |       42 | 2.6 |       42 | System Administration   |
|         35 | Ana        | Tupajic      |       38 | 3.1 |       38 | Data Science            |
|            |            |              |          |     |       39 | Network Engineering     |
|            |            |              |          |     |       40 | Computer Programming    |
+------------+------------+--------------+----------+-----+----------+-------------------------+
(25 rows) -->
SELECT*FROM students INNER JOIN majors ON students.major_id=majors.major_id;
<!-- students=>                                                 
+------------+------------+--------------+----------+-----+----------+-------------------------+
| student_id | first_name |  last_name   | major_id | gpa | major_id |          major          |
+------------+------------+--------------+----------+-----+----------+-------------------------+
|          6 | Rhea       | Kellems      |       36 | 2.5 |       36 | Database Administration |
|          8 | Kimberly   | Whitley      |       37 | 3.8 |       37 | Web Development         |
|          9 | Jimmy      | Felipe       |       36 | 3.7 |       36 | Database Administration |
|         11 | Casares    | Hijo         |       41 | 4.0 |       41 | Game Design             |
|         13 | Sterling   | Boss         |       41 | 3.9 |       41 | Game Design             |
|         15 | Kaija      | Uronen       |       41 | 3.7 |       41 | Game Design             |
|         16 | Faye       | Conn         |       41 | 2.1 |       41 | Game Design             |
|         17 | Efren      | Reilly       |       37 | 3.9 |       37 | Web Development         |
|         19 | Maxine     | Hagenes      |       36 | 2.9 |       36 | Database Administration |
|         20 | Larry      | Saunders     |       38 | 2.2 |       38 | Data Science            |
|         21 | Karl       | Kuhar        |       37 |     |       37 | Web Development         |
|         22 | Lieke      | Hazenveld    |       41 | 3.5 |       41 | Game Design             |
|         23 | Obie       | Hilpert      |       37 |     |       37 | Web Development         |
|         25 | Nathan     | Turner       |       36 | 3.3 |       36 | Database Administration |
|         26 | Gerald     | Osiki        |       38 | 2.2 |       38 | Data Science            |
|         27 | Vanya      | Hassanah     |       41 | 4.0 |       41 | Game Design             |
|         28 | Roxelana   | Florescu     |       36 | 3.2 |       36 | Database Administration |
|         29 | Helene     | Parker       |       38 | 3.4 |       38 | Data Science            |
|         30 | Mariana    | Russel       |       37 | 1.8 |       37 | Web Development         |
|         32 | Mehdi      | Vandenberghe |       36 | 1.9 |       36 | Database Administration |
|         33 | Dejon      | Howell       |       37 | 4.0 |       37 | Web Development         |
|         34 | Aliya      | Gulgowski    |       42 | 2.6 |       42 | System Administration   |
|         35 | Ana        | Tupajic      |       38 | 3.1 |       38 | Data Science            |
+------------+------------+--------------+----------+-----+----------+-------------------------+
(23 rows) -->
SELECT*FROM majors LEFT JOIN students ON majors.major_id=students.major_id;
<!--                                                 
+----------+-------------------------+------------+------------+--------------+----------+-----+
| major_id |          major          | student_id | first_name |  last_name   | major_id | gpa |
+----------+-------------------------+------------+------------+--------------+----------+-----+
|       36 | Database Administration |          6 | Rhea       | Kellems      |       36 | 2.5 |
|       37 | Web Development         |          8 | Kimberly   | Whitley      |       37 | 3.8 |
|       36 | Database Administration |          9 | Jimmy      | Felipe       |       36 | 3.7 |
|       41 | Game Design             |         11 | Casares    | Hijo         |       41 | 4.0 |
|       41 | Game Design             |         13 | Sterling   | Boss         |       41 | 3.9 |
|       41 | Game Design             |         15 | Kaija      | Uronen       |       41 | 3.7 |
|       41 | Game Design             |         16 | Faye       | Conn         |       41 | 2.1 |
|       37 | Web Development         |         17 | Efren      | Reilly       |       37 | 3.9 |
|       36 | Database Administration |         19 | Maxine     | Hagenes      |       36 | 2.9 |
|       38 | Data Science            |         20 | Larry      | Saunders     |       38 | 2.2 |
|       37 | Web Development         |         21 | Karl       | Kuhar        |       37 |     |
|       41 | Game Design             |         22 | Lieke      | Hazenveld    |       41 | 3.5 |
|       37 | Web Development         |         23 | Obie       | Hilpert      |       37 |     |
|       36 | Database Administration |         25 | Nathan     | Turner       |       36 | 3.3 |
|       38 | Data Science            |         26 | Gerald     | Osiki        |       38 | 2.2 |
|       41 | Game Design             |         27 | Vanya      | Hassanah     |       41 | 4.0 |
|       36 | Database Administration |         28 | Roxelana   | Florescu     |       36 | 3.2 |
|       38 | Data Science            |         29 | Helene     | Parker       |       38 | 3.4 |
|       37 | Web Development         |         30 | Mariana    | Russel       |       37 | 1.8 |
|       36 | Database Administration |         32 | Mehdi      | Vandenberghe |       36 | 1.9 |
|       37 | Web Development         |         33 | Dejon      | Howell       |       37 | 4.0 |
|       42 | System Administration   |         34 | Aliya      | Gulgowski    |       42 | 2.6 |
|       38 | Data Science            |         35 | Ana        | Tupajic      |       38 | 3.1 |
|       39 | Network Engineering     |            |            |              |          |     |
|       40 | Computer Programming    |            |            |              |          |     |
+----------+-------------------------+------------+------------+--------------+----------+-----+
(25 rows) -->
SELECT*FROM majors INNER JOIN students ON majors.major_id=students.major_id;
<!-- students=>                                                 
+----------+-------------------------+------------+------------+--------------+----------+-----+
| major_id |          major          | student_id | first_name |  last_name   | major_id | gpa |
+----------+-------------------------+------------+------------+--------------+----------+-----+
|       36 | Database Administration |          6 | Rhea       | Kellems      |       36 | 2.5 |
|       37 | Web Development         |          8 | Kimberly   | Whitley      |       37 | 3.8 |
|       36 | Database Administration |          9 | Jimmy      | Felipe       |       36 | 3.7 |
|       41 | Game Design             |         11 | Casares    | Hijo         |       41 | 4.0 |
|       41 | Game Design             |         13 | Sterling   | Boss         |       41 | 3.9 |
|       41 | Game Design             |         15 | Kaija      | Uronen       |       41 | 3.7 |
|       41 | Game Design             |         16 | Faye       | Conn         |       41 | 2.1 |
|       37 | Web Development         |         17 | Efren      | Reilly       |       37 | 3.9 |
|       36 | Database Administration |         19 | Maxine     | Hagenes      |       36 | 2.9 |
|       38 | Data Science            |         20 | Larry      | Saunders     |       38 | 2.2 |
|       37 | Web Development         |         21 | Karl       | Kuhar        |       37 |     |
|       41 | Game Design             |         22 | Lieke      | Hazenveld    |       41 | 3.5 |
|       37 | Web Development         |         23 | Obie       | Hilpert      |       37 |     |
|       36 | Database Administration |         25 | Nathan     | Turner       |       36 | 3.3 |
|       38 | Data Science            |         26 | Gerald     | Osiki        |       38 | 2.2 |
|       41 | Game Design             |         27 | Vanya      | Hassanah     |       41 | 4.0 |
|       36 | Database Administration |         28 | Roxelana   | Florescu     |       36 | 3.2 |
|       38 | Data Science            |         29 | Helene     | Parker       |       38 | 3.4 |
|       37 | Web Development         |         30 | Mariana    | Russel       |       37 | 1.8 |
|       36 | Database Administration |         32 | Mehdi      | Vandenberghe |       36 | 1.9 |
|       37 | Web Development         |         33 | Dejon      | Howell       |       37 | 4.0 |
|       42 | System Administration   |         34 | Aliya      | Gulgowski    |       42 | 2.6 |
|       38 | Data Science            |         35 | Ana        | Tupajic      |       38 | 3.1 |
+----------+-------------------------+------------+------------+--------------+----------+-----+
(23 rows) -->
SELECT*FROM majors RIGHT JOIN students ON majors.major_id=students.major_id;
<!-- students=>                                                 
+----------+-------------------------+------------+------------+--------------+----------+-----+
| major_id |          major          | student_id | first_name |  last_name   | major_id | gpa |
+----------+-------------------------+------------+------------+--------------+----------+-----+
|       36 | Database Administration |          6 | Rhea       | Kellems      |       36 | 2.5 |
|          |                         |          7 | Emma       | Gilbert      |          |     |
|       37 | Web Development         |          8 | Kimberly   | Whitley      |       37 | 3.8 |
|       36 | Database Administration |          9 | Jimmy      | Felipe       |       36 | 3.7 |
|          |                         |         10 | Kyle       | Stimson      |          | 2.8 |
|       41 | Game Design             |         11 | Casares    | Hijo         |       41 | 4.0 |
|          |                         |         12 | Noe        | Savage       |          | 3.6 |
|       41 | Game Design             |         13 | Sterling   | Boss         |       41 | 3.9 |
|          |                         |         14 | Brian      | Davis        |          | 2.3 |
|       41 | Game Design             |         15 | Kaija      | Uronen       |       41 | 3.7 |
|       41 | Game Design             |         16 | Faye       | Conn         |       41 | 2.1 |
|       37 | Web Development         |         17 | Efren      | Reilly       |       37 | 3.9 |
|          |                         |         18 | Danh       | Nhung        |          | 2.4 |
|       36 | Database Administration |         19 | Maxine     | Hagenes      |       36 | 2.9 |
|       38 | Data Science            |         20 | Larry      | Saunders     |       38 | 2.2 |
|       37 | Web Development         |         21 | Karl       | Kuhar        |       37 |     |
|       41 | Game Design             |         22 | Lieke      | Hazenveld    |       41 | 3.5 |
|       37 | Web Development         |         23 | Obie       | Hilpert      |       37 |     |
|          |                         |         24 | Peter      | Booysen      |          | 2.9 |
|       36 | Database Administration |         25 | Nathan     | Turner       |       36 | 3.3 |
|       38 | Data Science            |         26 | Gerald     | Osiki        |       38 | 2.2 |
|       41 | Game Design             |         27 | Vanya      | Hassanah     |       41 | 4.0 |
|       36 | Database Administration |         28 | Roxelana   | Florescu     |       36 | 3.2 |
|       38 | Data Science            |         29 | Helene     | Parker       |       38 | 3.4 |
|       37 | Web Development         |         30 | Mariana    | Russel       |       37 | 1.8 |
|          |                         |         31 | Ajit       | Dhungel      |          | 3.0 |
|       36 | Database Administration |         32 | Mehdi      | Vandenberghe |       36 | 1.9 |
|       37 | Web Development         |         33 | Dejon      | Howell       |       37 | 4.0 |
|       42 | System Administration   |         34 | Aliya      | Gulgowski    |       42 | 2.6 |
|       38 | Data Science            |         35 | Ana        | Tupajic      |       38 | 3.1 |
|          |                         |         36 | Hugo       | Duran        |          | 3.8 |
+----------+-------------------------+------------+------------+--------------+----------+-----+
(31 rows) -->
SELECT*FROM majors FULL JOIN students ON majors.major_id=students.major_id;
                                                
<!-- +----------+-------------------------+------------+------------+--------------+----------+-----+
| major_id |          major          | student_id | first_name |  last_name   | major_id | gpa |
+----------+-------------------------+------------+------------+--------------+----------+-----+
|       36 | Database Administration |          6 | Rhea       | Kellems      |       36 | 2.5 |
|          |                         |          7 | Emma       | Gilbert      |          |     |
|       37 | Web Development         |          8 | Kimberly   | Whitley      |       37 | 3.8 |
|       36 | Database Administration |          9 | Jimmy      | Felipe       |       36 | 3.7 |
|          |                         |         10 | Kyle       | Stimson      |          | 2.8 |
|       41 | Game Design             |         11 | Casares    | Hijo         |       41 | 4.0 |
|          |                         |         12 | Noe        | Savage       |          | 3.6 |
|       41 | Game Design             |         13 | Sterling   | Boss         |       41 | 3.9 |
|          |                         |         14 | Brian      | Davis        |          | 2.3 |
|       41 | Game Design             |         15 | Kaija      | Uronen       |       41 | 3.7 |
|       41 | Game Design             |         16 | Faye       | Conn         |       41 | 2.1 |
|       37 | Web Development         |         17 | Efren      | Reilly       |       37 | 3.9 |
|          |                         |         18 | Danh       | Nhung        |          | 2.4 |
|       36 | Database Administration |         19 | Maxine     | Hagenes      |       36 | 2.9 |
|       38 | Data Science            |         20 | Larry      | Saunders     |       38 | 2.2 |
|       37 | Web Development         |         21 | Karl       | Kuhar        |       37 |     |
|       41 | Game Design             |         22 | Lieke      | Hazenveld    |       41 | 3.5 |
|       37 | Web Development         |         23 | Obie       | Hilpert      |       37 |     |
|          |                         |         24 | Peter      | Booysen      |          | 2.9 |
|       36 | Database Administration |         25 | Nathan     | Turner       |       36 | 3.3 |
|       38 | Data Science            |         26 | Gerald     | Osiki        |       38 | 2.2 |
|       41 | Game Design             |         27 | Vanya      | Hassanah     |       41 | 4.0 |
|       36 | Database Administration |         28 | Roxelana   | Florescu     |       36 | 3.2 |
|       38 | Data Science            |         29 | Helene     | Parker       |       38 | 3.4 |
|       37 | Web Development         |         30 | Mariana    | Russel       |       37 | 1.8 |
|          |                         |         31 | Ajit       | Dhungel      |          | 3.0 |
|       36 | Database Administration |         32 | Mehdi      | Vandenberghe |       36 | 1.9 |
|       37 | Web Development         |         33 | Dejon      | Howell       |       37 | 4.0 |
|       42 | System Administration   |         34 | Aliya      | Gulgowski    |       42 | 2.6 |
|       38 | Data Science            |         35 | Ana        | Tupajic      |       38 | 3.1 |
|          |                         |         36 | Hugo       | Duran        |          | 3.8 |
|       39 | Network Engineering     |            |            |              |          |     |
|       40 | Computer Programming    |            |            |              |          |     |
+----------+-------------------------+------------+------------+--------------+----------+-----+
(33 rows) -->
SELECT major FROM majors INNER JOIN students ON majors.major_id=students.major_id;
<!--               
+-------------------------+
|          major          |
+-------------------------+
| Database Administration |
| Web Development         |
| Database Administration |
| Game Design             |
| Game Design             |
| Game Design             |
| Game Design             |
| Web Development         |
| Database Administration |
| Data Science            |
| Web Development         |
| Game Design             |
| Web Development         |
| Database Administration |
| Data Science            |
| Game Design             |
| Database Administration |
| Data Science            |
| Web Development         |
| Database Administration |
| Web Development         |
| System Administration   |
| Data Science            |
+-------------------------+
(23 rows) -->
SELECT DISTINCT(major) FROM majors INNER JOIN students ON majors.major_id=students.major_id;
<!-- students=>               
+-------------------------+
|          major          |
+-------------------------+
| Database Administration |
| Game Design             |
| Data Science            |
| System Administration   |
| Web Development         |
+-------------------------+
(5 rows) -->
SELECT * FROM students RIGHT JOIN majors ON students.major_id = majors.major_id WHERE student_id IS NULL;
<!--                                              
+------------+------------+-----------+----------+-----+----------+----------------------+
| student_id | first_name | last_name | major_id | gpa | major_id |        major         |
+------------+------------+-----------+----------+-----+----------+----------------------+
|            |            |           |          |     |       39 | Network Engineering  |
|            |            |           |          |     |       40 | Computer Programming |
+------------+------------+-----------+----------+-----+----------+----------------------+
(2 rows) -->
SELECT major FROM students RIGHT JOIN majors ON students.major_id = majors.major_id WHERE student_id IS NULL;
<!-- students=>             
+----------------------+
|        major         |
+----------------------+
| Network Engineering  |
| Computer Programming |
+----------------------+
(2 rows) -->
SELECT * FROM students LEFT JOIN majors ON students.major_id = majors.major_id WHERE major='Data Science' OR gpa >= 3.8;
<!--                                            
+------------+------------+-----------+----------+-----+----------+-----------------+
| student_id | first_name | last_name | major_id | gpa | major_id |      major      |
+------------+------------+-----------+----------+-----+----------+-----------------+
|          8 | Kimberly   | Whitley   |       37 | 3.8 |       37 | Web Development |
|         11 | Casares    | Hijo      |       41 | 4.0 |       41 | Game Design     |
|         13 | Sterling   | Boss      |       41 | 3.9 |       41 | Game Design     |
|         17 | Efren      | Reilly    |       37 | 3.9 |       37 | Web Development |
|         20 | Larry      | Saunders  |       38 | 2.2 |       38 | Data Science    |
|         26 | Gerald     | Osiki     |       38 | 2.2 |       38 | Data Science    |
|         27 | Vanya      | Hassanah  |       41 | 4.0 |       41 | Game Design     |
|         29 | Helene     | Parker    |       38 | 3.4 |       38 | Data Science    |
|         33 | Dejon      | Howell    |       37 | 4.0 |       37 | Web Development |
|         35 | Ana        | Tupajic   |       38 | 3.1 |       38 | Data Science    |
|         36 | Hugo       | Duran     |          | 3.8 |          |                 |
+------------+------------+-----------+----------+-----+----------+-----------------+
(11 rows) -->
SELECT first_name, last_name, major, gpa FROM students LEFT JOIN majors ON students.major_id = majors.major_id WHERE major='Data Science' OR gpa >= 3.8;
<!-- students=>                          
+------------+-----------+-----------------+-----+
| first_name | last_name |      major      | gpa |
+------------+-----------+-----------------+-----+
| Kimberly   | Whitley   | Web Development | 3.8 |
| Casares    | Hijo      | Game Design     | 4.0 |
| Sterling   | Boss      | Game Design     | 3.9 |
| Efren      | Reilly    | Web Development | 3.9 |
| Larry      | Saunders  | Data Science    | 2.2 |
| Gerald     | Osiki     | Data Science    | 2.2 |
| Vanya      | Hassanah  | Game Design     | 4.0 |
| Helene     | Parker    | Data Science    | 3.4 |
| Dejon      | Howell    | Web Development | 4.0 |
| Ana        | Tupajic   | Data Science    | 3.1 |
| Hugo       | Duran     |                 | 3.8 |
+------------+-----------+-----------------+-----+
(11 rows) -->
SELECT * FROM students FULL JOIN majors ON students.major_id = majors.major_id WHERE first_name LIKE '%ri%' OR major LIKE '%ri%';
<!--                                              
+------------+------------+-----------+----------+-----+----------+---------------------+
| student_id | first_name | last_name | major_id | gpa | major_id |        major        |
+------------+------------+-----------+----------+-----+----------+---------------------+
|         14 | Brian      | Davis     |          | 2.3 |          |                     |
|         30 | Mariana    | Russel    |       37 | 1.8 |       37 | Web Development     |
|            |            |           |          |     |       39 | Network Engineering |
+------------+------------+-----------+----------+-----+----------+---------------------+
(3 rows) -->
students=> SELECT first_name, major FROM students FULL JOIN majors ON students.major_id = majors.major_id WHERE first_name LIKE '%ri%' OR major LIKE '%ri%';
<!--                   
+------------+---------------------+
| first_name |        major        |
+------------+---------------------+
| Brian      |                     |
| Mariana    | Web Development     |
|            | Network Engineering |
+------------+---------------------+
(3 rows) -->
SELECT students.major_id FROM students FULL JOIN majors ON students.major_id=majors.major_id;
<!-- students=>       
+----------+
| major_id |
+----------+
|       36 |
|          |
|       37 |
|       36 |
|          |
|       41 |
|          |
|       41 |
|          |
|       41 |
|       41 |
|       37 |
|          |
|       36 |
|       38 |
|       37 |
|       41 |
|       37 |
|          |
|       36 |
|       38 |
|       41 |
|       36 |
|       38 |
|       37 |
|          |
|       36 |
|       37 |
|       42 |
|       38 |
|          |
|          |
|          |
+----------+
(33 rows) -->
SELECT s.major_id FROM students AS s FULL JOIN majors AS m ON s.major_id = m.major_id;
<!--       
+----------+
| major_id |
+----------+
|       36 |
|          |
|       37 |
|       36 |
|          |
|       41 |
|          |
|       41 |
|          |
|       41 |
|       41 |
|       37 |
|          |
|       36 |
|       38 |
|       37 |
|       41 |
|       37 |
|          |
|       36 |
|       38 |
|       41 |
|       36 |
|       38 |
|       37 |
|          |
|       36 |
|       37 |
|       42 |
|       38 |
|          |
|          |
|          |
+----------+
(33 rows) -->
SELECT*FROM students FULL JOIN majors USING(major_id);
<!--                                            
+----------+------------+------------+--------------+-----+-------------------------+
| major_id | student_id | first_name |  last_name   | gpa |          major          |
+----------+------------+------------+--------------+-----+-------------------------+
|       36 |          6 | Rhea       | Kellems      | 2.5 | Database Administration |
|          |          7 | Emma       | Gilbert      |     |                         |
|       37 |          8 | Kimberly   | Whitley      | 3.8 | Web Development         |
|       36 |          9 | Jimmy      | Felipe       | 3.7 | Database Administration |
|          |         10 | Kyle       | Stimson      | 2.8 |                         |
|       41 |         11 | Casares    | Hijo         | 4.0 | Game Design             |
|          |         12 | Noe        | Savage       | 3.6 |                         |
|       41 |         13 | Sterling   | Boss         | 3.9 | Game Design             |
|          |         14 | Brian      | Davis        | 2.3 |                         |
|       41 |         15 | Kaija      | Uronen       | 3.7 | Game Design             |
|       41 |         16 | Faye       | Conn         | 2.1 | Game Design             |
|       37 |         17 | Efren      | Reilly       | 3.9 | Web Development         |
|          |         18 | Danh       | Nhung        | 2.4 |                         |
|       36 |         19 | Maxine     | Hagenes      | 2.9 | Database Administration |
|       38 |         20 | Larry      | Saunders     | 2.2 | Data Science            |
|       37 |         21 | Karl       | Kuhar        |     | Web Development         |
|       41 |         22 | Lieke      | Hazenveld    | 3.5 | Game Design             |
|       37 |         23 | Obie       | Hilpert      |     | Web Development         |
|          |         24 | Peter      | Booysen      | 2.9 |                         |
|       36 |         25 | Nathan     | Turner       | 3.3 | Database Administration |
|       38 |         26 | Gerald     | Osiki        | 2.2 | Data Science            |
|       41 |         27 | Vanya      | Hassanah     | 4.0 | Game Design             |
|       36 |         28 | Roxelana   | Florescu     | 3.2 | Database Administration |
|       38 |         29 | Helene     | Parker       | 3.4 | Data Science            |
|       37 |         30 | Mariana    | Russel       | 1.8 | Web Development         |
|          |         31 | Ajit       | Dhungel      | 3.0 |                         |
|       36 |         32 | Mehdi      | Vandenberghe | 1.9 | Database Administration |
|       37 |         33 | Dejon      | Howell       | 4.0 | Web Development         |
|       42 |         34 | Aliya      | Gulgowski    | 2.6 | System Administration   |
|       38 |         35 | Ana        | Tupajic      | 3.1 | Data Science            |
|          |         36 | Hugo       | Duran        | 3.8 |                         |
|       39 |            |            |              |     | Network Engineering     |
|       40 |            |            |              |     | Computer Programming    |
+----------+------------+------------+--------------+-----+-------------------------+
(33 rows) -->
SELECT*FROM students FULL JOIN majors USING(major_id) FULL JOIN majors_courses USING(major_id);
<!--                                                  
+----------+------------+------------+--------------+-----+-------------------------+-----------+
| major_id | student_id | first_name |  last_name   | gpa |          major          | course_id |
+----------+------------+------------+--------------+-----+-------------------------+-----------+
|       36 |          6 | Rhea       | Kellems      | 2.5 | Database Administration |        30 |
|       36 |          6 | Rhea       | Kellems      | 2.5 | Database Administration |        27 |
|       36 |          6 | Rhea       | Kellems      | 2.5 | Database Administration |        25 |
|       36 |          6 | Rhea       | Kellems      | 2.5 | Database Administration |        23 |
|          |          7 | Emma       | Gilbert      |     |                         |           |
|       37 |          8 | Kimberly   | Whitley      | 3.8 | Web Development         |        30 |
|       37 |          8 | Kimberly   | Whitley      | 3.8 | Web Development         |        33 |
|       37 |          8 | Kimberly   | Whitley      | 3.8 | Web Development         |        23 |
|       37 |          8 | Kimberly   | Whitley      | 3.8 | Web Development         |        24 |
|       36 |          9 | Jimmy      | Felipe       | 3.7 | Database Administration |        30 |
|       36 |          9 | Jimmy      | Felipe       | 3.7 | Database Administration |        27 |
|       36 |          9 | Jimmy      | Felipe       | 3.7 | Database Administration |        25 |
|       36 |          9 | Jimmy      | Felipe       | 3.7 | Database Administration |        23 |
|          |         10 | Kyle       | Stimson      | 2.8 |                         |           |
|       41 |         11 | Casares    | Hijo         | 4.0 | Game Design             |        36 |
|       41 |         11 | Casares    | Hijo         | 4.0 | Game Design             |        35 |
|       41 |         11 | Casares    | Hijo         | 4.0 | Game Design             |        34 |
|       41 |         11 | Casares    | Hijo         | 4.0 | Game Design             |        31 |
|          |         12 | Noe        | Savage       | 3.6 |                         |           |
|       41 |         13 | Sterling   | Boss         | 3.9 | Game Design             |        36 |
|       41 |         13 | Sterling   | Boss         | 3.9 | Game Design             |        35 |
|       41 |         13 | Sterling   | Boss         | 3.9 | Game Design             |        34 |
|       41 |         13 | Sterling   | Boss         | 3.9 | Game Design             |        31 |
|          |         14 | Brian      | Davis        | 2.3 |                         |           |
|       41 |         15 | Kaija      | Uronen       | 3.7 | Game Design             |        36 |
|       41 |         15 | Kaija      | Uronen       | 3.7 | Game Design             |        35 |
|       41 |         15 | Kaija      | Uronen       | 3.7 | Game Design             |        34 |
|       41 |         15 | Kaija      | Uronen       | 3.7 | Game Design             |        31 |
|       41 |         16 | Faye       | Conn         | 2.1 | Game Design             |        36 |
|       41 |         16 | Faye       | Conn         | 2.1 | Game Design             |        35 |
|       41 |         16 | Faye       | Conn         | 2.1 | Game Design             |        34 |
|       41 |         16 | Faye       | Conn         | 2.1 | Game Design             |        31 |
|       37 |         17 | Efren      | Reilly       | 3.9 | Web Development         |        30 |
|       37 |         17 | Efren      | Reilly       | 3.9 | Web Development         |        33 |
|       37 |         17 | Efren      | Reilly       | 3.9 | Web Development         |        23 |
|       37 |         17 | Efren      | Reilly       | 3.9 | Web Development         |        24 |
|          |         18 | Danh       | Nhung        | 2.4 |                         |           |
|       36 |         19 | Maxine     | Hagenes      | 2.9 | Database Administration |        30 |
|       36 |         19 | Maxine     | Hagenes      | 2.9 | Database Administration |        27 |
|       36 |         19 | Maxine     | Hagenes      | 2.9 | Database Administration |        25 |
|       36 |         19 | Maxine     | Hagenes      | 2.9 | Database Administration |        23 |
|       38 |         20 | Larry      | Saunders     | 2.2 | Data Science            |        34 |
|       38 |         20 | Larry      | Saunders     | 2.2 | Data Science            |        32 |
|       38 |         20 | Larry      | Saunders     | 2.2 | Data Science            |        28 |
|       38 |         20 | Larry      | Saunders     | 2.2 | Data Science            |        23 |
|       37 |         21 | Karl       | Kuhar        |     | Web Development         |        30 |
|       37 |         21 | Karl       | Kuhar        |     | Web Development         |        33 |
|       37 |         21 | Karl       | Kuhar        |     | Web Development         |        23 |
|       37 |         21 | Karl       | Kuhar        |     | Web Development         |        24 |
|       41 |         22 | Lieke      | Hazenveld    | 3.5 | Game Design             |        36 |
|       41 |         22 | Lieke      | Hazenveld    | 3.5 | Game Design             |        35 |
|       41 |         22 | Lieke      | Hazenveld    | 3.5 | Game Design             |        34 |
|       41 |         22 | Lieke      | Hazenveld    | 3.5 | Game Design             |        31 |
|       37 |         23 | Obie       | Hilpert      |     | Web Development         |        30 |
|       37 |         23 | Obie       | Hilpert      |     | Web Development         |        33 |
|       37 |         23 | Obie       | Hilpert      |     | Web Development         |        23 |
|       37 |         23 | Obie       | Hilpert      |     | Web Development         |        24 |
|          |         24 | Peter      | Booysen      | 2.9 |                         |           |
|       36 |         25 | Nathan     | Turner       | 3.3 | Database Administration |        30 |
|       36 |         25 | Nathan     | Turner       | 3.3 | Database Administration |        27 |
|       36 |         25 | Nathan     | Turner       | 3.3 | Database Administration |        25 |
|       36 |         25 | Nathan     | Turner       | 3.3 | Database Administration |        23 |
|       38 |         26 | Gerald     | Osiki        | 2.2 | Data Science            |        34 |
|       38 |         26 | Gerald     | Osiki        | 2.2 | Data Science            |        32 |
|       38 |         26 | Gerald     | Osiki        | 2.2 | Data Science            |        28 |
|       38 |         26 | Gerald     | Osiki        | 2.2 | Data Science            |        23 |
|       41 |         27 | Vanya      | Hassanah     | 4.0 | Game Design             |        36 |
|       41 |         27 | Vanya      | Hassanah     | 4.0 | Game Design             |        35 |
|       41 |         27 | Vanya      | Hassanah     | 4.0 | Game Design             |        34 |
|       41 |         27 | Vanya      | Hassanah     | 4.0 | Game Design             |        31 |
|       36 |         28 | Roxelana   | Florescu     | 3.2 | Database Administration |        30 |
|       36 |         28 | Roxelana   | Florescu     | 3.2 | Database Administration |        27 |
|       36 |         28 | Roxelana   | Florescu     | 3.2 | Database Administration |        25 |
|       36 |         28 | Roxelana   | Florescu     | 3.2 | Database Administration |        23 |
|       38 |         29 | Helene     | Parker       | 3.4 | Data Science            |        34 |
|       38 |         29 | Helene     | Parker       | 3.4 | Data Science            |        32 |
|       38 |         29 | Helene     | Parker       | 3.4 | Data Science            |        28 |
|       38 |         29 | Helene     | Parker       | 3.4 | Data Science            |        23 |
|       37 |         30 | Mariana    | Russel       | 1.8 | Web Development         |        30 |
|       37 |         30 | Mariana    | Russel       | 1.8 | Web Development         |        33 |
|       37 |         30 | Mariana    | Russel       | 1.8 | Web Development         |        23 |
|       37 |         30 | Mariana    | Russel       | 1.8 | Web Development         |        24 |
|          |         31 | Ajit       | Dhungel      | 3.0 |                         |           |
|       36 |         32 | Mehdi      | Vandenberghe | 1.9 | Database Administration |        30 |
|       36 |         32 | Mehdi      | Vandenberghe | 1.9 | Database Administration |        27 |
|       36 |         32 | Mehdi      | Vandenberghe | 1.9 | Database Administration |        25 |
|       36 |         32 | Mehdi      | Vandenberghe | 1.9 | Database Administration |        23 |
|       37 |         33 | Dejon      | Howell       | 4.0 | Web Development         |        30 |
|       37 |         33 | Dejon      | Howell       | 4.0 | Web Development         |        33 |
|       37 |         33 | Dejon      | Howell       | 4.0 | Web Development         |        23 |
|       37 |         33 | Dejon      | Howell       | 4.0 | Web Development         |        24 |
|       42 |         34 | Aliya      | Gulgowski    | 2.6 | System Administration   |        38 |
|       42 |         34 | Aliya      | Gulgowski    | 2.6 | System Administration   |        37 |
|       42 |         34 | Aliya      | Gulgowski    | 2.6 | System Administration   |        26 |
|       42 |         34 | Aliya      | Gulgowski    | 2.6 | System Administration   |        29 |
|       38 |         35 | Ana        | Tupajic      | 3.1 | Data Science            |        34 |
|       38 |         35 | Ana        | Tupajic      | 3.1 | Data Science            |        32 |
|       38 |         35 | Ana        | Tupajic      | 3.1 | Data Science            |        28 |
|       38 |         35 | Ana        | Tupajic      | 3.1 | Data Science            |        23 |
|          |         36 | Hugo       | Duran        | 3.8 |                         |           |
|       39 |            |            |              |     | Network Engineering     |        36 |
|       39 |            |            |              |     | Network Engineering     |        39 |
|       39 |            |            |              |     | Network Engineering     |        29 |
|       39 |            |            |              |     | Network Engineering     |        26 |
|       40 |            |            |              |     | Computer Programming    |        32 |
|       40 |            |            |              |     | Computer Programming    |        29 |
|       40 |            |            |              |     | Computer Programming    |        33 |
|       40 |            |            |              |     | Computer Programming    |        26 |
+----------+------------+------------+--------------+-----+-------------------------+-----------+
(108 rows) -->

SELECT*FROM students FULL JOIN majors USING(major_id) FULL JOIN majors_courses USING(major_id) FULL JOIN courses USING(course_id);
<!-- students=>                                                                  
+-----------+----------+------------+------------+--------------+-----+-------------------------+--------------------------------+
| course_id | major_id | student_id | first_name |  last_name   | gpa |          major          |             course             |
+-----------+----------+------------+------------+--------------+-----+-------------------------+--------------------------------+
|        30 |       36 |          6 | Rhea       | Kellems      | 2.5 | Database Administration | Web Applications               |
|        27 |       36 |          6 | Rhea       | Kellems      | 2.5 | Database Administration | SQL                            |
|        25 |       36 |          6 | Rhea       | Kellems      | 2.5 | Database Administration | Database Systems               |
|        23 |       36 |          6 | Rhea       | Kellems      | 2.5 | Database Administration | Data Structures and Algorithms |
|           |          |          7 | Emma       | Gilbert      |     |                         |                                |
|        30 |       37 |          8 | Kimberly   | Whitley      | 3.8 | Web Development         | Web Applications               |
|        33 |       37 |          8 | Kimberly   | Whitley      | 3.8 | Web Development         | Object-Oriented Programming    |
|        23 |       37 |          8 | Kimberly   | Whitley      | 3.8 | Web Development         | Data Structures and Algorithms |
|        24 |       37 |          8 | Kimberly   | Whitley      | 3.8 | Web Development         | Web Programming                |
|        30 |       36 |          9 | Jimmy      | Felipe       | 3.7 | Database Administration | Web Applications               |
|        27 |       36 |          9 | Jimmy      | Felipe       | 3.7 | Database Administration | SQL                            |
|        25 |       36 |          9 | Jimmy      | Felipe       | 3.7 | Database Administration | Database Systems               |
|        23 |       36 |          9 | Jimmy      | Felipe       | 3.7 | Database Administration | Data Structures and Algorithms |
|           |          |         10 | Kyle       | Stimson      | 2.8 |                         |                                |
|        36 |       41 |         11 | Casares    | Hijo         | 4.0 | Game Design             | Algorithms                     |
|        35 |       41 |         11 | Casares    | Hijo         | 4.0 | Game Design             | Game Architecture              |
|        34 |       41 |         11 | Casares    | Hijo         | 4.0 | Game Design             | Calculus                       |
|        31 |       41 |         11 | Casares    | Hijo         | 4.0 | Game Design             | Artificial Intelligence        |
|           |          |         12 | Noe        | Savage       | 3.6 |                         |                                |
|        36 |       41 |         13 | Sterling   | Boss         | 3.9 | Game Design             | Algorithms                     |
|        35 |       41 |         13 | Sterling   | Boss         | 3.9 | Game Design             | Game Architecture              |
|        34 |       41 |         13 | Sterling   | Boss         | 3.9 | Game Design             | Calculus                       |
|        31 |       41 |         13 | Sterling   | Boss         | 3.9 | Game Design             | Artificial Intelligence        |
|           |          |         14 | Brian      | Davis        | 2.3 |                         |                                |
|        36 |       41 |         15 | Kaija      | Uronen       | 3.7 | Game Design             | Algorithms                     |
|        35 |       41 |         15 | Kaija      | Uronen       | 3.7 | Game Design             | Game Architecture              |
|        34 |       41 |         15 | Kaija      | Uronen       | 3.7 | Game Design             | Calculus                       |
|        31 |       41 |         15 | Kaija      | Uronen       | 3.7 | Game Design             | Artificial Intelligence        |
|        36 |       41 |         16 | Faye       | Conn         | 2.1 | Game Design             | Algorithms                     |
|        35 |       41 |         16 | Faye       | Conn         | 2.1 | Game Design             | Game Architecture              |
|        34 |       41 |         16 | Faye       | Conn         | 2.1 | Game Design             | Calculus                       |
|        31 |       41 |         16 | Faye       | Conn         | 2.1 | Game Design             | Artificial Intelligence        |
|        30 |       37 |         17 | Efren      | Reilly       | 3.9 | Web Development         | Web Applications               |
|        33 |       37 |         17 | Efren      | Reilly       | 3.9 | Web Development         | Object-Oriented Programming    |
|        23 |       37 |         17 | Efren      | Reilly       | 3.9 | Web Development         | Data Structures and Algorithms |
|        24 |       37 |         17 | Efren      | Reilly       | 3.9 | Web Development         | Web Programming                |
|           |          |         18 | Danh       | Nhung        | 2.4 |                         |                                |
|        30 |       36 |         19 | Maxine     | Hagenes      | 2.9 | Database Administration | Web Applications               |
|        27 |       36 |         19 | Maxine     | Hagenes      | 2.9 | Database Administration | SQL                            |
|        25 |       36 |         19 | Maxine     | Hagenes      | 2.9 | Database Administration | Database Systems               |
|        23 |       36 |         19 | Maxine     | Hagenes      | 2.9 | Database Administration | Data Structures and Algorithms |
|        34 |       38 |         20 | Larry      | Saunders     | 2.2 | Data Science            | Calculus                       |
|        32 |       38 |         20 | Larry      | Saunders     | 2.2 | Data Science            | Python                         |
|        28 |       38 |         20 | Larry      | Saunders     | 2.2 | Data Science            | Machine Learning               |
|        23 |       38 |         20 | Larry      | Saunders     | 2.2 | Data Science            | Data Structures and Algorithms |
|        30 |       37 |         21 | Karl       | Kuhar        |     | Web Development         | Web Applications               |
|        33 |       37 |         21 | Karl       | Kuhar        |     | Web Development         | Object-Oriented Programming    |
|        23 |       37 |         21 | Karl       | Kuhar        |     | Web Development         | Data Structures and Algorithms |
|        24 |       37 |         21 | Karl       | Kuhar        |     | Web Development         | Web Programming                |
|        36 |       41 |         22 | Lieke      | Hazenveld    | 3.5 | Game Design             | Algorithms                     |
|        35 |       41 |         22 | Lieke      | Hazenveld    | 3.5 | Game Design             | Game Architecture              |
|        34 |       41 |         22 | Lieke      | Hazenveld    | 3.5 | Game Design             | Calculus                       |
|        31 |       41 |         22 | Lieke      | Hazenveld    | 3.5 | Game Design             | Artificial Intelligence        |
|        30 |       37 |         23 | Obie       | Hilpert      |     | Web Development         | Web Applications               |
|        33 |       37 |         23 | Obie       | Hilpert      |     | Web Development         | Object-Oriented Programming    |
|        23 |       37 |         23 | Obie       | Hilpert      |     | Web Development         | Data Structures and Algorithms |
|        24 |       37 |         23 | Obie       | Hilpert      |     | Web Development         | Web Programming                |
|           |          |         24 | Peter      | Booysen      | 2.9 |                         |                                |
|        30 |       36 |         25 | Nathan     | Turner       | 3.3 | Database Administration | Web Applications               |
|        27 |       36 |         25 | Nathan     | Turner       | 3.3 | Database Administration | SQL                            |
|        25 |       36 |         25 | Nathan     | Turner       | 3.3 | Database Administration | Database Systems               |
|        23 |       36 |         25 | Nathan     | Turner       | 3.3 | Database Administration | Data Structures and Algorithms |
|        34 |       38 |         26 | Gerald     | Osiki        | 2.2 | Data Science            | Calculus                       |
|        32 |       38 |         26 | Gerald     | Osiki        | 2.2 | Data Science            | Python                         |
|        28 |       38 |         26 | Gerald     | Osiki        | 2.2 | Data Science            | Machine Learning               |
|        23 |       38 |         26 | Gerald     | Osiki        | 2.2 | Data Science            | Data Structures and Algorithms |
|        36 |       41 |         27 | Vanya      | Hassanah     | 4.0 | Game Design             | Algorithms                     |
|        35 |       41 |         27 | Vanya      | Hassanah     | 4.0 | Game Design             | Game Architecture              |
|        34 |       41 |         27 | Vanya      | Hassanah     | 4.0 | Game Design             | Calculus                       |
|        31 |       41 |         27 | Vanya      | Hassanah     | 4.0 | Game Design             | Artificial Intelligence        |
|        30 |       36 |         28 | Roxelana   | Florescu     | 3.2 | Database Administration | Web Applications               |
|        27 |       36 |         28 | Roxelana   | Florescu     | 3.2 | Database Administration | SQL                            |
|        25 |       36 |         28 | Roxelana   | Florescu     | 3.2 | Database Administration | Database Systems               |
|        23 |       36 |         28 | Roxelana   | Florescu     | 3.2 | Database Administration | Data Structures and Algorithms |
|        34 |       38 |         29 | Helene     | Parker       | 3.4 | Data Science            | Calculus                       |
|        32 |       38 |         29 | Helene     | Parker       | 3.4 | Data Science            | Python                         |
|        28 |       38 |         29 | Helene     | Parker       | 3.4 | Data Science            | Machine Learning               |
|        23 |       38 |         29 | Helene     | Parker       | 3.4 | Data Science            | Data Structures and Algorithms |
|        30 |       37 |         30 | Mariana    | Russel       | 1.8 | Web Development         | Web Applications               |
|        33 |       37 |         30 | Mariana    | Russel       | 1.8 | Web Development         | Object-Oriented Programming    |
|        23 |       37 |         30 | Mariana    | Russel       | 1.8 | Web Development         | Data Structures and Algorithms |
|        24 |       37 |         30 | Mariana    | Russel       | 1.8 | Web Development         | Web Programming                |
|           |          |         31 | Ajit       | Dhungel      | 3.0 |                         |                                |
|        30 |       36 |         32 | Mehdi      | Vandenberghe | 1.9 | Database Administration | Web Applications               |
|        27 |       36 |         32 | Mehdi      | Vandenberghe | 1.9 | Database Administration | SQL                            |
|        25 |       36 |         32 | Mehdi      | Vandenberghe | 1.9 | Database Administration | Database Systems               |
|        23 |       36 |         32 | Mehdi      | Vandenberghe | 1.9 | Database Administration | Data Structures and Algorithms |
|        30 |       37 |         33 | Dejon      | Howell       | 4.0 | Web Development         | Web Applications               |
|        33 |       37 |         33 | Dejon      | Howell       | 4.0 | Web Development         | Object-Oriented Programming    |
|        23 |       37 |         33 | Dejon      | Howell       | 4.0 | Web Development         | Data Structures and Algorithms |
|        24 |       37 |         33 | Dejon      | Howell       | 4.0 | Web Development         | Web Programming                |
|        38 |       42 |         34 | Aliya      | Gulgowski    | 2.6 | System Administration   | Server Administration          |
|        37 |       42 |         34 | Aliya      | Gulgowski    | 2.6 | System Administration   | UNIX                           |
|        26 |       42 |         34 | Aliya      | Gulgowski    | 2.6 | System Administration   | Computer Networks              |
|        29 |       42 |         34 | Aliya      | Gulgowski    | 2.6 | System Administration   | Computer Systems               |
|        34 |       38 |         35 | Ana        | Tupajic      | 3.1 | Data Science            | Calculus                       |
|        32 |       38 |         35 | Ana        | Tupajic      | 3.1 | Data Science            | Python                         |
|        28 |       38 |         35 | Ana        | Tupajic      | 3.1 | Data Science            | Machine Learning               |
|        23 |       38 |         35 | Ana        | Tupajic      | 3.1 | Data Science            | Data Structures and Algorithms |
|           |          |         36 | Hugo       | Duran        | 3.8 |                         |                                |
|        36 |       39 |            |            |              |     | Network Engineering     | Algorithms                     |
|        39 |       39 |            |            |              |     | Network Engineering     | Network Security               |
|        29 |       39 |            |            |              |     | Network Engineering     | Computer Systems               |
|        26 |       39 |            |            |              |     | Network Engineering     | Computer Networks              |
|        32 |       40 |            |            |              |     | Computer Programming    | Python                         |
|        29 |       40 |            |            |              |     | Computer Programming    | Computer Systems               |
|        33 |       40 |            |            |              |     | Computer Programming    | Object-Oriented Programming    |
|        26 |       40 |            |            |              |     | Computer Programming    | Computer Networks              |
+-----------+----------+------------+------------+--------------+-----+-------------------------+--------------------------------+
(108 rows) -->

SELECT DISTINCT(course) FROM students RIGHT JOIN majors USING(major_id) INNER JOIN majors_courses USING(major_id) INNER JOIN courses USING(course_id) WHERE (first_name = 'Obie' AND last_name = 'Hilpert') OR student_id IS NULL ORDER BY course DESC;
<!-- students=>                  
+--------------------------------+
|             course             |
+--------------------------------+
| Web Programming                |
| Web Applications               |
| Python                         |
| Object-Oriented Programming    |
| Network Security               |
| Data Structures and Algorithms |
| Computer Systems               |
| Computer Networks              |
| Algorithms                     |
+--------------------------------+
(9 rows) -->
SELECT*FROM students RIGHT JOIN majors USING(major_id) INNER JOIN majors_courses USING(major_id) INNER JOIN courses USING(course_id) WHERE (first_name = 'Obie' AND last_name = 'Hilpert') OR student_id IS NULL ORDER BY course DESC;
students=>                                                               
<!-- +-----------+----------+------------+------------+-----------+-----+----------------------+--------------------------------+
| course_id | major_id | student_id | first_name | last_name | gpa |        major         |             course             |
+-----------+----------+------------+------------+-----------+-----+----------------------+--------------------------------+
|        24 |       37 |         23 | Obie       | Hilpert   |     | Web Development      | Web Programming                |
|        30 |       37 |         23 | Obie       | Hilpert   |     | Web Development      | Web Applications               |
|        32 |       40 |            |            |           |     | Computer Programming | Python                         |
|        33 |       40 |            |            |           |     | Computer Programming | Object-Oriented Programming    |
|        33 |       37 |         23 | Obie       | Hilpert   |     | Web Development      | Object-Oriented Programming    |
|        39 |       39 |            |            |           |     | Network Engineering  | Network Security               |
|        23 |       37 |         23 | Obie       | Hilpert   |     | Web Development      | Data Structures and Algorithms |
|        29 |       39 |            |            |           |     | Network Engineering  | Computer Systems               |
|        29 |       40 |            |            |           |     | Computer Programming | Computer Systems               |
|        26 |       39 |            |            |           |     | Network Engineering  | Computer Networks              |
|        26 |       40 |            |            |           |     | Computer Programming | Computer Networks              |
|        36 |       39 |            |            |           |     | Network Engineering  | Algorithms                     |
+-----------+----------+------------+------------+-----------+-----+----------------------+--------------------------------+
(12 rows) -->
SELECT course, COUNT(student_id) AS student_count
students-> FROM students
students-> FULL JOIN majors USING(major_id)
students-> FULL JOIN majors_courses USING(major_id)
students-> FULL JOIN courses USING(course_id)
students-> GROUP BY course
students-> HAVING COUNT(student_id) = 1
students-> ORDER BY course;
<!--                      
+-----------------------+---------------+
|        course         | student_count |
+-----------------------+---------------+
| Computer Networks     |             1 |
| Computer Systems      |             1 |
| Server Administration |             1 |
| UNIX                  |             1 |
+-----------------------+---------------+
(4 rows) -->
SELECT course, COUNT(student_id) AS student_count FROM students
students-> RIGT JOIN majors USING(major_id)
students-> INNER JOIN majors_courses USING(major_id)
students-> INNER JOIN courses USING(course_id)
students-> GROUP BY course
students-> HAVING COUNT(student_id) = 1
students-> ORDER BY course;
<!-- students=>                      
+-----------------------+---------------+
|        course         | student_count |
+-----------------------+---------------+
| Computer Networks     |             1 |
| Computer Systems      |             1 |
| Server Administration |             1 |
| UNIX                  |             1 |
+-----------------------+---------------+
(4 rows) -->
SELECT course FROM students RIGHT JOIN majors USING(major_id) INNER JOIN majors_courses USING(major_id) INNER JOIN courses USING(course_id) GROUP BY course HAVING COUNT(student_id) = 1 ORDER BY course;
<!-- students=>              
+-----------------------+
|        course         |
+-----------------------+
| Computer Networks     |
| Computer Systems      |
| Server Administration |
| UNIX                  |
+-----------------------+
(4 rows) -->
./student_info.sh
<!-- output:

~~ My Computer Science Students ~~


First name, last name, and GPA of students with a 4.0 GPA:
Casares|Hijo|4.0
Vanya|Hassanah|4.0
Dejon|Howell|4.0

All course names whose first letter is before 'D' in the alphabet:
Computer Networks
Computer Systems
Artificial Intelligence
Calculus
Algorithms

First name, last name, and GPA of students whose last name begins with an 'R' or after and have a GPA greater than 3.8 or less than 2.0:
Efren|Reilly|3.9
Mariana|Russel|1.8
Mehdi|Vandenberghe|1.9

Last name of students whose last name contains a case insensitive 'sa' or have an 'r' as the second to last letter:
Gilbert
Savage
Saunders
Hilpert
Hassanah

First name, last name, and GPA of students who have not selected a major and either their first name begins with 'D' or they have a GPA greater than 3.0:
Noe|Savage|3.6
Danh|Nhung|2.4
Hugo|Duran|3.8

Course name of the first five courses, in reverse alphabetical order, that have an 'e' as the second letter or end with an 's':
Web Programming
Web Applications
Server Administration
Network Security
Database Systems

Average GPA of all students rounded to two decimal places:
3.09

Major ID, total number of students in a column named 'number_of_students', and average GPA rounded to two decimal places in a column name 'average_gpa', for each major ID in the students table having a student count greater than 1:
|8|2.97
41|6|3.53
38|4|2.73
36|6|2.92
37|6|3.38

List of majors, in alphabetical order, that either no student is taking or has a student whose first name contains a case insensitive 'ma':
Computer Programming
Database Administration
Network Engineering
Web Development

List of unique courses, in reverse alphabetical order, that no student or 'Obie Hilpert' is taking:
Web Programming
Web Applications
Python
Object-Oriented Programming
Network Security
Data Structures and Algorithms
Computer Systems
Computer Networks
Algorithms

List of courses, in alphabetical order, with only one student enrolled:
Computer Networks
Computer Systems
Server Administration
UNIX -->
