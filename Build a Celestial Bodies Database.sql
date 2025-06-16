CREATE DATABASE universe;

CREATE TABLE galaxy(
 galaxy_id SERIAL PRIMARY KEY,
 name VARCHAR(20) NOT NULL,
 has_life BOOLEAN,
 galaxy_types VARCHAR(30) NOT NULL,
 description TEXT
 );

ALTER TABLE galaxy ADD UNIQUE (name);

INSERT INTO galaxy(name, has_life, galaxy_types, description) VALUES
 ('Milky Way', TRUE, 'spiral', 'Наша галактика'),
 ('Andromeda', FALSE, 'spiral', 'Найбільша в нашій групі галактик'),
 ('Triangulum', FALSE, 'spiral', 'Третя за розміром в Local Group'),
 ('Sombrero', FALSE, 'elliptical', 'Виглядає як сомбреро'),
 ('Large Magellanic', TRUE, 'irregular', 'Мала супутникова галактика Молочного Шляху'),
 ('Messier 87', FALSE, 'elliptical', 'Відома чорною дірою в центрі');

SELECT*FROM galaxy;

CREATE TABLE star(
 star_id SERIAL PRIMARY KEY,
 name VARCHAR(20) UNIQUE,
 age_in_millions_of_years INT NOT NULL,
 galaxy_id INT NOT NULL,
 distance_from_earth NUMERIC);

ALTER TABLE star ADD FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id);
ALTER TABLE star ADD COLUMN mass_in_solar_units INT NOT NULL;

INSERT INTO star(name, age_in_millions_of_years, galaxy_id, distance_from_earth, mass_in_solar_units) 
VALUES('Sun', 4600, 1, 0, 1),
 ('Proxima Centauri', 4500, 1, 4.24, 0),
 ('Sirius', 242, 1, 8.6, 2),
 ('Rigel', 8000, 5, 860, 21),
 ('Messier 87 Star A', 7000, 6, 53000000, 15),
 ('Andromeda Star B', 6000, 2, 2500000, 12);

SELECT*FROM star;

CREATE TABLE planet(
 planet_id SERIAL PRIMARY KEY,
 name VARCHAR(20) UNIQUE,
 has_life BOOLEAN,
 is_spherical BOOLEAN,
 age_in_millions_of_years INT NOT NULL,
 distance_from_earth NUMERIC(4,2),
 star_id INT NOT NULL REFERENCES star(star_id));

ALTER TABLE planet ALTER COLUMN distance_from_earth TYPE NUMERIC(10,2);

INSERT INTO planet(name, has_life, is_spherical, age_in_millions_of_years, distance_from_earth, star_id)
VALUES('Earth', TRUE, TRUE, 4500, 0.00, 1),
 ('Mars', FALSE, TRUE, 4500, 0.52, 1),
 ('Proxima b', NULL, TRUE, 4800, 4.24, 2),
 ('Proxima c', FALSE, TRUE, 5000, 4.25, 2),
 ('Sirius I', FALSE, TRUE, 3000, 8.61, 3),
 ('Sirius II', FALSE, TRUE, 2800, 8.60, 3),
 ('Rigel A1', FALSE, TRUE, 6000, 861.00, 4),
 ('Rigel B2', FALSE, TRUE, 6500, 862.00, 4),
 ('M87-X', FALSE, TRUE, 9000, 53000000.00, 5),
 ('M87-Y', FALSE, FALSE, 9200, 53000001.00, 5),
 ('Andro-1', TRUE, TRUE, 7000, 2537000.00, 6),
 ('Andro-2', FALSE, TRUE, 7100, 2537001.00, 6);
SELECT*FROM planet;

CREATE TABLE moon(
 moon_id SERIAL PRIMARY KEY,
 name VARCHAR(20) UNIQUE,
 description TEXT NOT NULL,
 age_in_millions_of_years INT NOT NULL,
 mass_in_solar_units INT,
 planet_id INT NOT NULL REFERENCES planet(planet_id));

INSERT INTO moon(name, description, age_in_millions_of_years, mass_in_solar_units, planet_id)
 VALUES('Luna', 'Єдиний природний супутник Землі', 4500, 1, 1),
 ('Deimos', 'Маленький супутник Марса', 4500, 0, 2),
 ('Phobos', 'Великий супутник Марса', 4500, 1, 2),
 ('Centurion', 'Гіпотетичний супутник Proxima b', 4800, 2, 3),
 ('Nightshade', 'Тіньова орбіта Proxima b', 4800, 1, 3),
 ('Umbra', 'Темний супутник Proxima c', 5000, 1, 4),
 ('Gloom', 'Темний сателіт', 5000, 1, 4),
 ('Sirius Alpha', 'Яскравий супутник Sirius I', 3000, 5, 5),
 ('Sirius Beta', 'Близнюк Alpha', 3000, 5, 5),
 ('Icepearl', 'Заморожений супутник Sirius II', 2800, 3, 6),
 ('Frostbite', 'З крижаним ядром', 2800, 2, 6),
 ('Rigel Moon 1', 'Супутник блакитного гіганта', 6000, 10, 7),
 ('Rigel Moon 2', 'Інший супутник', 6000, 9, 7),
 ('Rigel Halo', 'Супутник із кільцями', 6500, 7, 8),
 ('Brightring', 'Внутрішній супутник', 6500, 6, 8),
 ('M87-Alpha', 'Супутник у галактиці Messier 87', 9000, 15, 9),
 ('M87-Beta', 'Величезний супутник', 9100, 20, 9),
 ('M87-Zeta', 'Віддалений супутник', 9200, 13, 10),
 ('Andro-L1', 'Перший супутник планети Andro-1', 7000, 4, 11),
 ('Andro-L2', 'Другий супутник', 7100, 3, 12);

SELECT*FROM moon;

CREATE TABLE star_planet(
  star_planet_id SERIAL PRIMARY KEY,
  star_id INT NOT NULL REFERENCES star(star_id),
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  is_primary_star BOOLEAN NOT NULL,
  distance NUMERIC(8,2) NOT NULL,
  UNIQUE (star_id, planet_id));

INSERT INTO star_planet (star_id, planet_id, is_primary_star, distance) VALUES
 (1, 1, TRUE, 149.60),
 (1, 2, TRUE, 227.94),
 (2, 3, TRUE, 7.50);

 SELECT*FROM star_planet;

ALTER TABLE star_planet
ADD COLUMN name VARCHAR(50) UNIQUE;
UPDATE star_planet SET name = 'Sun–Earth' WHERE star_id = 1 AND planet_id = 1;
UPDATE star_planet SET name = 'Sun–Mars' WHERE star_id = 1 AND planet_id = 2;
UPDATE star_planet SET name = 'Proxima–Proxima b' WHERE star_id = 2 AND planet_id = 3;