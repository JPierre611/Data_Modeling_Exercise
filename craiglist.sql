DROP DATABASE IF EXISTS craiglist;

CREATE DATABASE craiglist;

\c craiglist

CREATE TABLE regions (
  id SERIAL PRIMARY KEY,
  region_name VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  user_name VARCHAR(15) UNIQUE NOT NULL,
  user_region_id INTEGER NOT NULL REFERENCES regions ON DELETE CASCADE
);

CREATE TABLE locations (
  id SERIAL PRIMARY KEY,
  loc_name VARCHAR(25) UNIQUE NOT NULL,
  loc_region_id INTEGER NOT NULL REFERENCES regions ON DELETE CASCADE
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  cat_name VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title VARCHAR(30) UNIQUE NOT NULL,
  description TEXT NOT NULL,
  post_user_id INTEGER NOT NULL REFERENCES users ON DELETE CASCADE,
  post_loc_id INTEGER NOT NULL REFERENCES locations ON DELETE CASCADE,
  post_cat_id INTEGER NOT NULL REFERENCES categories ON DELETE CASCADE
);

INSERT INTO categories (cat_name)
VALUES
('Houses for Sale'),
('Cars for Sale');

INSERT INTO regions (region_name)
VALUES
('Southern Alberta'),
('Central Alberta');

INSERT INTO users (user_name, user_region_id)
VALUES
('ksmyth', 1),
('jdoe', 2),
('sturner', 1);

INSERT INTO locations (loc_name, loc_region_id)
VALUES
('Calgary', 1),
('Lethbridge', 1),
('Red Deer', 2);

INSERT INTO posts (title, description, post_user_id, post_loc_id, post_cat_id)
VALUES
('Honda 2000', 'Honda CRV 2000 for sale, fuel efficient, clean, AC', 1, 2, 2),
('Townhouse', 'Newly renovated townhouse for sale, 3 bedrooms, 2 4-pc bathrooms', 3, 3, 1);
