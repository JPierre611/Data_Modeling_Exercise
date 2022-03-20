DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  team_name VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  player_first_name VARCHAR(15) NOT NULL,
  player_last_name VARCHAR(15) NOT NULL,
  team_id INTEGER NOT NULL REFERENCES teams
);

CREATE TABLE referees (
  id SERIAL PRIMARY KEY,
  ref_first_name VARCHAR(15) NOT NULL,
  ref_last_name VARCHAR(15) NOT NULL
);

CREATE TABLE seasons (
  id SERIAL PRIMARY KEY,
  season_name VARCHAR(15) UNIQUE NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  game_date DATE NOT NULL,
  team1_id INTEGER NOT NULL REFERENCES teams,
  team2_id INTEGER NOT NULL REFERENCES teams,
  ref1_id INTEGER NOT NULL REFERENCES referees,
  ref2_id INTEGER NOT NULL REFERENCES referees
);

CREATE TABLE goals (
  id SERIAL PRIMARY KEY,
  player_id INTEGER NOT NULL REFERENCES players,
  game_id INTEGER NOT NULL REFERENCES games
);

INSERT INTO seasons (season_name, start_date, end_date)
VALUES
('2019', '2019-07-02', '2019-10-31'),
('2020', '2020-07-02', '2020-10-31');

INSERT INTO referees (ref_first_name, ref_last_name)
VALUES
('Sylvie', 'Blondin'),
('Joe', 'Carter'),
('Edward', 'Carpenter'),
('Eve', 'Corbett');

INSERT INTO teams (team_name)
VALUES
('Calgary'),
('Airdrie'),
('Cochrane'),
('Chestermere');

INSERT into players (player_first_name, player_last_name, team_id)
VALUES
('Tony', 'Esposito', 2),
('John', 'Smyth', 3),
('Brian', 'Tobin', 4),
('Hector', 'Reyes', 1);

INSERT into games (game_date, team1_id, team2_id, ref1_id, ref2_id)
VALUES
('2019-07-02', 1, 2, 2, 3),
('2019-07-02', 3, 4, 1, 4),
('2019-07-03', 1, 4, 1, 3),
('2019-07-05', 2, 3, 2, 4);

INSERT into goals (player_id, game_id)
VALUES
(1, 1),
(4, 1),
(2, 2),
(2, 2),
(3, 3),
(2, 4);
