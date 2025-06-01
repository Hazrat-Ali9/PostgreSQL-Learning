SELECT * from employees;
SELECT count(*) from employees;


CREATE or replace Function emp_count()
RETURNS void
LANGUAGE SQL
as
$$
    DELETE FROM employees WHERE employee_id = 30;
$$;



CREATE or replace Function delete_emp()
RETURNS void
LANGUAGE SQL
as
$$
    DELETE FROM employees WHERE employee_id = 30;
$$;

SELECT delete_emp();


CREATE or replace Function delete_emp_by_id(p_emp_id int)
RETURNS void
LANGUAGE SQL
as
$$
    DELETE FROM employees WHERE employee_id = p_emp_id;
$$;

SELECT delete_emp_by_id(29)

CREATE Procedure remove_emp_var()
LANGUAGE plpgsql
AS
$$
    DECLARE
    test_var int;
    BEGIN
        SELECT employee_id INTO test_var from employees WHERE employee_id = 26;
        DELETE FROM employees WHERE employee_id = test_var;
    END
$$;

call remove_emp_var();

CREATE Procedure remove_emp_by_id(p_emp_id int)
LANGUAGE plpgsql
AS
$$
    DECLARE
    test_var int;
    BEGIN
        SELECT employee_id INTO test_var from employees WHERE employee_id = p_emp_id;
        DELETE FROM employees WHERE employee_id = test_var;

        RAISE NOTICE 'Employee removed successfully!';
    END
$$;


CALL remove_emp_by_id(25)








