-- Drop and create the database
DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;
\c medical_center

-- Create tables
CREATE TABLE doctors (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  specialization TEXT NOT NULL
);

CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  date_of_birth DATE NOT NULL
);

CREATE TABLE diseases (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT
);

CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  patient_id INT REFERENCES patients(id),
  doctor_id INT REFERENCES doctors(id),
  visit_date DATE NOT NULL
);

CREATE TABLE visit_diseases (
  visit_id INT REFERENCES visits(id),
  disease_id INT REFERENCES diseases(id),
  PRIMARY KEY (visit_id, disease_id)
);

-- Insert sample data
INSERT INTO doctors (name, specialization) VALUES
  ('Dr. Smith', 'Cardiologist'),
  ('Dr. Johnson', 'Neurologist');

INSERT INTO patients (name, date_of_birth) VALUES
  ('John Doe', '1980-01-01'),
  ('Jane Roe', '1990-02-02');

INSERT INTO diseases (name, description) VALUES
  ('Diabetes', 'A chronic disease that affects insulin regulation.'),
  ('Hypertension', 'High blood pressure.');

INSERT INTO visits (patient_id, doctor_id, visit_date) VALUES
  (1, 1, '2024-06-01'),
  (2, 2, '2024-06-02');

INSERT INTO visit_diseases (visit_id, disease_id) VALUES
  (1, 1),
  (2, 2);
