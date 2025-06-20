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
cp courses.csv courses_test.csv
SELECT*FROM majors;
<!-- students=>                    
+----------+-------------------------+
| major_id |          major          |
+----------+-------------------------+
|        1 | Database Administration |
|        2 | major                   |
|        3 | Web Development         |
|        4 | Data Science            |
+----------+-------------------------+
(4 rows) -->
TRUNCATE students, majors_courses, majors; 
TRUNCATE majors_courses, courses;
SELECT*FROM majors;
<!--                    
+----------+-------------------------+
| major_id |          major          |
+----------+-------------------------+
|        9 | Database Administration |
|       10 | Web Development         |
|       11 | Data Science            |
+----------+-------------------------+
(3 rows) -->
./insert_data.sh
<!-- output:
Inserted into majors, Database Administration
Inserted into majors, Web Development
Inserted into majors, Data Science -->
./insert_data.sh
<!-- output:
Inserted into majors, Database Administration
Inserted into courses, Data Structures and Algorithms
Inserted into majors, Web Development
Inserted into courses, Web Programming
Inserted into courses, Database Systems
Inserted into majors, Data Science -->

SELECT*FROM courses;
<!--                        
+-----------+--------------------------------+
| course_id |             course             |
+-----------+--------------------------------+
|         2 | Data Structures and Algorithms |
|         3 | Web Programming                |
|         4 | Database Systems               |
+-----------+--------------------------------+
(3 rows) -->
cp students.csv students_test.csv
./insert_data.sh
<!-- output:
TRUNCATE TABLE
Inserted into majors, Database Administration
Inserted into courses, Data Structures and Algorithms
Inserted into majors_courses, Database Administration : Data Structures and Algorithms
Inserted into majors, Web Development
Inserted into courses, Web Programming
Inserted into majors_courses, Web Development : Web Programming
Inserted into courses, Database Systems
Inserted into majors_courses, Database Administration : Database Systems
Inserted into majors, Data Science
Inserted into majors_courses, Data Science : Data Structures and Algorithms
Inserted into majors, Network Engineering
Inserted into courses, Computer Networks
Inserted into majors_courses, Network Engineering : Computer Networks
Inserted into courses, SQL
Inserted into majors_courses, Database Administration : SQL
Inserted into courses, Machine Learning
Inserted into majors_courses, Data Science : Machine Learning
Inserted into courses, Computer Systems
Inserted into majors_courses, Network Engineering : Computer Systems
Inserted into majors, Computer Programming
Inserted into majors_courses, Computer Programming : Computer Networks
Inserted into courses, Web Applications
Inserted into majors_courses, Database Administration : Web Applications
Inserted into majors, Game Design
Inserted into courses, Artificial Intelligence
Inserted into majors_courses, Game Design : Artificial Intelligence
Inserted into courses, Python
Inserted into majors_courses, Data Science : Python
Inserted into courses, Object-Oriented Programming
Inserted into majors_courses, Computer Programming : Object-Oriented Programming
Inserted into majors, System Administration
Inserted into majors_courses, System Administration : Computer Systems
Inserted into courses, Calculus
Inserted into majors_courses, Game Design : Calculus
Inserted into majors_courses, Web Development : Data Structures and Algorithms
Inserted into majors_courses, Data Science : Calculus
Inserted into majors_courses, Web Development : Object-Oriented Programming
Inserted into courses, Game Architecture
Inserted into majors_courses, Game Design : Game Architecture
Inserted into majors_courses, System Administration : Computer Networks
Inserted into courses, Algorithms
Inserted into majors_courses, Game Design : Algorithms
Inserted into courses, UNIX
Inserted into majors_courses, System Administration : UNIX
Inserted into courses, Server Administration
Inserted into majors_courses, System Administration : Server Administration
Inserted into majors_courses, Computer Programming : Computer Systems
Inserted into majors_courses, Computer Programming : Python
Inserted into courses, Network Security
Inserted into majors_courses, Network Engineering : Network Security
Inserted into majors_courses, Web Development : Web Applications
Inserted into majors_courses, Network Engineering : Algorithms
Inserted into students, Rhea Kellems
Inserted into students, Emma Gilbert
Inserted into students, Kimberly Whitley
Inserted into students, Jimmy Felipe
Inserted into students, Kyle Stimson
Inserted into students, Casares Hijo
Inserted into students, Noe Savage
Inserted into students, Sterling Boss
Inserted into students, Brian Davis
Inserted into students, Kaija Uronen
Inserted into students, Faye Conn
Inserted into students, Efren Reilly
Inserted into students, Danh Nhung
Inserted into students, Maxine Hagenes
Inserted into students, Larry Saunders
Inserted into students, Karl Kuhar
Inserted into students, Lieke Hazenveld
Inserted into students, Obie Hilpert
Inserted into students, Peter Booysen
Inserted into students, Nathan Turner
Inserted into students, Gerald Osiki
Inserted into students, Vanya Hassanah
Inserted into students, Roxelana Florescu
Inserted into students, Helene Parker
Inserted into students, Mariana Russel
Inserted into students, Ajit Dhungel
Inserted into students, Mehdi Vandenberghe
Inserted into students, Dejon Howell
Inserted into students, Aliya Gulgowski
Inserted into students, Ana Tupajic
Inserted into students, Hugo Duran -->
SELECT*FROM students;
<!--                               
+------------+------------+--------------+----------+-----+
| student_id | first_name |  last_name   | major_id | gpa |
+------------+------------+--------------+----------+-----+
|          6 | Rhea       | Kellems      |       39 | 2.5 |
|          7 | Emma       | Gilbert      |          |     |
|          8 | Kimberly   | Whitley      |       40 | 3.8 |
|          9 | Jimmy      | Felipe       |       39 | 3.7 |
|         10 | Kyle       | Stimson      |          | 2.8 |
|         11 | Casares    | Hijo         |       44 | 4.0 |
|         12 | Noe        | Savage       |          | 3.6 |
|         13 | Sterling   | Boss         |       44 | 3.9 |
|         14 | Brian      | Davis        |          | 2.3 |
|         15 | Kaija      | Uronen       |       44 | 3.7 |
|         16 | Faye       | Conn         |       44 | 2.1 |
|         17 | Efren      | Reilly       |       40 | 3.9 |
|         18 | Danh       | Nhung        |          | 2.4 |
|         19 | Maxine     | Hagenes      |       39 | 2.9 |
|         20 | Larry      | Saunders     |       41 | 2.2 |
|         21 | Karl       | Kuhar        |       40 |     |
|         22 | Lieke      | Hazenveld    |       44 | 3.5 |
|         23 | Obie       | Hilpert      |       40 |     |
|         24 | Peter      | Booysen      |          | 2.9 |
|         25 | Nathan     | Turner       |       39 | 3.3 |
|         26 | Gerald     | Osiki        |       41 | 2.2 |
|         27 | Vanya      | Hassanah     |       44 | 4.0 |
|         28 | Roxelana   | Florescu     |       39 | 3.2 |
|         29 | Helene     | Parker       |       41 | 3.4 |
|         30 | Mariana    | Russel       |       40 | 1.8 |
|         31 | Ajit       | Dhungel      |          | 3.0 |
|         32 | Mehdi      | Vandenberghe |       39 | 1.9 |
|         33 | Dejon      | Howell       |       40 | 4.0 |
|         34 | Aliya      | Gulgowski    |       45 | 2.6 |
|         35 | Ana        | Tupajic      |       41 | 3.1 |
|         36 | Hugo       | Duran        |          | 3.8 |
+------------+------------+--------------+----------+-----+
(31 rows) -->
SELECT*FROM majors;
# showed unique majors
<!-- students=>                    
+----------+-------------------------+
| major_id |          major          |
+----------+-------------------------+
|       39 | Database Administration |
|       40 | Web Development         |
|       41 | Data Science            |
|       42 | Network Engineering     |
|       43 | Computer Programming    |
|       44 | Game Design             |
|       45 | System Administration   |
+----------+-------------------------+
(7 rows) -->
SELECT*FROM courses;
<!--                        
+-----------+--------------------------------+
| course_id |             course             |
+-----------+--------------------------------+
|        29 | Data Structures and Algorithms |
|        30 | Web Programming                |
|        31 | Database Systems               |
|        32 | Computer Networks              |
|        33 | SQL                            |
|        34 | Machine Learning               |
|        35 | Computer Systems               |
|        36 | Web Applications               |
|        37 | Artificial Intelligence        |
|        38 | Python                         |
|        39 | Object-Oriented Programming    |
|        40 | Calculus                       |
|        41 | Game Architecture              |
|        42 | Algorithms                     |
|        43 | UNIX                           |
|        44 | Server Administration          |
|        45 | Network Security               |
+-----------+--------------------------------+
(17 rows) -->
SELECT*FROM majors_courses;
<!--             
+----------+-----------+
| major_id | course_id |
+----------+-----------+
|       39 |        29 |
|       40 |        30 |
|       39 |        31 |
|       41 |        29 |
|       42 |        32 |
|       39 |        33 |
|       41 |        34 |
|       42 |        35 |
|       43 |        32 |
|       39 |        36 |
|       44 |        37 |
|       41 |        38 |
|       43 |        39 |
|       45 |        35 |
|       44 |        40 |
|       40 |        29 |
|       41 |        40 |
|       40 |        39 |
|       44 |        41 |
|       45 |        32 |
|       44 |        42 |
|       45 |        43 |
|       45 |        44 |
|       43 |        35 |
|       43 |        38 |
|       42 |        45 |
|       40 |        36 |
|       42 |        42 |
+----------+-----------+
(28 rows) -->
pg_dump --help
<!-- output:
pg_dump dumps a database as a text file or to other formats.

Usage:
  pg_dump [OPTION]... [DBNAME]

General options:
  -f, --file=FILENAME          output file or directory name
  -F, --format=c|d|t|p         output file format (custom, directory, tar,
                               plain text (default))
  -j, --jobs=NUM               use this many parallel jobs to dump
  -v, --verbose                verbose mode
  -V, --version                output version information, then exit
  -Z, --compress=0-9           compression level for compressed formats
  --lock-wait-timeout=TIMEOUT  fail after waiting TIMEOUT for a table lock
  --no-sync                    do not wait for changes to be written safely to disk
  -?, --help                   show this help, then exit

Options controlling the output content:
  -a, --data-only              dump only the data, not the schema
  -b, --blobs                  include large objects in dump
  -B, --no-blobs               exclude large objects in dump
  -c, --clean                  clean (drop) database objects before recreating
  -C, --create                 include commands to create database in dump
  -E, --encoding=ENCODING      dump the data in encoding ENCODING
  -n, --schema=PATTERN         dump the specified schema(s) only
  -N, --exclude-schema=PATTERN do NOT dump the specified schema(s)
  -O, --no-owner               skip restoration of object ownership in
                               plain-text format
  -s, --schema-only            dump only the schema, no data
  -S, --superuser=NAME         superuser user name to use in plain-text format
  -t, --table=PATTERN          dump the specified table(s) only
  -T, --exclude-table=PATTERN  do NOT dump the specified table(s)
  -x, --no-privileges          do not dump privileges (grant/revoke)
  --binary-upgrade             for use by upgrade utilities only
  --column-inserts             dump data as INSERT commands with column names
  --disable-dollar-quoting     disable dollar quoting, use SQL standard quoting
  --disable-triggers           disable triggers during data-only restore
  --enable-row-security        enable row security (dump only content user has
                               access to)
  --exclude-table-data=PATTERN do NOT dump data for the specified table(s)
  --extra-float-digits=NUM     override default setting for extra_float_digits
  --if-exists                  use IF EXISTS when dropping objects
  --inserts                    dump data as INSERT commands, rather than COPY
  --load-via-partition-root    load partitions via the root table
  --no-comments                do not dump comments
  --no-publications            do not dump publications
  --no-security-labels         do not dump security label assignments
  --no-subscriptions           do not dump subscriptions
  --no-synchronized-snapshots  do not use synchronized snapshots in parallel jobs
  --no-tablespaces             do not dump tablespace assignments
  --no-unlogged-table-data     do not dump unlogged table data
  --on-conflict-do-nothing     add ON CONFLICT DO NOTHING to INSERT commands
  --quote-all-identifiers      quote all identifiers, even if not key words
  --rows-per-insert=NROWS      number of rows per INSERT; implies --inserts
  --section=SECTION            dump named section (pre-data, data, or post-data)
  --serializable-deferrable    wait until the dump can run without anomalies
  --snapshot=SNAPSHOT          use given snapshot for the dump
  --strict-names               require table and/or schema include patterns to
                               match at least one entity each
  --use-set-session-authorization
                               use SET SESSION AUTHORIZATION commands instead of
                               ALTER OWNER commands to set ownership

Connection options:
  -d, --dbname=DBNAME      database to dump
  -h, --host=HOSTNAME      database server host or socket directory
  -p, --port=PORT          database server port number
  -U, --username=NAME      connect as specified database user
  -w, --no-password        never prompt for password
  -W, --password           force password prompt (should happen automatically)
  --role=ROLENAME          do SET ROLE before dump

If no database name is supplied, then the PGDATABASE environment
variable value is used.

Report bugs to <pgsql-bugs@lists.postgresql.org>. -->
pg_dump --clean --create --inserts --username=freecodecamp students > students.sql
