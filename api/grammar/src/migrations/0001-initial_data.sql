
CREATE TABLE grammar (
  grammar_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  lang VARCHAR(100) NOT NULL,
  level VARCHAR(100) NOT NULL,
  value text NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE examples (
  example_id SERIAL PRIMARY KEY,
  value text NOT NULL,
  translated text NOT NULL,
  grammar_id INT REFERENCES grammar (grammar_id) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);
