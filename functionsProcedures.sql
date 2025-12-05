-- ===============================
-- View employees
-- ===============================
SELECT * FROM employees;
SELECT COUNT(*) FROM employees;

-- ===============================
-- Function: Delete a specific employee by ID (SQL language)
-- ===============================
CREATE OR REPLACE FUNCTION delete_employee_by_id(p_emp_id INT)
RETURNS VOID
LANGUAGE SQL
AS $$
    DELETE FROM employees WHERE employee_id = p_emp_id;
$$;

-- Example call
SELECT delete_employee_by_id(30);

-- ===============================
-- Procedure: Delete a specific employee using variable (PLpgSQL)
-- ===============================
CREATE OR REPLACE PROCEDURE remove_employee_by_id(p_emp_id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    emp_to_delete INT;
BEGIN
    -- Store the employee ID to delete into variable
    SELECT employee_id INTO emp_to_delete FROM employees WHERE employee_id = p_emp_id;

    -- Delete employee
    DELETE FROM employees WHERE employee_id = emp_to_delete;

    -- Feedback
    RAISE NOTICE 'Employee % removed successfully!', emp_to_delete;
END
$$;

-- Example call
CALL remove_employee_by_id(25);

-- ===============================
-- Procedure: Delete employee using local variable without parameters
-- ===============================
CREATE OR REPLACE PROCEDURE remove_emp_var()
LANGUAGE plpgsql
AS $$
DECLARE
    emp_to_delete INT;
BEGIN
    SELECT employee_id INTO emp_to_delete FROM employees WHERE employee_id = 26;
    DELETE FROM employees WHERE employee_id = emp_to_delete;
    RAISE NOTICE 'Employee % removed successfully!', emp_to_delete;
END
$$;

-- Example call
CALL remove_emp_var();
