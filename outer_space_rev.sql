DROP DATABASE IF EXISTS outer_space_rev;

CREATE DATABASE outer_space_rev;

\c outer_space_rev

CREATE TABLE galaxies (
  id SERIAL PRIMARY KEY,
  galaxy_name VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE stars (
  id SERIAL PRIMARY KEY,
  star_name VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  moon_name VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  planet_name VARCHAR(20) UNIQUE NOT NULL,
  orbital_period FLOAT NOT NULL,
  star_id INTEGER NOT NULL REFERENCES stars,
  galaxy_id INTEGER NOT NULL REFERENCES galaxies
);

CREATE TABLE planet_moons (
  id SERIAL PRIMARY KEY,
  planet_id INTEGER NOT NULL REFERENCES planets,
  moon_id INTEGER NOT NULL REFERENCES moons
);

INSERT INTO galaxies (galaxy_name)
VALUES
('Milky Way'),
('Andromeda');

INSERT INTO stars (star_name)
VALUES
('The Sun'),
('Proxima Centauri'),
('Gliese 876');

INSERT INTO moons (moon_name)
VALUES
('THe Moon'),
('Phobos'),
('Deimos'),
('Naiad'),
('Thalassa'),
('Despina'),
('Galatea'),
('Larissa'),
('S/2004 N1'),
('Proteus'),
('Triton'),
('Nereid'),
('Halimede'),
('Sao'),
('Laomedeia'),
('Psamathe'),
('Neso');

INSERT INTO planets (planet_name, orbital_period, star_id, galaxy_id)
VALUES
('Earth', 1.00, 1, 1),
('Mars', 1.88, 1, 1),
('Venus', 0.62, 1, 1),
('Neptune', 164.8, 1, 1),
('Proxima Centauri b', 0.03, 2, 1),
('Gliese 876 b', 0.23, 3, 1);

INSERT INTO planet_moons (planet_id, moon_id)
VALUES
(1, 1),
(2, 2),
(2, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(4, 17);

