# In this 210-lesson course, you will build an interactive Bash program that stores rental information for your bike rental shop using PostgreSQL.
psql --username=freecodecamp --dbname=postgres
<!-- output:
Border style is 2.
Title is " ".
Pager usage is off.
psql (12.17 (Ubuntu 12.17-1.pgdg22.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help. -->
 \l
<!-- postgres=>                                List of databases
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
CREATE DATABASE bikes;
 \l
<!-- postgres=>                                  List of databases
+-----------+--------------+----------+---------+---------+-----------------------+
|   Name    |    Owner     | Encoding | Collate |  Ctype  |   Access privileges   |
+-----------+--------------+----------+---------+---------+-----------------------+
| bikes     | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| postgres  | postgres     | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| template0 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
| template1 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
+-----------+--------------+----------+---------+---------+-----------------------+
(4 rows) -->
\c bikes
<!-- SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "bikes" as user "freecodecamp".
bikes=>  -->
CREATE TABLE bikes();
\d
<!-- bikes=>             List of relations
+--------+-------+-------+--------------+
| Schema | Name  | Type  |    Owner     |
+--------+-------+-------+--------------+
| public | bikes | table | freecodecamp |
+--------+-------+-------+--------------+
(1 row) -->
ALTER TABLE bikes ADD COLUMN bike_id SERIAL PRIMARY KEY;
\d bikes
<!-- bikes=>                                 Table "public.bikes"
+---------+---------+-----------+----------+----------------------------------------+
| Column  |  Type   | Collation | Nullable |                Default                 |
+---------+---------+-----------+----------+----------------------------------------+
| bike_id | integer |           | not null | nextval('bikes_bike_id_seq'::regclass) |
+---------+---------+-----------+----------+----------------------------------------+
Indexes:
    "bikes_pkey" PRIMARY KEY, btree (bike_id) -->
ALTER TABLE bikes  ADD COLUMN type VARCHAR(50) NOT NULL;
\d bikes
<!-- bikes=>                                        Table "public.bikes"
+---------+-----------------------+-----------+----------+----------------------------------------+
| Column  |         Type          | Collation | Nullable |                Default                 |
+---------+-----------------------+-----------+----------+----------------------------------------+
| bike_id | integer               |           | not null | nextval('bikes_bike_id_seq'::regclass) |
| type    | character varying(50) |           | not null |                                        |
+---------+-----------------------+-----------+----------+----------------------------------------+
Indexes:
    "bikes_pkey" PRIMARY KEY, btree (bike_id) -->
ALTER TABLE bikes ADD COLUMN size INT NOT NULL;
ALTER TABLE bikes ADD COLUMN available BOOLEAN NOT NULL DEFAULT TRUE;
\d bikes
<!-- output:
                                        Table "public.bikes"
+-----------+-----------------------+-----------+----------+----------------------------------------+
|  Column   |         Type          | Collation | Nullable |                Default                 |
+-----------+-----------------------+-----------+----------+----------------------------------------+
| bike_id   | integer               |           | not null | nextval('bikes_bike_id_seq'::regclass) |
| type      | character varying(50) |           | not null |                                        |
| size      | integer               |           | not null |                                        |
| available | boolean               |           | not null | true                                   |
+-----------+-----------------------+-----------+----------+----------------------------------------+
Indexes:
    "bikes_pkey" PRIMARY KEY, btree (bike_id) -->
CREATE TABLE customers();
ALTER TABLE customers ADD COLUMN customer_id SERIAL PRIMARY KEY;
ALTER TABLE customers ADD COLUMN phone VARCHAR(15) NOT NULL UNIQUE;
ALTER TABLE customers ADD COLUMN name VARCHAR(40) NOT NULL;
\d customers
<!-- bikes=>                                            Table "public.customers"
+-------------+-----------------------+-----------+----------+------------------------------------------------+
|   Column    |         Type          | Collation | Nullable |                    Default                     |
+-------------+-----------------------+-----------+----------+------------------------------------------------+
| customer_id | integer               |           | not null | nextval('customers_customer_id_seq'::regclass) |
| phone       | character varying(15) |           | not null |                                                |
| name        | character varying(40) |           | not null |                                                |
+-------------+-----------------------+-----------+----------+------------------------------------------------+
Indexes:
    "customers_pkey" PRIMARY KEY, btree (customer_id)
    "customers_phone_key" UNIQUE CONSTRAINT, btree (phone) -->
CREATE TABLE rentals();
ALTER TABLE rentals ADD COLUMN rental_id SERIAL PRIMARY KEY;
ALTER TABLE rentals ADD COLUMN customer_id INT NOT NULL;
ALTER TABLE rentals ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id);
\d rentals
<!-- output:
                                   Table "public.rentals"
+-------------+---------+-----------+----------+--------------------------------------------+
|   Column    |  Type   | Collation | Nullable |                  Default                   |
+-------------+---------+-----------+----------+--------------------------------------------+
| rental_id   | integer |           | not null | nextval('rentals_rental_id_seq'::regclass) |
| customer_id | integer |           | not null |                                            |
+-------------+---------+-----------+----------+--------------------------------------------+
Indexes:
    "rentals_pkey" PRIMARY KEY, btree (rental_id)
Foreign-key constraints:
    "rentals_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id) -->
ALTER TABLE rentals ADD COLUMN bike_id INT NOT NULL;
ALTER TABLE rentals ADD FOREIGN KEY (bike_id) REFERENCES bikes(bike_id);
\d rentals
<!-- bikes=>                                    Table "public.rentals"
+-------------+---------+-----------+----------+--------------------------------------------+
|   Column    |  Type   | Collation | Nullable |                  Default                   |
+-------------+---------+-----------+----------+--------------------------------------------+
| rental_id   | integer |           | not null | nextval('rentals_rental_id_seq'::regclass) |
| customer_id | integer |           | not null |                                            |
| bike_id     | integer |           | not null |                                            |
+-------------+---------+-----------+----------+--------------------------------------------+
Indexes:
    "rentals_pkey" PRIMARY KEY, btree (rental_id)
Foreign-key constraints:
    "rentals_bike_id_fkey" FOREIGN KEY (bike_id) REFERENCES bikes(bike_id)
    "rentals_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id) -->
ALTER TABLE rentals ADD COLUMN date_rented DATE NOT NULL DEFAULT NOW();
\d rentals
<!-- bikes=>                                    Table "public.rentals"
+-------------+---------+-----------+----------+--------------------------------------------+
|   Column    |  Type   | Collation | Nullable |                  Default                   |
+-------------+---------+-----------+----------+--------------------------------------------+
| rental_id   | integer |           | not null | nextval('rentals_rental_id_seq'::regclass) |
| customer_id | integer |           | not null |                                            |
| bike_id     | integer |           | not null |                                            |
| date_rented | date    |           | not null | now()                                      |
+-------------+---------+-----------+----------+--------------------------------------------+
Indexes:
    "rentals_pkey" PRIMARY KEY, btree (rental_id)
Foreign-key constraints:
    "rentals_bike_id_fkey" FOREIGN KEY (bike_id) REFERENCES bikes(bike_id)
    "rentals_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id) -->
ALTER TABLE rentals ADD COLUMN date_returned DATE;
\d rentals
 <!-- output:
                                    Table "public.rentals"
+---------------+---------+-----------+----------+--------------------------------------------+
|    Column     |  Type   | Collation | Nullable |                  Default                   |
+---------------+---------+-----------+----------+--------------------------------------------+
| rental_id     | integer |           | not null | nextval('rentals_rental_id_seq'::regclass) |
| customer_id   | integer |           | not null |                                            |
| bike_id       | integer |           | not null |                                            |
| date_rented   | date    |           | not null | now()                                      |
| date_returned | date    |           |          |                                            |
+---------------+---------+-----------+----------+--------------------------------------------+
Indexes:
    "rentals_pkey" PRIMARY KEY, btree (rental_id)
Foreign-key constraints:
    "rentals_bike_id_fkey" FOREIGN KEY (bike_id) REFERENCES bikes(bike_id)
    "rentals_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id) -->
\d
<!-- bikes=>                        List of relations
+--------+---------------------------+----------+--------------+
| Schema |           Name            |   Type   |    Owner     |
+--------+---------------------------+----------+--------------+
| public | bikes                     | table    | freecodecamp |
| public | bikes_bike_id_seq         | sequence | freecodecamp |
| public | customers                 | table    | freecodecamp |
| public | customers_customer_id_seq | sequence | freecodecamp |
| public | rentals                   | table    | freecodecamp |
| public | rentals_rental_id_seq     | sequence | freecodecamp |
+--------+---------------------------+----------+--------------+
(6 rows) -->
INSERT INTO bikes(type, size) VALUES('Mountain', 27);
SELECT*FROM bikes;
<!-- bikes=>                      
+---------+----------+------+-----------+
| bike_id |   type   | size | available |
+---------+----------+------+-----------+
|       1 | Mountain |   27 | t         |
+---------+----------+------+-----------+
(1 row) -->
INSERT INTO bikes(type, size) VALUES('Mountain', 28);
INSERT INTO bikes(type, size) VALUES('Mountain', 29);
INSERT INTO bikes(type, size) VALUES('Road', 27);
SELECT*FROM bikes;
<!--                      
+---------+----------+------+-----------+
| bike_id |   type   | size | available |
+---------+----------+------+-----------+
|       1 | Mountain |   27 | t         |
|       2 | Mountain |   28 | t         |
|       3 | Mountain |   29 | t         |
|       4 | Road     |   27 | t         |
+---------+----------+------+-----------+
(4 rows) -->
INSERT INTO bikes(type, size) VALUES('Road', 28), ('Road', 29);
INSERT INTO bikes(type, size) VALUES('BMX', 19), ('BMX', 20), ('BMX', 21);
SELECT*FROM bikes;
<!-- bikes=>                      
+---------+----------+------+-----------+
| bike_id |   type   | size | available |
+---------+----------+------+-----------+
|       1 | Mountain |   27 | t         |
|       2 | Mountain |   28 | t         |
|       3 | Mountain |   29 | t         |
|       4 | Road     |   27 | t         |
|       5 | Road     |   28 | t         |
|       6 | Road     |   29 | t         |
|       7 | BMX      |   19 | t         |
|       8 | BMX      |   20 | t         |
|       9 | BMX      |   21 | t         |
+---------+----------+------+-----------+
(9 rows) -->
# bike-shop.sh
touch bike-shop.sh
chmod +x bike-shop.sh
./bike-shop.sh
<!-- 
~~~~~ Bike Rental Shop ~~~~~
 -->

./bike-shop.sh
<!-- 
~~~~~ Bike Rental Shop ~~~~~

How may I help you? -->
./bike-shop.sh
<!-- 
~~~~~ Bike Rental Shop ~~~~~

How may I help you?

1. Rent a bike
2. Return a bike
3. Exit -->
./bike-shop.sh
<!-- 
~~~~~ Bike Rental Shop ~~~~~

How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
1
Rent Menu -->
./bike-shop.sh
<!-- 
~~~~~ Bike Rental Shop ~~~~~

How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
1
       1 | Mountain |   27
       2 | Mountain |   28
       3 | Mountain |   29
       4 | Road     |   27
       5 | Road     |   28
       6 | Road     |   29
       7 | BMX      |   19
       8 | BMX      |   20
       9 | BMX      |   21 -->
UPDATE bikes SET available=false WHERE available=true;
UPDATE bikes SET available=true WHERE type!='BMX';
[[ a =~ [0-9] ]]; echo $?
<!-- output:
1 -->
[[ a1 =~ [0-9] ]]; echo $?
<!-- output:
0 --> for true 

[[ a1 =~ ^[0-9]$ ]]; echo $?
<!-- output:
1 -->
# 1 for false. a1 does not match the pattern. 
[[ 1 =~ ^[0-9]$ ]]; echo $?
<!-- output:
0 -->
[[ 11 =~ ^[0-9]$ ]]; echo $?
<!-- output:
1 -->
[[ 11 =~ ^[0-9]+$ ]]; echo $?
<!-- output:
0 -->
 [[ ! 11 =~ ^[0-9]+$ ]]; echo $?
<!-- output:
1 -->
UPDATE bikes SET available=true WHERE available=false;
./bike-shop.sh
<!-- 
~~~~~ Bike Rental Shop ~~~~~

How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
1

Here are the bikes we have available:
1) 27" Mountain Bike
2) 28" Mountain Bike
3) 29" Mountain Bike
4) 27" Road Bike
5) 28" Road Bike
6) 29" Road Bike
7) 19" BMX Bike
8) 20" BMX Bike
9) 21" BMX Bike

Which one would you like to rent?
4

What's your phone number?
555-5555

What's your name?
Me -->
SELECT*FROM customers;
<!--                     
+-------------+----------+------------+
| customer_id |  phone   |    name    |
+-------------+----------+------------+
|           1 | 232      | aNASTASIIA |
|           2 | 555-5555 | Me         |
+-------------+----------+------------+
(2 rows) -->
./bike-shop.sh
<!-- 
~~~~~ Bike Rental Shop ~~~~~

How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
1

Here are the bikes we have available:
1) 27" Mountain Bike
2) 28" Mountain Bike
4) 27" Road Bike
5) 28" Road Bike
6) 29" Road Bike
7) 19" BMX Bike
8) 20" BMX Bike
9) 21" BMX Bike

Which one would you like to rent?
3

That bike is not available.
How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
4       

Please enter a valid option.
How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
1

Here are the bikes we have available:
1) 27" Mountain Bike
2) 28" Mountain Bike
4) 27" Road Bike
5) 28" Road Bike
6) 29" Road Bike
7) 19" BMX Bike
8) 20" BMX Bike
9) 21" BMX Bike

Which one would you like to rent?
6

What's your phone number?
555-5555 -->
SELECT*FROM rentals;
<!--                                   
+-----------+-------------+---------+-------------+---------------+
| rental_id | customer_id | bike_id | date_rented | date_returned |
+-----------+-------------+---------+-------------+---------------+
|         1 |           3 |       3 | 2025-06-24  |               |
|         2 |           2 |       6 | 2025-06-24  |               |
+-----------+-------------+---------+-------------+---------------+
(2 rows) -->
SELECT*FROM bikes ORDER BY bike_id;
<!-- bikes=>                      
+---------+----------+------+-----------+
| bike_id |   type   | size | available |
+---------+----------+------+-----------+
|       1 | Mountain |   27 | t         |
|       2 | Mountain |   28 | t         |
|       3 | Mountain |   29 | f         |
|       4 | Road     |   27 | t         |
|       5 | Road     |   28 | t         |
|       6 | Road     |   29 | f         |
|       7 | BMX      |   19 | t         |
|       8 | BMX      |   20 | t         |
|       9 | BMX      |   21 | t         |
+---------+----------+------+-----------+
(9 rows) -->
./bike-shop.sh
<!-- 
~~~~~ Bike Rental Shop ~~~~~

How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
1

Here are the bikes we have available:
1) 27" Mountain Bike
2) 28" Mountain Bike
4) 27" Road Bike
5) 28" Road Bike
7) 19" BMX Bike
8) 20" BMX Bike
9) 21" BMX Bike

Which one would you like to rent?
7

What's your phone number?
555-5555
19 | BMX -->
echo '28 | Mountain' | sed 's/ /=/g' 
<!-- output:
28=|=Mountain -->
echo '28 | Mountain' | sed 's/ //g'
<!-- output:
28|Mountain -->
echo '28 | Mountain' | sed 's/ //'
<!-- output:
28| Mountain -->
echo '28 | Mountain' | sed 's/ |//'
<!-- output:
28 Mountain -->
echo '28 | Mountain' | sed 's/ |/"/'
<!-- output:
28" Mountain -->
echo "$(echo ' M e ')."
<!-- output:
 M e . -->
echo "$(echo ' M e ' | sed 's/ //')."
<!-- output:
M e . -->
echo "$(echo ' M e ' | sed 's/ //g')."
<!-- output:
Me. -->
<!-- echo "$(echo ' M e ' | sed 's/^ //g')."
output:
M e . -->
echo "$(echo '   M e ' | sed 's/^ //g')."
<!-- output:
  M e . -->
echo "$(echo '   M e ' | sed 's/^ *//g')."
<!-- output:
M e . -->
echo "$(echo '   M e ' | sed 's/ $//g')."
<!-- output:
   M e. -->
echo "$(echo '   M e   ' | sed 's/ $//g')."
<!-- output:
   M e  . -->
echo "$(echo '   M e   ' | sed 's/ *$//g')."
<!-- output:
   M e. -->
echo "$(echo '   M e   ' | sed 's/^ *| *$//g')."
<!-- output:
   M e   . -->
echo "$(echo '   M e   ' | sed -E 's/^ *| *$//g')."
<!-- output:
M e. -->
./bike-shop.sh
<!-- 
~~~~~ Bike Rental Shop ~~~~~

How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
1

Here are the bikes we have available:
1) 27" Mountain Bike
2) 28" Mountain Bike
4) 27" Road Bike
8) 20" BMX Bike

Which one would you like to rent?
4

What's your phone number?
555-5555

I have put you down for the 27" Road Bike, Me.
How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
3

Thank you for stopping in. -->
./bike-shop.sh
<!-- 
~~~~~ Bike Rental Shop ~~~~~

How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
1

Here are the bikes we have available:
1) 27" Mountain Bike
2) 28" Mountain Bike
8) 20" BMX Bike

Which one would you like to rent?
3

That bike is not available.
How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
1

Here are the bikes we have available:
1) 27" Mountain Bike
2) 28" Mountain Bike
8) 20" BMX Bike

Which one would you like to rent?
2

What's your phone number?
000-0000

What's your name?
Test

I have put you down for the 28" Mountain Bike, Test.
How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
3

Thank you for stopping in. -->
SELECT*FROM customers;
<!-- bikes=>                     
+-------------+----------+------------+
| customer_id |  phone   |    name    |
+-------------+----------+------------+
|           1 | 232      | aNASTASIIA |
|           2 | 555-5555 | Me         |
|           3 | 4355     | NASTIIA    |
|           4 | 000-0000 | Test       |
+-------------+----------+------------+
(4 rows) -->
 SELECT*FROM rentals;
<!--                                   
+-----------+-------------+---------+-------------+---------------+
| rental_id | customer_id | bike_id | date_rented | date_returned |
+-----------+-------------+---------+-------------+---------------+
|         1 |           3 |       3 | 2025-06-24  |               |
|         2 |           2 |       6 | 2025-06-24  |               |
|         3 |           2 |       7 | 2025-06-24  |               |
|         4 |           2 |       5 | 2025-06-24  |               |
|         5 |           2 |       9 | 2025-06-24  |               |
|         6 |           2 |       4 | 2025-06-24  |               |
|         7 |           4 |       2 | 2025-06-24  |               |
|         8 |           4 |       8 | 2025-06-24  |               |
+-----------+-------------+---------+-------------+---------------+
(8 rows) -->
SELECT*FROM bikes LEFT JOIN rentals USING(bike_id);
<!--                                                  
+---------+----------+------+-----------+-----------+-------------+-------------+---------------+
| bike_id |   type   | size | available | rental_id | customer_id | date_rented | date_returned |
+---------+----------+------+-----------+-----------+-------------+-------------+---------------+
|       3 | Mountain |   29 | f         |         1 |           3 | 2025-06-24  |               |
|       6 | Road     |   29 | f         |         2 |           2 | 2025-06-24  |               |
|       7 | BMX      |   19 | f         |         3 |           2 | 2025-06-24  |               |
|       5 | Road     |   28 | f         |         4 |           2 | 2025-06-24  |               |
|       9 | BMX      |   21 | f         |         5 |           2 | 2025-06-24  |               |
|       4 | Road     |   27 | f         |         6 |           2 | 2025-06-24  |               |
|       2 | Mountain |   28 | f         |         7 |           4 | 2025-06-24  |               |
|       8 | BMX      |   20 | f         |         8 |           4 | 2025-06-24  |               |
|       1 | Mountain |   27 | f         |         9 |           5 | 2025-06-24  |               |
+---------+----------+------+-----------+-----------+-------------+-------------+---------------+
(9 rows) -->
# I only need the bikes that are being rented. 
SELECT*FROM bikes INNER JOIN rentals USING(bike_id);
<!--                                                  
+---------+----------+------+-----------+-----------+-------------+-------------+---------------+
| bike_id |   type   | size | available | rental_id | customer_id | date_rented | date_returned |
+---------+----------+------+-----------+-----------+-------------+-------------+---------------+
|       3 | Mountain |   29 | f         |         1 |           3 | 2025-06-24  |               |
|       6 | Road     |   29 | f         |         2 |           2 | 2025-06-24  |               |
|       7 | BMX      |   19 | f         |         3 |           2 | 2025-06-24  |               |
|       5 | Road     |   28 | f         |         4 |           2 | 2025-06-24  |               |
|       9 | BMX      |   21 | f         |         5 |           2 | 2025-06-24  |               |
|       4 | Road     |   27 | f         |         6 |           2 | 2025-06-24  |               |
|       2 | Mountain |   28 | f         |         7 |           4 | 2025-06-24  |               |
|       8 | BMX      |   20 | f         |         8 |           4 | 2025-06-24  |               |
|       1 | Mountain |   27 | f         |         9 |           5 | 2025-06-24  |               |
+---------+----------+------+-----------+-----------+-------------+-------------+---------------+
(9 rows) -->
SELECT*FROM bikes INNER JOIN rentals USING(bike_id) INNER JOIN customers USING(customer_id);
<!-- bikes=>                                                            
+-------------+---------+----------+------+-----------+-----------+-------------+---------------+----------+---------+
| customer_id | bike_id |   type   | size | available | rental_id | date_rented | date_returned |  phone   |  name   |
+-------------+---------+----------+------+-----------+-----------+-------------+---------------+----------+---------+
|           3 |       3 | Mountain |   29 | f         |         1 | 2025-06-24  |               | 4355     | NASTIIA |
|           2 |       6 | Road     |   29 | f         |         2 | 2025-06-24  |               | 555-5555 | Me      |
|           2 |       7 | BMX      |   19 | f         |         3 | 2025-06-24  |               | 555-5555 | Me      |
|           2 |       5 | Road     |   28 | f         |         4 | 2025-06-24  |               | 555-5555 | Me      |
|           2 |       9 | BMX      |   21 | f         |         5 | 2025-06-24  |               | 555-5555 | Me      |
|           2 |       4 | Road     |   27 | f         |         6 | 2025-06-24  |               | 555-5555 | Me      |
|           4 |       2 | Mountain |   28 | f         |         7 | 2025-06-24  |               | 000-0000 | Test    |
|           4 |       8 | BMX      |   20 | f         |         8 | 2025-06-24  |               | 000-0000 | Test    |
|           5 |       1 | Mountain |   27 | f         |         9 | 2025-06-24  |               | 345      | nht     |
+-------------+---------+----------+------+-----------+-----------+-------------+---------------+----------+---------+
(9 rows) -->
SELECT*FROM bikes INNER JOIN rentals USING(bike_id) INNER JOIN customers USING(customer_id) WHERE phone = '555-5555' AND date_returned IS NULL;
<!-- bikes=>                                                         
+-------------+---------+------+------+-----------+-----------+-------------+---------------+----------+------+
| customer_id | bike_id | type | size | available | rental_id | date_rented | date_returned |  phone   | name |
+-------------+---------+------+------+-----------+-----------+-------------+---------------+----------+------+
|           2 |       6 | Road |   29 | f         |         2 | 2025-06-24  |               | 555-5555 | Me   |
|           2 |       7 | BMX  |   19 | f         |         3 | 2025-06-24  |               | 555-5555 | Me   |
|           2 |       5 | Road |   28 | f         |         4 | 2025-06-24  |               | 555-5555 | Me   |
|           2 |       9 | BMX  |   21 | f         |         5 | 2025-06-24  |               | 555-5555 | Me   |
|           2 |       4 | Road |   27 | f         |         6 | 2025-06-24  |               | 555-5555 | Me   |
+-------------+---------+------+------+-----------+-----------+-------------+---------------+----------+------+
(5 rows) -->
SELECT bike_id, size, type FROM bikes INNER JOIN rentals USING(bike_id) INNER JOIN customers USING(customer_id) WHERE phone = '555-5555' AND date_returned IS NULL;
<!-- bikes=>              
+---------+------+------+
| bike_id | size | type |
+---------+------+------+
|       6 |   29 | Road |
|       7 |   19 | BMX  |
|       5 |   28 | Road |
|       9 |   21 | BMX  |
|       4 |   27 | Road |
+---------+------+------+
(5 rows) -->
SELECT bike_id, size, type FROM bikes INNER JOIN rentals USING(bike_id) INNER JOIN customers USING(customer_id) WHERE phone = '555-5555' AND date_returned IS NULL ORDER BY bike_id;
<!--              
+---------+------+------+
| bike_id | size | type |
+---------+------+------+
|       4 |   27 | Road |
|       5 |   28 | Road |
|       6 |   29 | Road |
|       7 |   19 | BMX  |
|       9 |   21 | BMX  |
+---------+------+------+
(5 rows) -->
./bike-shop.sh
<!-- 
~~~~~ Bike Rental Shop ~~~~~

How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
1

Sorry, we don't have any bikes available right now.
How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
2

What's your phone number?
555-5555
       4 | Road |   27
       5 | Road |   28
       6 | Road |   29
       7 | BMX  |   19
       9 | BMX  |   21 -->
SELECT * FROM rentals INNER JOIN customers USING(customer_id);
<!--                                             
+-------------+-----------+---------+-------------+---------------+----------+---------+
| customer_id | rental_id | bike_id | date_rented | date_returned |  phone   |  name   |
+-------------+-----------+---------+-------------+---------------+----------+---------+
|           3 |         1 |       3 | 2025-06-24  |               | 4355     | NASTIIA |
|           2 |         2 |       6 | 2025-06-24  |               | 555-5555 | Me      |
|           2 |         3 |       7 | 2025-06-24  |               | 555-5555 | Me      |
|           2 |         4 |       5 | 2025-06-24  |               | 555-5555 | Me      |
|           2 |         5 |       9 | 2025-06-24  |               | 555-5555 | Me      |
|           2 |         6 |       4 | 2025-06-24  |               | 555-5555 | Me      |
|           4 |         7 |       2 | 2025-06-24  |               | 000-0000 | Test    |
|           4 |         8 |       8 | 2025-06-24  |               | 000-0000 | Test    |
|           5 |         9 |       1 | 2025-06-24  |               | 345      | nht     |
+-------------+-----------+---------+-------------+---------------+----------+---------+
(9 rows) -->
SELECT*FROM rentals;
<!-- bikes=>                                   
+-----------+-------------+---------+-------------+---------------+
| rental_id | customer_id | bike_id | date_rented | date_returned |
+-----------+-------------+---------+-------------+---------------+
|         1 |           3 |       3 | 2025-06-24  |               |
|         2 |           2 |       6 | 2025-06-24  |               |
|         3 |           2 |       7 | 2025-06-24  |               |
|         4 |           2 |       5 | 2025-06-24  |               |
|         6 |           2 |       4 | 2025-06-24  |               |
|         7 |           4 |       2 | 2025-06-24  |               |
|         8 |           4 |       8 | 2025-06-24  |               |
|         9 |           5 |       1 | 2025-06-24  |               |
|         5 |           2 |       9 | 2025-06-24  | 2025-06-24    |
+-----------+-------------+---------+-------------+---------------+
(9 rows) -->
SELECT*FROM bikes ORDER BY bike_id;
<!-- bikes=>                      
+---------+----------+------+-----------+
| bike_id |   type   | size | available |
+---------+----------+------+-----------+
|       1 | Mountain |   27 | f         |
|       2 | Mountain |   28 | f         |
|       3 | Mountain |   29 | f         |
|       4 | Road     |   27 | f         |
|       5 | Road     |   28 | f         |
|       6 | Road     |   29 | f         |
|       7 | BMX      |   19 | f         |
|       8 | BMX      |   20 | f         |
|       9 | BMX      |   21 | t         |
+---------+----------+------+-----------+
(9 rows) -->
./bike-shop.sh
<!-- 
~~~~~ Bike Rental Shop ~~~~~

How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
2

What's your phone number?
555-5555

Here are your rentals:
5) 28" Road Bike
7) 19" BMX Bike

Which one would you like to return?
5

Thank you for returning your bike.
How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
2

What's your phone number?
555-5555

Here are your rentals:
7) 19" BMX Bike

Which one would you like to return?
7

Thank you for returning your bike.
How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
2

What's your phone number?
4355 

Here are your rentals:
3) 29" Mountain Bike

Which one would you like to return?
3

Thank you for returning your bike.
How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
2

What's your phone number?
000-0000

Here are your rentals:
2) 28" Mountain Bike
8) 20" BMX Bike

Which one would you like to return?
2

Thank you for returning your bike.
How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
2

What's your phone number?
000-0000

Here are your rentals:
8) 20" BMX Bike

Which one would you like to return?
8

Thank you for returning your bike.
How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
2

What's your phone number?
345

Here are your rentals:
1) 27" Mountain Bike

Which one would you like to return?
1

Thank you for returning your bike.
How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
3

Thank you for stopping in. -->