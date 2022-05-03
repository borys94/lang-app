
CREATE TABLE grammar (
  grammar_id SERIAL PRIMARY KEY,
  name VARCHAR(500) NOT NULL,
  lang VARCHAR(100) NOT NULL,
  level VARCHAR(100) NOT NULL,
  value text NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE grammar_exercise (
  grammar_exercise_id SERIAL PRIMARY KEY,
  grammar_id INT REFERENCES grammar (grammar_id) NOT NULL,
  name VARCHAR(500) NOT NULL,
  value text NOT NULL,
  answers text NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);