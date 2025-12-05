-- ===============================
-- CREATE TABLE: persons
-- ===============================
DROP TABLE IF EXISTS persons;

CREATE TABLE persons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INTEGER CHECK (age >= 0),
    profession VARCHAR(100),
    salary INT NOT NULL,
    isActive BOOLEAN DEFAULT TRUE,
    date_of_birth DATE CHECK (date_of_birth <= CURRENT_DATE),
    rating NUMERIC(3,2) CHECK (rating >= 0 AND rating <= 9.99),
    email VARCHAR(100) DEFAULT 'n/a'
);

-- ===============================
-- INSERT SAMPLE DATA INTO persons
-- ===============================
INSERT INTO persons (name, age, profession, salary, isActive, date_of_birth, rating) VALUES
('Alice', 28, 'Software Engineer', 80000, TRUE, '1994-03-15', 8.5),
('Bob', 35, 'Instructor', 60000, TRUE, '1989-10-20', 7.2),
('Charlie', 42, 'Artist', 45000, TRUE, '1982-05-10', 9.0),
('David', 30, 'Pilot', 90000, TRUE, '1992-09-05', 8.8),
('Emma', 25, 'Software Engineer', 85000, TRUE, '1997-07-22', 9.2),
('Frank', 40, 'Pilot', 95000, FALSE, NULL, 7.5),
('Grace', 38, 'Artist', 50000, TRUE, '1983-04-28', 8.0),
('Hannah', 27, 'Instructor', 70000, TRUE, '1995-08-09', 8.3),
('Ian', 33, 'Software Engineer', 82000, TRUE, '1989-02-18', 8.7),
('Julia', 29, 'Instructor', 65000, TRUE, NULL, 7.9),
('Kevin', 45, 'Artist', 48000, FALSE, '1979-06-25', 7.6),
('Lily', 36, 'Pilot', 92000, TRUE, '1988-03-07', 8.9),
('Megan', 31, 'Software Engineer', 87000, TRUE, '1990-01-14', 9.1),
('Nathan', 26, 'Artist', 47000, TRUE, '1996-09-03', 8.2),
('Olivia', 39, 'Instructor', 72000, TRUE, '1982-10-31', 8.4),
('Peter', 34, 'Pilot', 91000, FALSE, '1987-07-17', 8.6),
('Quinn', 32, 'Software Engineer', 83000, TRUE, '1989-12-29', 8.8),
('Rachel', 37, 'Instructor', 69000, TRUE, '1985-05-08', 8.1),
('Simon', 41, 'Artist', 52000, TRUE, '1980-08-19', 8.0),
('Tina', 24, 'Pilot', 88000, TRUE, '2000-02-01', 8.5);

-- ===============================
-- CREATE TABLES: users & orders
-- ===============================
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL
);

-- ===============================
-- INSERT SAMPLE DATA INTO users & orders
-- ===============================
INSERT INTO users (username, email) VALUES
('John', 'john@example.com'),
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Emma', 'emma@example.com'),
('Michael', 'michael@example.com');

INSERT INTO orders (user_id, order_date, total_amount) VALUES
(1, '2024-02-01', 100.50),
(2, '2024-02-15', 75.25),
(1, '2024-02-20', 200.00),
(3, '2024-02-25', 50.75),
(2, '2024-02-28', 120.00),
(1, '2024-03-05', 45.75),
(3, '2024-03-10', 150.00),
(NULL, '2024-03-12', 30.00),
(5, '2024-03-20', 80.50),
(NULL, '2024-03-25', 25.25);

-- ===============================
-- EXAMPLE QUERIES
-- ===============================
-- Select persons aged 30-40
SELECT * FROM persons
WHERE age BETWEEN 30 AND 40;

-- Persons whose name starts with 'A'
SELECT * FROM persons
WHERE name LIKE 'A%';

-- Aggregate: count per profession, avg salary
SELECT profession, COUNT(*) AS num_persons, AVG(salary) AS avg_salary
FROM persons
GROUP BY profession
HAVING COUNT(*) > 3;

-- Select persons earning more than avg salary of software engineers
SELECT *
FROM persons
WHERE salary > (SELECT AVG(salary) FROM persons WHERE profession = 'Software Engineer');

-- LEFT JOIN users and orders
SELECT u.*, o.order_id, o.order_date, o.total_amount
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id;

-- RIGHT JOIN
SELECT u.*, o.order_id, o.order_date, o.total_amount
FROM users u
RIGHT JOIN orders o ON u.user_id = o.user_id;

-- FULL JOIN
SELECT u.*, o.order_id, o.order_date, o.total_amount
FROM users u
FULL JOIN orders o ON u.user_id = o.user_id;

-- Update example
UPDATE users
SET username = 'Zaviyar'
WHERE username = 'Alice';
