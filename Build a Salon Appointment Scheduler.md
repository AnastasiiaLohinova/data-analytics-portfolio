# This is one of the required projects to earn my certification. For this project, I will create an interactive Bash program that uses PostgreSQL to track the customers and appointments for your salon. 
<!-- Complete the tasks below

You should create a database named salon

You should connect to your database, then create tables named customers, appointments, and services

Each table should have a primary key column that automatically increments

Each primary key column should follow the naming convention, table_name_id. For example, the customers table should have a customer_id key. Note that there’s no s at the end of customer

Your appointments table should have a customer_id foreign key that references the customer_id column from the customers table

Your appointments table should have a service_id foreign key that references the service_id column from the services table

Your customers table should have phone that is a VARCHAR and must be unique

Your customers and services tables should have a name column

Your appointments table should have a time column that is a VARCHAR

You should have at least three rows in your services table for the different services you offer, one with a service_id of 1

You should create a script file named salon.sh in the project folder

Your script file should have a “shebang” that uses bash when the file is executed (use #! /bin/bash)

Your script file should have executable permissions

You should not use the clear command in your script

You should display a numbered list of the services you offer before the first prompt for input, each with the format #) <service>. For example, 1) cut, where 1 is the service_id

If you pick a service that doesn't exist, you should be shown the same list of services again

Your script should prompt users to enter a service_id, phone number, a name if they aren’t already a customer, and a time. You should use read to read these inputs into variables named SERVICE_ID_SELECTED, CUSTOMER_PHONE, CUSTOMER_NAME, and SERVICE_TIME

If a phone number entered doesn’t exist, you should get the customers name and enter it, and the phone number, into the customers table

You can create a row in the appointments table by running your script and entering 1, 555-555-5555, Fabio, 10:30 at each request for input if that phone number isn’t in the customers table. The row should have the customer_id for that customer, and the service_id for the service entered

You can create another row in the appointments table by running your script and entering 2, 555-555-5555, 11am at each request for input if that phone number is already in the customers table. The row should have the customer_id for that customer, and the service_id for the service entered

After an appointment is successfully added, you should output the message I have put you down for a <service> at <time>, <name>. For example, if the user chooses cut as the service, 10:30 is entered for the time, and their name is Fabio in the database the output would be I have put you down for a cut at 10:30, Fabio. Make sure your script finishes running after completing any of the tasks above, or else the tests won't pass -->
psql --username=freecodecamp --dbname=postgres
<!-- psql (12.17 (Ubuntu 12.17-1.pgdg22.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help. -->

CREATE DATABASE salon;
\c salon
<!-- SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "salon" as user "freecodecamp". -->
CREATE TABLE castomers(castomer_id SERIAL PRIMARY KEY,
salon(> phone VARCHAR(15) UNIQUE,
salon(> name VARCHAR(30));

CREATE TABLE services(service_id SERIAL PRIMARY KEY,
salon(>  name VARCHAR(30) NOT NULL);

CREATE TABLE appointments(appointment_id SERIAL PRIMARY KEY,
salon(> castomer_id INT NOT NULL REFERENCES castomers(castomer_id),
salon(> service_id INT NOT NULL REFERENCES services(service_id),
salon(> time VARCHAR(10));

\d
<!-- 
                          List of relations
 Schema |              Name               |   Type   |    Owner     
--------+---------------------------------+----------+--------------
 public | appointments                    | table    | freecodecamp
 public | appointments_appointment_id_seq | sequence | freecodecamp
 public | castomers                       | table    | freecodecamp
 public | castomers_castomer_id_seq       | sequence | freecodecamp
 public | services                        | table    | freecodecamp
 public | services_service_id_seq         | sequence | freecodecamp
(6 rows) -->

\d castomers
<!-- 
   Column    |         Type          | Collation | Nullable |                    Default                     
-------------+-----------------------+-----------+----------+------------------------------------------------
-------------+-----------------------+-----------+----------+------------------------------------------------
 castomer_id | integer               |           | not null | nextval('castomers_castomer_id_seq'::regclass)
 phone       | character varying(15) |           |          | 
 name        | character varying(30) |           |          | 
Indexes:
    "castomers_pkey" PRIMARY KEY, btree (castomer_id)
    "castomers_phone_key" UNIQUE CONSTRAINT, btree (phone)
Referenced by:
    TABLE "appointments" CONSTRAINT "appointments_castomer_id_fkey" FOREIGN KEY (castomer_id) REFERENCES castomers(castomer_id) -->

\d services
<!-- 
 Column   |         Type          | Collation | Nullable |                   Default                    
------------+-----------------------+-----------+----------+----------------------------------------------
 service_id | integer               |           | not null | nextval('services_service_id_seq'::regclass)
 name       | character varying(30) |           | not null | 
Indexes:
    "services_pkey" PRIMARY KEY, btree (service_id)
Referenced by:
    TABLE "appointments" CONSTRAINT "appointments_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(service_id) -->

\d appointments
<!-- 
                                            Table "public.appointments"
     Column     |         Type          | Collation | Nullable |                       Default                        
----------------+-----------------------+-----------+----------+------------------------------------------------------
 appointment_id | integer               |           | not null | nextval('appointments_appointment_id_seq'::regclass)
 castomer_id    | integer               |           | not null | 
 service_id     | integer               |           | not null | 
 time           | character varying(10) |           |          | 
Indexes:
    "appointments_pkey" PRIMARY KEY, btree (appointment_id)
Foreign-key constraints:
    "appointments_castomer_id_fkey" FOREIGN KEY (castomer_id) REFERENCES castomers(castomer_id)
    "appointments_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(service_id) -->

INSERT INTO services(name) 
salon-> VALUES('cut'),
salon-> ('color'),
salon-> ('perm'),
salon-> ('style'),
salon-> ('trim');

SELECT*FROM services;
 <!-- service_id | name  
------------+-------
          1 | cut
          2 | color
          3 | perm
          4 | style
          5 | trim
(5 rows) -->
# I made some mistake. Instead customers I created castomers and Instead customer_id I created castomer_id. Next I will edit this.
ALTER TABLE castomers RENAME TO customers;
ALTER TABLE customers RENAME COLUMN castomer_id TO customer_id;
ALTER TABLE appointments DROP CONSTRAINT appointments_castomer_id_fkey;
ALTER TABLE appointments RENAME COLUMN castomer_id TO customer_id;
ALTER TABLE appointments ADD CONSTRAINT appointments_customer_id_fkey FOREIGN KEY(customer_id) REFERENCES customers(customer_id);
# salon.sh
touch salon.sh
chmod +x salon.sh

./salon.sh
<!-- 
~~~~~ MY SALON ~~~~~


Welcome to My Salon, how can I help you?
1) cut
2) color
3) perm
4) style
5) trim
10

I could not find that service. What would you like today?
1) cut
2) color
3) perm
4) style
5) trim
1

What's your phone number?
555-555-5555

I don't have a record for that phone number, what's your name?
Fabio

What time would you like your cut, Fabio?
10:30

I have put you down for a cut at 10:30, Fabio. -->

./salon.sh
<!-- 
~~~~~ MY SALON ~~~~~


Welcome to My Salon, how can I help you?
1) cut
2) color
3) perm
4) style
5) trim
2

What's your phone number?
555-555-5555

What time would you like your color, Fabio?
11am

I have put you down for a color at 11am, Fabio. -->
SELECT*FROM customers;
 <!-- customer_id |    phone     |  name   
-------------+--------------+---------
           1 | 6354         | NASTIIA
           2 | 1111         | kat
           3 | 2222         | Met
           4 | 3333         | Jo
           5 | 555-555-5555 | Fabio
(5 rows) -->
 SELECT*FROM services
<!-- salon-> ;
 service_id | name  
------------+-------
          1 | cut
          2 | color
          3 | perm
          4 | style
          5 | trim
(5 rows) -->

SELECT*FROM appointments;
 <!-- appointment_id | customer_id | service_id | time  
----------------+-------------+------------+-------
              1 |           3 |          4 | 11AM
              2 |           2 |          3 | 15:30
              3 |           1 |          2 | 10
              4 |           1 |          3 | 10
              5 |           1 |          3 | 10
              6 |           5 |          1 | 10:30
              7 |           5 |          2 | 11am
(7 rows) -->
