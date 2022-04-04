
CREATE TABLE trainings (
  training_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  lang VARCHAR(100) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE words (
  word_id SERIAL PRIMARY KEY,
  value VARCHAR(200) NOT NULL,
  translated VARCHAR(200) NOT NULL,
  training_id INT REFERENCES trainings (training_id) NOT NULL,
  next_date DATE NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE notes (
  word_id INT REFERENCES words (word_id),
  note INT NOT NULL,
);