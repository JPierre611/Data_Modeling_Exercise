DROP DATABASE IF EXISTS air_traffic_rev;

CREATE DATABASE air_traffic_rev;

\c air_traffic_rev

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  airline_name VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE destinations (
  id SERIAL PRIMARY KEY,
  city VARCHAR(20) NOT NULL,
  country VARCHAR(15) NOT NULL
);

CREATE TABLE origins (
  id SERIAL PRIMARY KEY,
  city VARCHAR(20) NOT NULL,
  country VARCHAR(15) NOT NULL
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(15) NOT NULL,
  last_name VARCHAR(15) NOT NULL
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  customer_id INT NOT NULL REFERENCES customers,
  seat VARCHAR(4) NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INT NOT NULL REFERENCES airlines,
  origin_id INT NOT NULL REFERENCES origins,
  destination_id INT NOT NULL REFERENCES destinations
);

INSERT INTO airlines (airline_name)
VALUES
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');

INSERT INTO origins (city, country)
VALUES
('Washington DC', 'United States'),
('Tokyo', 'Japan'),
('Los Angeles', 'United States'),
('Seattle', 'United States'),
('Paris', 'France'),
('Dubai', 'UAE'),
('New York', 'United States'),
('Cedar Rapids','United States'),
('Charlotte', 'United States'),
('Sao Paulo', 'Brasil');

INSERT INTO destinations (city, country)
VALUES
('Seattle', 'United States'),
('London', 'United Kingdom'),
('Las Vegas', 'United States'),
('Mexico City', 'Mexico'),
('Casablanca', 'Morocco'),
('Beijing', 'China'),
('Charlotte', 'United States'),
('Chicago', 'United States'),
('New Orleans', 'United States'),
('Santiago', 'Chile');

INSERT INTO customers (first_name, last_name)
VALUES
('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley'),
('Waneta', 'Skeleton'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'),
('Cory', 'Squibbes');

INSERT INTO tickets (customer_id, seat, departure, arrival, airline_id, origin_id, destination_id)
VALUES
(1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1),
(2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 2),
(3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 3),
(1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 4, 4),
(4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 5, 5),
(2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 6, 6),
(5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 7, 7),
(6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 8, 8),
(5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 9, 9),
(7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 10, 10);

SELECT c.first_name, c.last_name, t.seat, t.departure, t.arrival,
  a.airline_name AS airline, o.city AS from_city, o.country AS from_country,
  d.city AS to_city, d.country AS to_country
  FROM customers c
  JOIN tickets t
  ON c.id = t.customer_id
  JOIN airlines a
  ON a.id = t.airline_id
  JOIN origins o
  ON o.id = t.origin_id
  JOIN destinations d
  ON d.id = t.destination_id;
