

-- SHOW timezone;
SELECT now();

create table timeZ (ts TIMESTAMP without time zone , tsz TIMESTAMP with time zone );

INSERT into timez VALUES('2024-01-12 10:45:00', '2024-01-12 10:45:00');

SELECT * from timez;


SELECT now();

SELECT CURRENT_DATE;

SELECT now()::date;
SELECT now()::time;

SELECT to_char(now(), 'DDD');

SELECT CURRENT_DATE - INTERVAL '1 year 2 month';

SELECT age(CURRENT_DATE, '1995-07-29');

SELECT *, age(CURRENT_DATE, dob) from students;

SELECT extract(month from  '2024-01-25'::date);

SELECT 'n'::BOOLEAN;