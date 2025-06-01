-- Active: 1699467625194@@127.0.0.1@5432@ph@public

SELECT * from employees;

CREATE View dept_avg_salary
AS
SELECT department_name, avg(salary) FROM employees GROUP BY department_name;

SELECT * from dept_avg_salary;

CREATE View test_view
AS
SELECT employee_name, salary, department_name 
FROM employees 
WHERE department_name in 
(SELECT department_name FROM employees WHERE department_name LIKE '%R%');



SELECT * from test_view;


-- Simplifying complex queries
-- Improved security
-- Enhanced data abstraction
