-- View all employees
SELECT * 
FROM employees;

-- Analyze query performance for a specific employee
EXPLAIN ANALYZE
SELECT * 
FROM employees
WHERE emp_no = 10004;  -- Removed quotes if emp_no is numeric

-- Create an index on last_name for faster searches
CREATE INDEX idx_employees_last_name
ON employees (last_name);

-- Check the data directory of the database
SHOW data_directory;
