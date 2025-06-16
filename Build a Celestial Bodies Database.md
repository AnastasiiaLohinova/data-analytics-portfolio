# Build a Celestial Bodies Database This is one of the required projects to earn your certification. For this project, you will build a database of celestial bodies using PostgreSQL.
<!-- My task for this project: 
Complete the tasks below

-You should create a database named universe
-Be sure to connect to your database with \c universe. Then, you should add tables named galaxy, star, planet, and moon
-Each table should have a primary key
-Each primary key should automatically increment
-Each table should have a name column
-You should use the INT data type for at least two columns that are not a primary or foreign key
-You should use the NUMERIC data type at least once
-You should use the TEXT data type at least once
-You should use the BOOLEAN data type on at least two columns
-Each "star" should have a foreign key that references one of the rows in galaxy
-Each "planet" should have a foreign key that references one of the rows in star
-Each "moon" should have a foreign key that references one of the rows in planet
-Your database should have at least five tables
-Each table should have at least three rows
-The galaxy and star tables should each have at least six rows
-The planet table should have at least 12 rows
-The moon table should have at least 20 rows
-Each table should have at least three columns
-The galaxy, star, planet, and moon tables should each have at least five columns
-At least two columns per table should not accept NULL values
-At least one column from each table should be required to be UNIQUE
-All columns named name should be of type VARCHAR
-Each primary key column should follow the naming convention table_name_id. For example, the moon table should have a primary key column named moon_id
-Each foreign key column should have the same name as the column it is referencing -->

psql --username=freecodecamp --dbname=postgres
<!-- output: 
Border style is 2.
Pager usage is off.
psql (12.17 (Ubuntu 12.17-1.pgdg22.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help. -->
CREATE DATABASE universe;
\c universe
<!-- output: 
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "universe" as user "freecodecamp". -->
universe=> CREATE TABLE galaxy(
universe(> galaxy_id SERIAL PRIMARY KEY,
universe(> name VARCHAR(20) NOT NULL,
universe(> has_life BOOLEAN,
universe(> galaxy_types VARCHAR(30) NOT NULL,
universe(> description TEXT);
ALTER TABLE galaxy ADD UNIQUE (name);
\d galaxy
<!-- output:
                                           Table "public.galaxy"
+--------------+-----------------------+-----------+----------+-------------------------------------------+
|    Column    |         Type          | Collation | Nullable |                  Default                  |
+--------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_id    | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name         | character varying(20) |           | not null |                                           |
| has_life     | boolean               |           |          |                                           |
| galaxy_types | character varying(30) |           | not null |                                           |
| description  | text                  |           |          |                                           |
+--------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id) -->

INSERT INTO galaxy(name, has_life, galaxy_types, description) VALUES('Milky Way', TRUE, 'spiral', 'Наша галактика'),
universe-> ('Andromeda', FALSE, 'spiral', 'Найбільша в нашій групі галактик'),
universe-> ('Triangulum', FALSE, 'spiral', 'Третя за розміром в Local Group'),
universe-> ('Sombrero', FALSE, 'elliptical', 'Виглядає як сомбреро'),
universe-> ('Large Magellanic', TRUE, 'irregular', 'Мала супутникова галактика Молочного Шляху'),
universe-> ('Messier 87', FALSE, 'elliptical', 'Відома чорною дірою в центрі');
SELECT*FROM galaxy;
<!-- output:
+-----------+------------------+----------+--------------+--------------------------------------------+
| galaxy_id |       name       | has_life | galaxy_types |                description                 |
+-----------+------------------+----------+--------------+--------------------------------------------+
|         1 | Milky Way        | t        | spiral       | Наша галактика                             |
|         2 | Andromeda        | f        | spiral       | Найбільша в нашій групі галактик           |
|         3 | Triangulum       | f        | spiral       | Третя за розміром в Local Group            |
|         4 | Sombrero         | f        | elliptical   | Виглядає як сомбреро                       |
|         5 | Large Magellanic | t        | irregular    | Мала супутникова галактика Молочного Шляху |
|         6 | Messier 87       | f        | elliptical   | Відома чорною дірою в центрі               |
+-----------+------------------+----------+--------------+--------------------------------------------+
(6 rows) -->
CREATE TABLE star(
universe(> star_id SERIAL PRIMARY KEY,
universe(> name VARCHAR(20) UNIQUE,
universe(> age_in_millions_of_years INT NOT NULL,
universe(> galaxy_id INT NOT NULL,
universe(> distance_from_earth NUMERIC);
ALTER TABLE star ADD FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id);
ALTER TABLE star ADD COLUMN mass_in_solar_units INT NOT NULL;
\d star
 <!-- output:
                                                Table "public.star"
+--------------------------+-----------------------+-----------+----------+---------------------------------------+
|          Column          |         Type          | Collation | Nullable |                Default                |
+--------------------------+-----------------------+-----------+----------+---------------------------------------+
| star_id                  | integer               |           | not null | nextval('star_star_id_seq'::regclass) |
| name                     | character varying(20) |           |          |                                       |
| age_in_millions_of_years | integer               |           | not null |                                       |
| galaxy_id                | integer               |           | not null |                                       |
| distance_from_earth      | numeric               |           |          |                                       |
| mass_in_solar_units      | integer               |           | not null |                                       |
+--------------------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
    "star_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id) -->
INSERT INTO star(name, age_in_millions_of_years, galaxy_id, distance_from_earth, mass_in_solar_units) 
universe-> VALUES('Sun', 4600, 1, 0, 1),
universe-> ('Proxima Centauri', 4500, 1, 4.24, 0),
universe-> ('Sirius', 242, 1, 8.6, 2),
universe-> ('Rigel', 8000, 5, 860, 21),
universe-> ('Messier 87 Star A', 7000, 6, 53000000, 15),
universe-> ('Andromeda Star B', 6000, 2, 2500000, 12);
SELECT*FROM star;
<!-- output:
+---------+-------------------+--------------------------+-----------+---------------------+---------------------+
| star_id |       name        | age_in_millions_of_years | galaxy_id | distance_from_earth | mass_in_solar_units |
+---------+-------------------+--------------------------+-----------+---------------------+---------------------+
|       1 | Sun               |                     4600 |         1 |                   0 |                   1 |
|       2 | Proxima Centauri  |                     4500 |         1 |                4.24 |                   0 |
|       3 | Sirius            |                      242 |         1 |                 8.6 |                   2 |
|       4 | Rigel             |                     8000 |         5 |                 860 |                  21 |
|       5 | Messier 87 Star A |                     7000 |         6 |            53000000 |                  15 |
|       6 | Andromeda Star B  |                     6000 |         2 |             2500000 |                  12 |
+---------+-------------------+--------------------------+-----------+---------------------+---------------------+
(6 rows) -->
CREATE TABLE planet(
universe(> planet_id SERIAL PRIMARY KEY,
universe(> name VARCHAR(20) UNIQUE,
universe(> has_life BOOLEAN,
universe(> is_spherical BOOLEAN,
universe(> age_in_millions_of_years INT NOT NULL,
universe(> distance_from_earth NUMERIC(4,2),
universe(> star_id INT NOT NULL REFERENCES star(star_id));
\d planet
<!-- output:
                                                 Table "public.planet"
+--------------------------+-----------------------+-----------+----------+-------------------------------------------+
|          Column          |         Type          | Collation | Nullable |                  Default                  |
+--------------------------+-----------------------+-----------+----------+-------------------------------------------+
| planet_id                | integer               |           | not null | nextval('planet_planet_id_seq'::regclass) |
| name                     | character varying(20) |           |          |                                           |
| has_life                 | boolean               |           |          |                                           |
| is_spherical             | boolean               |           |          |                                           |
| age_in_millions_of_years | integer               |           | not null |                                           |
| distance_from_earth      | numeric(4,2)          |           |          |                                           |
| star_id                  | integer               |           | not null |                                           |
+--------------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
    "planet_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id) -->
ALTER TABLE planet ALTER COLUMN distance_from_earth TYPE NUMERIC(10,2);
INSERT INTO planet(name, has_life, is_spherical, age_in_millions_of_years, distance_from_earth, star_id)
universe-> VALUES('Earth', TRUE, TRUE, 4500, 0.00, 1),
universe-> ('Mars', FALSE, TRUE, 4500, 0.52, 1),
universe-> ('Proxima b', NULL, TRUE, 4800, 4.24, 2),
universe-> ('Proxima c', FALSE, TRUE, 5000, 4.25, 2),
universe-> ('Sirius I', FALSE, TRUE, 3000, 8.61, 3),
universe-> ('Sirius II', FALSE, TRUE, 2800, 8.60, 3),
universe-> ('Rigel A1', FALSE, TRUE, 6000, 861.00, 4),
universe-> ('Rigel B2', FALSE, TRUE, 6500, 862.00, 4),
universe-> ('M87-X', FALSE, TRUE, 9000, 53000000.00, 5),
universe-> ('M87-Y', FALSE, FALSE, 9200, 53000001.00, 5),
universe-> ('Andro-1', TRUE, TRUE, 7000, 2537000.00, 6),
universe-> ('Andro-2', FALSE, TRUE, 7100, 2537001.00, 6);
SELECT*FROM planet;
<!-- output:
+-----------+-----------+----------+--------------+--------------------------+---------------------+---------+
| planet_id |   name    | has_life | is_spherical | age_in_millions_of_years | distance_from_earth | star_id |
+-----------+-----------+----------+--------------+--------------------------+---------------------+---------+
|         1 | Earth     | t        | t            |                     4500 |                0.00 |       1 |
|         2 | Mars      | f        | t            |                     4500 |                0.52 |       1 |
|         3 | Proxima b |          | t            |                     4800 |                4.24 |       2 |
|         4 | Proxima c | f        | t            |                     5000 |                4.25 |       2 |
|         5 | Sirius I  | f        | t            |                     3000 |                8.61 |       3 |
|         6 | Sirius II | f        | t            |                     2800 |                8.60 |       3 |
|         7 | Rigel A1  | f        | t            |                     6000 |              861.00 |       4 |
|         8 | Rigel B2  | f        | t            |                     6500 |              862.00 |       4 |
|         9 | M87-X     | f        | t            |                     9000 |         53000000.00 |       5 |
|        10 | M87-Y     | f        | f            |                     9200 |         53000001.00 |       5 |
|        11 | Andro-1   | t        | t            |                     7000 |          2537000.00 |       6 |
|        12 | Andro-2   | f        | t            |                     7100 |          2537001.00 |       6 |
+-----------+-----------+----------+--------------+--------------------------+---------------------+---------+
(12 rows) -->
CREATE TABLE moon(
universe(> moon_id SERIAL PRIMARY KEY,
universe(> name VARCHAR(20) UNIQUE,
universe(> description TEXT NOT NULL,
universe(> age_in_millions_of_years INT NOT NULL,
universe(> mass_in_solar_units INT,
universe(> planet_id INT NOT NULL REFERENCES planet(planet_id));
\d moon
<!-- output:
                                                Table "public.moon"
+--------------------------+-----------------------+-----------+----------+---------------------------------------+
|          Column          |         Type          | Collation | Nullable |                Default                |
+--------------------------+-----------------------+-----------+----------+---------------------------------------+
| moon_id                  | integer               |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name                     | character varying(20) |           |          |                                       |
| description              | text                  |           | not null |                                       |
| age_in_millions_of_years | integer               |           | not null |                                       |
| mass_in_solar_units      | integer               |           |          |                                       |
| planet_id                | integer               |           | not null |                                       |
+--------------------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id) -->
INSERT INTO moon(name, description, age_in_millions_of_years, mass_in_solar_units, planet_id)
universe-> VALUES('Luna', 'Єдиний природний супутник Землі', 4500, 1, 1),
universe-> ('Deimos', 'Маленький супутник Марса', 4500, 0, 2),
universe-> ('Phobos', 'Великий супутник Марса', 4500, 1, 2),
universe-> ('Centurion', 'Гіпотетичний супутник Proxima b', 4800, 2, 3),
universe-> ('Nightshade', 'Тіньова орбіта Proxima b', 4800, 1, 3),
universe-> ('Umbra', 'Темний супутник Proxima c', 5000, 1, 4),
universe-> ('Gloom', 'Темний сателіт', 5000, 1, 4),
universe-> ('Sirius Alpha', 'Яскравий супутник Sirius I', 3000, 5, 5),
universe-> ('Sirius Beta', 'Близнюк Alpha', 3000, 5, 5),
universe-> ('Icepearl', 'Заморожений супутник Sirius II', 2800, 3, 6),
universe-> ('Frostbite', 'З крижаним ядром', 2800, 2, 6),
universe-> ('Rigel Moon 1', 'Супутник блакитного гіганта', 6000, 10, 7),
universe-> ('Rigel Moon 2', 'Інший супутник', 6000, 9, 7),
universe-> ('Rigel Halo', 'Супутник із кільцями', 6500, 7, 8),
universe-> ('Brightring', 'Внутрішній супутник', 6500, 6, 8),
universe-> ('M87-Alpha', 'Супутник у галактиці Messier 87', 9000, 15, 9),
universe-> ('M87-Beta', 'Величезний супутник', 9100, 20, 9),
universe-> ('M87-Zeta', 'Віддалений супутник', 9200, 13, 10),
universe-> ('Andro-L1', 'Перший супутник планети Andro-1', 7000, 4, 11),
universe-> ('Andro-L2', 'Другий супутник', 7100, 3, 12);
SELECT*FROM moon;
<!-- output:
+---------+--------------+---------------------------------+--------------------------+---------------------+-----------+
| moon_id |     name     |           description           | age_in_millions_of_years | mass_in_solar_units | planet_id |
+---------+--------------+---------------------------------+--------------------------+---------------------+-----------+
|       1 | Luna         | Єдиний природний супутник Землі |                     4500 |                   1 |         1 |
|       2 | Deimos       | Маленький супутник Марса        |                     4500 |                   0 |         2 |
|       3 | Phobos       | Великий супутник Марса          |                     4500 |                   1 |         2 |
|       4 | Centurion    | Гіпотетичний супутник Proxima b |                     4800 |                   2 |         3 |
|       5 | Nightshade   | Тіньова орбіта Proxima b        |                     4800 |                   1 |         3 |
|       6 | Umbra        | Темний супутник Proxima c       |                     5000 |                   1 |         4 |
|       7 | Gloom        | Темний сателіт                  |                     5000 |                   1 |         4 |
|       8 | Sirius Alpha | Яскравий супутник Sirius I      |                     3000 |                   5 |         5 |
|       9 | Sirius Beta  | Близнюк Alpha                   |                     3000 |                   5 |         5 |
|      10 | Icepearl     | Заморожений супутник Sirius II  |                     2800 |                   3 |         6 |
|      11 | Frostbite    | З крижаним ядром                |                     2800 |                   2 |         6 |
|      12 | Rigel Moon 1 | Супутник блакитного гіганта     |                     6000 |                  10 |         7 |
|      13 | Rigel Moon 2 | Інший супутник                  |                     6000 |                   9 |         7 |
|      14 | Rigel Halo   | Супутник із кільцями            |                     6500 |                   7 |         8 |
|      15 | Brightring   | Внутрішній супутник             |                     6500 |                   6 |         8 |
|      16 | M87-Alpha    | Супутник у галактиці Messier 87 |                     9000 |                  15 |         9 |
|      17 | M87-Beta     | Величезний супутник             |                     9100 |                  20 |         9 |
|      18 | M87-Zeta     | Віддалений супутник             |                     9200 |                  13 |        10 |
|      19 | Andro-L1     | Перший супутник планети Andro-1 |                     7000 |                   4 |        11 |
|      20 | Andro-L2     | Другий супутник                 |                     7100 |                   3 |        12 |
+---------+--------------+---------------------------------+--------------------------+---------------------+-----------+
(20 rows) -->
CREATE TABLE star_planet(
universe(> star_planet_id SERIAL PRIMARY KEY,
universe(>   star_id INT NOT NULL REFERENCES star(star_id),
universe(>   planet_id INT NOT NULL REFERENCES planet(planet_id),
universe(>   is_primary_star BOOLEAN NOT NULL,
universe(>   distance NUMERIC(8,2) NOT NULL,
universe(>   UNIQUE (star_id, planet_id)
universe(> );
\d star_planet
 <!-- output:
                                          Table "public.star_planet"
+-----------------+--------------+-----------+----------+-----------------------------------------------------+
|     Column      |     Type     | Collation | Nullable |                       Default                       |
+-----------------+--------------+-----------+----------+-----------------------------------------------------+
| star_planet_id  | integer      |           | not null | nextval('star_planet_star_planet_id_seq'::regclass) |
| star_id         | integer      |           | not null |                                                     |
| planet_id       | integer      |           | not null |                                                     |
| is_primary_star | boolean      |           | not null |                                                     |
| distance        | numeric(8,2) |           | not null |                                                     |
+-----------------+--------------+-----------+----------+-----------------------------------------------------+
Indexes:
    "star_planet_pkey" PRIMARY KEY, btree (star_planet_id)
    "star_planet_star_id_planet_id_key" UNIQUE CONSTRAINT, btree (star_id, planet_id)
Foreign-key constraints:
    "star_planet_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
    "star_planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id) -->
INSERT INTO star_planet (star_id, planet_id, is_primary_star, distance) VALUES
universe-> (1, 1, TRUE, 149.60),
universe-> (1, 2, TRUE, 227.94),
universe-> (2, 3, TRUE, 7.50);

SELECT*FROM star_planet;
<!-- +----------------+---------+-----------+-----------------+----------+
| star_planet_id | star_id | planet_id | is_primary_star | distance |
+----------------+---------+-----------+-----------------+----------+
|              1 |       1 |         1 | t               |   149.60 |
|              2 |       1 |         2 | t               |   227.94 |
|              3 |       2 |         3 | t               |     7.50 |
+----------------+---------+-----------+-----------------+----------+
(3 rows) -->
SELECT*FROM star_planet
universe-> FULL JOIN star ON star_planet.star_id = star.star_id
universe-> FULL JOIN planet ON star_planet.planet_id = planet.planet_id;
+----------------+---------+-----------+-----------------+----------+---------+-------------------+--------------------------+-----------+---------------------+---------------------+-----------+-----------+----------+--------------+--------------------------+---------------------+---------+
| star_planet_id | star_id | planet_id | is_primary_star | distance | star_id |       name        | age_in_millions_of_years | galaxy_id | distance_from_earth | mass_in_solar_units | planet_id |   name    | has_life | is_spherical | age_in_millions_of_years | distance_from_earth | star_id |
+----------------+---------+-----------+-----------------+----------+---------+-------------------+--------------------------+-----------+---------------------+---------------------+-----------+-----------+----------+--------------+--------------------------+---------------------+---------+
|              1 |       1 |         1 | t               |   149.60 |       1 | Sun               |                     4600 |         1 |                   0 |                   1 |         1 | Earth     | t        | t            |                     4500 |                0.00 |       1 |
|              2 |       1 |         2 | t               |   227.94 |       1 | Sun               |                     4600 |         1 |                   0 |                   1 |         2 | Mars      | f        | t            |                     4500 |                0.52 |       1 |
|              3 |       2 |         3 | t               |     7.50 |       2 | Proxima Centauri  |                     4500 |         1 |                4.24 |                   0 |         3 | Proxima b |          | t            |                     4800 |                4.24 |       2 |
|                |         |           |                 |          |       5 | Messier 87 Star A |                     7000 |         6 |            53000000 |                  15 |           |           |          |              |                          |                     |         |
|                |         |           |                 |          |       6 | Andromeda Star B  |                     6000 |         2 |             2500000 |                  12 |           |           |          |              |                          |                     |         |
|                |         |           |                 |          |       4 | Rigel             |                     8000 |         5 |                 860 |                  21 |           |           |          |              |                          |                     |         |
|                |         |           |                 |          |       3 | Sirius            |                      242 |         1 |                 8.6 |                   2 |           |           |          |              |                          |                     |         |
|                |         |           |                 |          |         |                   |                          |           |                     |                     |        11 | Andro-1   | t        | t            |                     7000 |          2537000.00 |       6 |
|                |         |           |                 |          |         |                   |                          |           |                     |                     |        12 | Andro-2   | f        | t            |                     7100 |          2537001.00 |       6 |
|                |         |           |                 |          |         |                   |                          |           |                     |                     |        10 | M87-Y     | f        | f            |                     9200 |         53000001.00 |       5 |
|                |         |           |                 |          |         |                   |                          |           |                     |                     |         5 | Sirius I  | f        | t            |                     3000 |                8.61 |       3 |
|                |         |           |                 |          |         |                   |                          |           |                     |                     |         8 | Rigel B2  | f        | t            |                     6500 |              862.00 |       4 |
|                |         |           |                 |          |         |                   |                          |           |                     |                     |         6 | Sirius II | f        | t            |                     2800 |                8.60 |       3 |
|                |         |           |                 |          |         |                   |                          |           |                     |                     |         4 | Proxima c | f        | t            |                     5000 |                4.25 |       2 |
|                |         |           |                 |          |         |                   |                          |           |                     |                     |         9 | M87-X     | f        | t            |                     9000 |         53000000.00 |       5 |
|                |         |           |                 |          |         |                   |                          |           |                     |                     |         7 | Rigel A1  | f        | t            |                     6000 |              861.00 |       4 |
+----------------+---------+-----------+-----------------+----------+---------+-------------------+--------------------------+-----------+---------------------+---------------------+-----------+-----------+----------+--------------+--------------------------+---------------------+---------+
(16 rows)
ALTER TABLE star_planet ADD COLUMN name VARCHAR(50) UNIQUE;
\d star_planet
<!-- 
                                               Table "public.star_planet"
+-----------------+-----------------------+-----------+----------+-----------------------------------------------------+
|     Column      |         Type          | Collation | Nullable |                       Default                       |
+-----------------+-----------------------+-----------+----------+-----------------------------------------------------+
| star_planet_id  | integer               |           | not null | nextval('star_planet_star_planet_id_seq'::regclass) |
| star_id         | integer               |           | not null |                                                     |
| planet_id       | integer               |           | not null |                                                     |
| is_primary_star | boolean               |           | not null |                                                     |
| distance        | numeric(8,2)          |           | not null |                                                     |
| name            | character varying(50) |           |          |                                                     |
+-----------------+-----------------------+-----------+----------+-----------------------------------------------------+
Indexes:
    "star_planet_pkey" PRIMARY KEY, btree (star_planet_id)
    "star_planet_name_key" UNIQUE CONSTRAINT, btree (name)
    "star_planet_star_id_planet_id_key" UNIQUE CONSTRAINT, btree (star_id, planet_id)
Foreign-key constraints:
    "star_planet_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
    "star_planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id) -->
UPDATE star_planet SET name = 'Sun–Earth' WHERE star_id = 1 AND planet_id = 1;
UPDATE star_planet SET name = 'Sun–Mars' WHERE star_id = 1 AND planet_id = 2;
UPDATE star_planet SET name = 'Proxima–Proxima b' WHERE star_id = 2 AND planet_id = 3;
SELECT*FROM star_planet;
<!-- +----------------+---------+-----------+-----------------+----------+-------------------+
| star_planet_id | star_id | planet_id | is_primary_star | distance |       name        |
+----------------+---------+-----------+-----------------+----------+-------------------+
|              1 |       1 |         1 | t               |   149.60 | Sun–Earth         |
|              2 |       1 |         2 | t               |   227.94 | Sun–Mars          |
|              3 |       2 |         3 | t               |     7.50 | Proxima–Proxima b |
+----------------+---------+-----------+-----------------+----------+-------------------+
(3 rows) -->
