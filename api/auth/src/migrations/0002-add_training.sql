
CREATE TABLE training (
  id SERIAL PRIMARY KEY,
  wordId INT REFERENCES vocabulary (id),
  sentenceId INT REFERENCES sentences (id),
  nextDate TIMESTAMP NOT NULL,
  lastNote INT,
  createdAt TIMESTAMP NOT NULL DEFAULT NOW()
);
