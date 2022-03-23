DROP DATABASE IF EXISTS music_rev;

CREATE DATABASE music_rev;

\c music_rev

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  artist_name VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  prod_name VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title VARCHAR(30) UNIQUE NOT NULL,
  duration INT NOT NULL,
  release_date DATE NOT NULL,
  album VARCHAR(30) NOT NULL
);

CREATE TABLE song_artists (
  id SERIAL PRIMARY KEY,
  song_id INT NOT NULL REFERENCES songs,
  artist_id INT NOT NULL REFERENCES artists
);

CREATE TABLE song_producers
(
  id SERIAL PRIMARY KEY,
  song_id INT NOT NULL REFERENCES songs,
  producer_id INT NOT NULL REFERENCES producers
);

INSERT INTO artists (artist_name)
VALUES
('Hanson'),
('Queen'),
('Mariah Cary'),
('Boyz II Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destiny''s Child');

INSERT INTO producers (prod_name)
VALUES
('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick Parashar'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Darkchild');

INSERT INTO songs (title, duration, release_date, album)
VALUES
('MMMBop', 238, '1997-04-15', 'Middle of Nowhere'),
('Bohemian Rhapsody', 355, '1975-10-31', 'A Night at the Opera'),
('One Sweet Day', 282, '1995-11-14', 'Daydream'),
('Shallow', 216, '2018-09-27', 'A Star Is Born'),
('How You Remind Me', 223, '2001-08-21', 'Silver Side Up'),
('New York State of Mind', 276, '2009-10-20', 'The Blueprint 3'),
('Dark Horse', 215, '2013-12-17', 'Prism'),
('Moves Like Jagger', 201, '2011-06-21', 'Hands All Over'),
('Complicated', 244, '2002-05-14', 'Let Go'),
('Say My Name', 240, '1999-11-07', 'The Writing''s on the Wall');

INSERT INTO song_artists (song_id, artist_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 5),
(4, 6),
(5, 7),
(6, 8),
(6, 9),
(7, 10),
(7, 11),
(8, 12),
(8, 13),
(9, 14),
(10, 15);

INSERT INTO song_producers (song_id, producer_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(7, 9),
(8, 10),
(8, 11),
(9, 12),
(10, 13);

SELECT s.title, s.duration AS duration_in_seconds, s.release_date,
  a.artist_name AS artists, s.album, p.prod_name AS producers
  FROM songs s
  JOIN song_artists sa
  ON s.id = sa.song_id
  JOIN artists a
  ON sa.artist_id = a.id
  JOIN song_producers sp
  ON sp.song_id = s.id
  JOIN producers p
  ON sp.producer_id = p.id;
  