SELECT * from  employees;


EXPLAIN ANALYSE
SELECT * from employees WHERE emp_no = '10004';

CREATE INDEX idx_employees_last_name
on employees (last_name);

SHOW data_directory;