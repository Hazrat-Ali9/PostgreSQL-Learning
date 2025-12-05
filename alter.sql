-- Active: 1699467625194@@127.0.0.1@5432@ph@public

-- Select all data from person4
SELECT * 
FROM person4;

-- --- Alter person2 table examples ---

-- Add a new column with default value and NOT NULL constraint
ALTER TABLE person2
ADD COLUMN email VARCHAR(25) NOT NULL DEFAULT 'default@mail.com';

-- Drop a column
ALTER TABLE person2
DROP COLUMN email;

-- Rename a column
ALTER TABLE person2
RENAME COLUMN age TO user_age;

-- Change column data type
ALTER TABLE person2
ALTER COLUMN user_name TYPE VARCHAR(50);

-- Add a UNIQUE constraint to a column
ALTER TABLE person2
ADD CONSTRAINT unique_user_age UNIQUE(user_age);

-- Drop NOT NULL constraint
ALTER TABLE person2
ALTER COLUMN user_age DROP NOT NULL;

-- Drop UNIQUE constraint
ALTER TABLE person2
DROP CONSTRAINT unique_user_age;

-- --- Data management operations ---

-- Remove all data from table (resets sequences in PostgreSQL if any)
TRUNCATE TABLE person2 RESTART IDENTITY;

-- Drop the table completely
DROP TABLE person2;

-- --- Example insert statement ---
-- INSERT INTO person4(id, name, age) VALUES (10, 'mizan', 45);
