DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
	id SERIAL PRIMARY KEY,
	dr_firstname VARCHAR(15) NOT NULL,
	dr_lastname VARCHAR(15) NOT NULL
);

CREATE TABLE patients (
	id SERIAL PRIMARY KEY,
	firstname VARCHAR(15) NOT NULL,
	lastname VARCHAR(15) NOT NULL
);

CREATE TABLE diseases (
	id SERIAL PRIMARY KEY,
	disease_name VARCHAR(25) UNIQUE NOT NULL
);

CREATE TABLE patients_doctors (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients ON DELETE CASCADE,
    doctor_id INTEGER NOT NULL REFERENCES doctors ON DELETE CASCADE
);

CREATE TABLE patients_diseases (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients ON DELETE CASCADE,
    disease_id INTEGER NOT NULL REFERENCES diseases ON DELETE CASCADE
);

INSERT INTO doctors (dr_firstname, dr_lastname)
VALUES
('John', 'Smyth'),
('Jane', 'Turner');

INSERT INTO patients (firstname, lastname)
VALUES
('Samuel', 'Connor'),
('Kate', 'Johnson');

INSERT INTO diseases (disease_name)
VALUES
('cancer'),
('appendicitus');

INSERT INTO patients_doctors (patient_id, doctor_id)
VALUES
(1, 1),
(1, 2),
(2, 2);

INSERT INTO patients_diseases (patient_id, disease_id)
VALUES
(1, 1),
(2, 1),
(2, 2);