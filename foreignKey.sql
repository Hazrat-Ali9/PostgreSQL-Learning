-- ===============================
-- DROP TABLES IF EXIST
-- ===============================
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS "user";

-- ===============================
-- CREATE USER TABLE
-- ===============================
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);

-- ===============================
-- CREATE POST TABLE WITH FOREIGN KEY
-- ===============================
CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER NOT NULL DEFAULT 2 REFERENCES "user"(id) ON DELETE SET DEFAULT
);

-- ===============================
-- INSERT SAMPLE DATA
-- ===============================
INSERT INTO "user" (username) VALUES
('akash'),
('batash'),
('sagor'),
('nodi');

INSERT INTO post (title, user_id) VALUES
('Enjoying a sunny day with Akash! ☀️', 2),
('Batash just shared an amazing recipe! 🍲', 1),
('Exploring adventures with Sagor.🌟', 4),
('Nodi''s wisdom always leaves me inspired. 📚', 4);

-- ===============================
-- TEST QUERIES
-- ===============================
SELECT * FROM "user";
SELECT * FROM post;

-- Attempting to insert a post without specifying a valid user_id
-- This will use the default value (2) due to ON DELETE SET DEFAULT and DEFAULT constraint
INSERT INTO post (title) VALUES ('Test post with default user_id');

-- Attempting to insert a post with NULL user_id (will fail because NOT NULL is enforced)
-- INSERT INTO post (title, user_id) VALUES ('Invalid post', NULL); -- Uncommenting will throw error

-- ===============================
-- DELETE USER TEST
-- ===============================
-- Deleting user with id = 4 (Nodi)
-- user_id in posts will be set to default (2) due to ON DELETE SET DEFAULT
DELETE FROM "user" WHERE id = 4;

-- Check results after deletion
SELECT * FROM "user";
SELECT * FROM post;
