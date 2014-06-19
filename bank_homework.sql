-- In case there is already a bank_homework database, drop it
DROP DATABASE IF EXISTS bank_homework;

-- Create a bank_homework database

CREATE DATABASE bank_homework;


-- Connect to the bank_homework databases

\c bank_homework
-- Create a payments table
--  The table should have columns of id, created_at, amount, payer_name,
--  recipient_name, and description with the appropriate datatypes

CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  created_at DATE NOT NULL,
  amount INTEGER NOT NULL,
  payer_name TEXT,
  recipient_name TEXT,
  description TEXT
);


-- Alter the payments table, add the column of `zipcode`
-- to specify where the transaction was made
ALTER TABLE payments ADD zipcode TEXT;

-- Insert 20 rows into the payments table
-- The first of these payments should be deposits
-- try to keep the accounts positive and have at least three different payers.

INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode) VALUES
  ('2014-06-12', 50, 'Nick', 'Citizens Bank', 'deposit', 02038),
  ('2014-06-13', 150, 'Nick', 'Citizens Bank', 'deposit', 02038),
  ('2014-06-13', 250, 'Nick', 'Citizens Bank', 'deposit', 02038),
  ('2014-06-13', 350, 'Nick', 'Citizens Bank', 'deposit', 02038),
  ('2014-06-14', 1, 'Nick', 'Citizens Bank', 'deposit', 02038),
  ('2014-06-14', 150, 'Jerry', 'Chase Bank', 'deposit', 02038),
  ('2014-06-14', 250, 'Jerry', 'Chase Bank', 'deposit', 02038),
  ('2014-06-15', 350, 'Jerry', 'Chase Bank', 'deposit', 02038),
  ('2014-06-15', 450, 'Jerry', 'Chase Bank', 'deposit', 02038), --
  ('2014-06-15', 550, 'Jerry', 'Chase Bank', 'deposit', 02038),
  ('2014-06-15', 650, 'Dave', 'TD Bank', 'deposit', 02038),
  ('2014-06-16', 750, 'Dave', 'TD Bank', 'deposit', 02038),
  ('2014-06-16', 1, 'Dave', 'TD Bank', 'deposit', 02038),
  ('2014-06-16', 950, 'Dave', 'TD Bank', 'deposit', 02038),
  ('2014-06-16', 150, 'Dave', 'TD Bank', 'deposit', 02038),
  ('2014-06-17', 250, 'Richard', 'Middlesex Bank', null, 02038),
  ('2014-06-17', 350, 'Richard', 'Middlesex Bank', null, 02038),
  ('2014-06-17', 450, 'Richard', 'Middlesex Bank', null, 02038),
  ('2014-06-17', 550, 'Richard', 'Middlesex Bank', null, 02038),
  ('2014-06-17', 1, 'Nick', 'Citizens Bank', 'deposit', 02038);


-- You receive notice that the payment with id of 9 is $10 too low.
-- Alter that row so that it is corrected
UPDATE payments SET amount = 460 WHERE id = 9;

-- Delete all payments with an amount under $2


-- Select all entries from the payments table
SELECT * FROM payments;

-- In a single query, output all payments ordered from the largest to the smallest
SELECT * FROM payments ORDER BY amount DESC;

-- In a single query, output the names of all distinct recipients
SELECT DISTINCT payer_name FROM payments;

-- In a single query, select all payments created in the past week
SELECT * FROM payments WHERE created_at > (CURRENT_TIMESTAMP - interval '7 days');
-- In a single query, select all payments with a blank description

SELECT DISTINCT payer_name FROM payments WHERE description IS NULL;
-- In a single query, select all payments matching the name of one of the payers (choose any single one)
SELECT * FROM payments WHERE payer_name = 'Nick';
