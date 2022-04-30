CREATE TABLE word_categories (
  word_category_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  lang VARCHAR(100) NOT NULL,
  level VARCHAR(100) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE words (
  word_id SERIAL PRIMARY KEY,
  value VARCHAR(100) NOT NULL,
  translated VARCHAR(255) NOT NULL,
  word_category_id INT REFERENCES word_categories (word_category_id) ON DELETE CASCADE NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);