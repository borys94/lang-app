
CREATE TABLE training (
  training_id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users (id) NOT NULL,
  lang VARCHAR(100) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE training_words (
  training_word_id SERIAL PRIMARY KEY,
  training_id INT REFERENCES training (training_id) NOT NULL,
  word_id INT REFERENCES words (word_id) NOT NULL,
  next_date DATE NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE notes (
  training_word_id INT REFERENCES training_words (training_word_id),
  note INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);