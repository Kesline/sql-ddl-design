-- Drop and create the database
DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist

-- Create tables
CREATE TABLE regions (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  preferred_region_id INT REFERENCES regions(id)
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  text TEXT NOT NULL,
  user_id INT REFERENCES users(id),
  region_id INT REFERENCES regions(id),
  category_id INT REFERENCES categories(id)
);

-- Insert sample data
INSERT INTO regions (name) VALUES
  ('San Francisco'),
  ('Atlanta'),
  ('Seattle');

INSERT INTO users (name, preferred_region_id) VALUES
  ('Alice', 1),
  ('Bob', 2);

INSERT INTO categories (name) VALUES
  ('Electronics'),
  ('Furniture');

INSERT INTO posts (title, text, user_id, region_id, category_id) VALUES
  ('iPhone for sale', 'Selling a slightly used iPhone.', 1, 1, 1),
  ('Sofa for sale', 'Selling a comfortable sofa.', 2, 2, 2);
