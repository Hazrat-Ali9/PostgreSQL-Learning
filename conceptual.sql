-- it will throw error, need to provide data type
CREATE Table persons (
    id,
    name,
    age,
    profession,
    isActive,
    dob,
    rating
);


-- Data type => Module:17:Video7
CREATE TABLE persons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INTEGER,
    profession VARCHAR(100),
    isActive BOOLEAN,
    dob DATE,
    rating NUMERIC(3,2) -- With NUMERIC(3,2), you can store numbers with up to 3 digits in total, and 2 of them can be used for the fractional part.
);

drop Table persons;
SELECT * from persons;





/*
Boolean -> true, false, (NULL)
-------------------

-- NOT null, unique, DEFAULT, CHECK, primary key, FOREIGN key

CREATE TABLE persons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL, -- Adding NOT NULL constraint to ensure name is always provided
    age INTEGER CHECK (age >= 0), -- Adding CHECK constraint to ensure age is non-negative
    profession VARCHAR(100),
    isActive BOOLEAN DEFAULT TRUE, -- Adding DEFAULT constraint to set default value for isActive
    dob DATE CHECK (dob <= CURRENT_DATE), -- Adding CHECK constraint to ensure dob is not in the future
    rating NUMERIC(3,2) CHECK (rating >= 0 AND rating <= 9.99) -- Adding CHECK constraint to limit the range of numer
);

-- alter nate to above (primary key added differently)
CREATE TABLE persons (
    id SERIAL ,
    name VARCHAR(100) NOT NULL, -- Adding NOT NULL constraint to ensure name is always provided
    age INTEGER CHECK (age >= 0), -- Adding CHECK constraint to ensure age is non-negative
    profession VARCHAR(100),
    isActive BOOLEAN DEFAULT TRUE, -- Adding DEFAULT constraint to set default value for isActive
    dob DATE CHECK (dob <= CURRENT_DATE), -- Adding CHECK constraint to ensure dob is not in the future
    rating NUMERIC(3,2) CHECK (rating >= 0 AND rating <= 9.99) -- Adding CHECK constraint to limit the range of numer
    PRIMARY KEY(id),
);


----- inserting data into table (3 ways)


INSERT INTO persons 
(id, name, age, profession, isActive, dob, rating) 
VALUES
(2, 'testName2', 26, 'instructor', true, '2023-02-01',  1.78);

INSERT INTO persons VALUES(5,'testName5', 35, 'teacher', true, '2024-02-01',  1.78);
INSERT INTO persons VALUES
(3, 'testName', 29, 'teacher', true, '2024-02-01',  1.78),
(4, 'testName', 28, 'teacher', false, '2024-02-01',  5.78);


-- altering table with ALTER 
/*
alter Table table_name
action

1. renaming a table NAME
2. add/drop column
3. modifying the data type of a column
4. setting default value for a column
5. renaming a column name
6. add/drop constraint
.. other things

*/

-- 1. renaming a table NAME
alter Table persons
    RENAME to person;

-- 5. renaming a column name
ALTER TABLE person
    RENAME COLUMN dob to date_of_birth;

-- 2. add/drop column
ALTER Table person
    ADD COLUMN email VARCHAR(25) not NULL DEFAULT 'n/a';

-- 3. modifying the data type of a column
alter Table person
    alter COLUMN name type VARCHAR(80)


-- 6. add/drop constraint
alter Table person
    alter COLUMN profession set not null;
alter Table person
    alter COLUMN profession drop not null;

-- different syntax for check, PRIMARY key and foreign KEY 

alter Table person
    alter COLUMN dob set UNIQUE; -- will throw error

-- right way
alter Table person
   ADD constraint unique_person_dob UNIQUE(date_of_birth);


alter Table person
   DROP constraint unique_person_dob 

-- table drop vs TRUNCATE

drop Table persons;

CREATE TABLE persons (
    id SERIAL,
    name VARCHAR(100) NOT NULL, 
    age INTEGER CHECK (age >= 0), 
    profession VARCHAR(100),
    salary int not null,
    isActive BOOLEAN DEFAULT TRUE, 
    dob DATE CHECK (dob <= CURRENT_DATE), 
    PRIMARY KEY(id)
);



INSERT INTO persons (name, age, profession, salary, isActive, dob) 
VALUES 
('Alice', 28, 'Software Engineer', 80000, true, '1994-03-15'),
('Bob', 35, 'Instructor', 60000, true, '1989-10-20'),
('Charlie', 42, 'Artist', 45000, true, '1982-05-10'),
('David', 30, 'Pilot', 90000, true, '1992-09-05'),
('Emma', 25, 'Software Engineer', 85000, true, '1997-07-22'),
('Frank', 40, 'Pilot', 95000, false, NULL),
('Grace', 38, 'Artist', 50000, true, '1983-04-28'),
('Hannah', 27, 'Instructor', 70000, true, '1995-08-09'),
('Ian', 33, 'Software Engineer', 82000, true, '1989-02-18'),
('Julia', 29, 'Instructor', 65000, true, NULL),
('Kevin', 45, 'Artist', 48000, false, '1979-06-25'),
('Lily', 36, 'Pilot', 92000, true, '1988-03-07'),
('Megan', 31, 'Software Engineer', 87000, true, '1990-01-14'),
('Nathan', 26, 'Artist', 47000, true, '1996-09-03'),
('Olivia', 39, 'Instructor', 72000, true, '1982-10-31'),
('Peter', 34, 'Pilot', 91000, false, '1987-07-17'),
('Quinn', 32, 'Software Engineer', 83000, true, '1989-12-29'),
('Rachel', 37, 'Instructor', 69000, true, '1985-05-08'),
('Simon', 41, 'Artist', 52000, true, '1980-08-19'),
('Tina', 24, 'Pilot', 88000, true, '2000-02-01');


-- SELECT, WHERE , ORDER BY, COLUMN aliasing
-- logical and comparison operators => =, >, <, <>
-- GROUP BY, HAVING
-- IN, BETWEEN, LIKE, ILIKE

--Select persons aged between 30 and 40 
SELECT *
FROM persons
WHERE age BETWEEN 30 AND 40;



/*
Find persons whose name starts with 'A':

SELECT * FROM persons WHERE name LIKE 'A%';

Find persons whose name ends with 'n':


SELECT * FROM persons WHERE name LIKE '%n';

Find persons whose name contains 'an':


SELECT * FROM persons WHERE name LIKE '%an%';/*

*/

-- aggregate function(max, sum, avg) , scalar functions (upper, concat(x, y))

-- NULL always produce null (where dob is NULL, WHERE dob is not NULL)
-- COALESCE(null, 5)

-- pagination , LIMIT, OFFSET
SELECT * from persons LIMIT 3 OFFSET 3*0;



-- //@ foreign key CONSTRAINT and JOIN

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
);
    FOREIGN KEY (user_id) REFERENCES users(user_id)


INSERT INTO users (user_id, username, email) VALUES
(1, 'John', 'john@example.com'),
(2, 'Alice', 'alice@example.com'),
(3, 'Bob', 'bob@example.com');

INSERT INTO orders (order_id, user_id, order_date, total_amount) VALUES
(1, 1, '2024-02-01', 100.50),
(2, 2, '2024-02-15', 75.25),
(3, 1, '2024-02-20', 200.00),
(4, 3, '2024-02-25', 50.75),
(5, 2, '2024-02-28', 120.00);


-- Select orders along with the associated user information:
SELECT o.order_id, o.order_date, o.total_amount, u.username
FROM orders o
INNER JOIN users u ON o.user_id = u.user_id;

-- additional data to practice left right and full JOIN
-- Additional users
INSERT INTO users (user_id, username, email) VALUES
(4, 'Emma', 'emma@example.com'),
(5, 'Michael', 'michael@example.com');

-- Additional orders
INSERT INTO orders (order_id, user_id, order_date, total_amount) VALUES
(6, 1, '2024-03-05', 45.75),
(7, 3, '2024-03-10', 150.00),
(8, NULL, '2024-03-12', 30.00),
(9, 5, '2024-03-20', 80.50),
(10, NULL, '2024-03-25', 25.25);



/*

Select all users:
SELECT * FROM users

Select all orders:
SELECT * FROM orders

Select orders along with the associated user information:

SELECT o.order_id, o.order_date, o.total_amount, u.username
FROM orders o
LEFT JOIN users u ON o.user_id = u.user_id

Select the total number of orders placed by each user:
SELECT u.username, COUNT(o.order_id) AS num_orders
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
GROUP BY u.username

Select users who haven't placed any orders:
SELECT u.*
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
WHERE o.order_id IS NULL

Select orders placed in March 2024:
SELECT * FROM orders
WHERE order_date BETWEEN '2024-03-01' AND '2024-03-31'



*/

SELECT *
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
WHERE o.order_id IS NULL

SELECT *
FROM users u
RIGHT JOIN orders o ON u.user_id = o.user_id


SELECT *
FROM users u
FULL JOIN orders o ON u.user_id = o.user_id


-- different syntax
SELECT *
FROM users u
FULL JOIN orders USING(user_id)



-- update data in table
UPDATE users
    set username = 'Zaviyar'
    WHERE username = 'Alice';



-- //@ final queries

-- Select persons who are software engineers and earning more than $80,000:
SELECT *
FROM persons
WHERE profession = 'Software Engineer' AND salary > 80000;

-- Select persons who have a name starting with 'J' and whose date of birth is known:
SELECT *
FROM persons
WHERE name LIKE 'J%' AND dob IS NOT NULL;


-- Count the number of persons in each profession and display only those professions where the count is greater than 3:
SELECT profession, COUNT(*) AS count_persons
FROM persons
GROUP BY profession
HAVING COUNT(*) > 3;

-- Calculate the average salary for each profession and display only those professions where the average salary is greater than $70,000:
SELECT profession, AVG(salary) AS avg_salary
FROM persons
GROUP BY profession
HAVING AVG(salary) > 70000;

-- Select persons whose salary is higher than the average salary of software engineers:
SELECT *
FROM persons
WHERE salary > (SELECT AVG(salary) FROM persons WHERE profession = 'Software Engineer');
