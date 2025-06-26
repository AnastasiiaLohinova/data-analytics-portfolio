CREATE DATABASE salon;
CREATE TABLE castomers(
 castomer_id SERIAL PRIMARY KEY,
 phone VARCHAR(15) UNIQUE,
 name VARCHAR(30) 
);

CREATE TABLE services(
 service_id SERIAL PRIMARY KEY,
 name VARCHAR(30) NOT NULL
);

CREATE TABLE appointments(
 appointment_id SERIAL PRIMARY KEY,
 castomer_id INT NOT NULL REFERENCES castomers(castomer_id),
 service_id INT NOT NULL REFERENCES services(service_id),
 time VARCHAR(10)
);

INSERT INTO services(name) 
VALUES('cut'),
 ('color'),
 ('perm'),
 ('style'),
 ('trim');

-- I made some mistake. Instead customers I created castomers and Instead customer_id I created castomer_id. Next I will edit this.  

ALTER TABLE castomers RENAME TO customers;
ALTER TABLE customers RENAME COLUMN castomer_id TO customer_id;
ALTER TABLE appointments DROP CONSTRAINT appointments_castomer_id_fkey;
ALTER TABLE appointments RENAME COLUMN castomer_id TO customer_id;
ALTER TABLE appointments ADD CONSTRAINT appointments_customer_id_fkey FOREIGN KEY(customer_id) REFERENCES customers(customer_id);


