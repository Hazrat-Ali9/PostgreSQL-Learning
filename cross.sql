-- ===============================
-- CREATE TABLES WITH PRIMARY KEYS
-- ===============================
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    dept_id INT NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- ===============================
-- INSERT SAMPLE DATA
-- ===============================
INSERT INTO departments (dept_id, dept_name) VALUES
(101, 'Human Resources'),
(102, 'Marketing');

INSERT INTO employees (emp_id, emp_name, dept_id) VALUES
(1, 'John Doe', 101),
(2, 'Jane Smith', 102);

-- ===============================
-- SIMPLE SELECT QUERIES
-- ===============================
SELECT * FROM employees;
SELECT * FROM departments;

-- ===============================
-- CROSS JOIN (Cartesian Product)
-- ===============================
SELECT e.emp_id, e.emp_name, d.dept_id, d.dept_name
FROM employees e
CROSS JOIN departments d;

-- ===============================
-- INNER JOIN USING dept_id
-- ===============================
SELECT e.emp_id, e.emp_name, d.dept_id, d.dept_name
FROM employees e
INNER JOIN departments d
    ON e.dept_id = d.dept_id;
