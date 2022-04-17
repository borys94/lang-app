
CREATE TABLE exercise (
  exercise_id SERIAL PRIMARY KEY,
  grammar_id INT REFERENCES grammar (grammar_id) NOT NULL,
  name VARCHAR(500) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE sub_exercise (
  sub_exercise_id SERIAL PRIMARY KEY,
  exercise_id INT REFERENCES exercise (exercise_id) NOT NULL,
  value VARCHAR(500) NOT NULL,
  answers VARCHAR(200)[] NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);
