-- Drop and create the database
DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league

-- Create tables
CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  team_id INT REFERENCES teams(id)
);

CREATE TABLE referees (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE seasons (
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  team1_id INT REFERENCES teams(id),
  team2_id INT REFERENCES teams(id),
  match_date DATE NOT NULL,
  season_id INT REFERENCES seasons(id)
);

CREATE TABLE goals (
  id SERIAL PRIMARY KEY,
  player_id INT REFERENCES players(id),
  match_id INT REFERENCES matches(id),
  time_scored TIME NOT NULL
);

CREATE TABLE match_referees (
  match_id INT REFERENCES matches(id),
  referee_id INT REFERENCES referees(id),
  PRIMARY KEY (match_id, referee_id)
);

-- Insert sample data
INSERT INTO teams (name) VALUES
  ('Team A'),
  ('Team B');

INSERT INTO players (name, team_id) VALUES
  ('Player 1', 1),
  ('Player 2', 2);

INSERT INTO referees (name) VALUES
  ('Referee 1'),
  ('Referee 2');

INSERT INTO seasons (start_date, end_date) VALUES
  ('2024-01-01', '2024-12-31');

INSERT INTO matches (team1_id, team2_id, match_date, season_id) VALUES
  (1, 2, '2024-06-05', 1);

INSERT INTO goals (player_id, match_id, time_scored) VALUES
  (1, 1, '00:15:00'),
  (2, 1, '00:30:00');

INSERT INTO match_referees (match_id, referee_id) VALUES
  (1, 1),
  (1, 2);
