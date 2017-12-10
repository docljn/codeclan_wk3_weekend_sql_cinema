-- ccc.sql

DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS screenings;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS films;

CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  funds INT4
);


CREATE TABLE films (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  price INT4
);

CREATE TABLE screenings (
  id SERIAL4 PRIMARY KEY,
  screening_time TIME,
  capacity INT4,
  film_id INT4 REFERENCES films(id) ON DELETE CASCADE
);

-- NOT SURE: do I need to reference film_id in this table, as the screenings already references film_id? PROBABLY NOT, but leaving it in as otherwise everything needs rewritten!

CREATE TABLE tickets (
  id SERIAL4 PRIMARY KEY,
  film_id INT4 REFERENCES films(id)  ON DELETE CASCADE,
  customer_id INT4 REFERENCES  customers(id) ON DELETE CASCADE,
  screening_id INT4 REFERENCES screenings(id) ON DELETE CASCADE
);

















-- ccc.sql
