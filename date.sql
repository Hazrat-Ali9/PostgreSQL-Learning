-- ===============================
-- SHOW CURRENT TIME & DATE
-- ===============================
SELECT now() AS current_timestamp;
SELECT CURRENT_DATE AS today_date;
SELECT now()::date AS current_date_only;
SELECT now()::time AS current_time_only;

-- ===============================
-- CREATE TABLE WITH TIMESTAMP TYPES
-- ===============================
DROP TABLE IF EXISTS timeZ;

CREATE TABLE timeZ (
    ts TIMESTAMP WITHOUT TIME ZONE,
    tsz TIMESTAMP WITH TIME ZONE
);

-- ===============================
-- INSERT SAMPLE DATA
-- ===============================
INSERT INTO timeZ (ts, tsz) VALUES 
('2024-01-12 10:45:00', '2024-01-12 10:45:00+00');

-- ===============================
-- SELECT FROM TIME TABLE
-- ===============================
SELECT * FROM timeZ;

-- ===============================
-- DATE AND TIME FUNCTIONS
-- ===============================
-- Day of year
SELECT to_char(now(), 'DDD') AS day_of_year;

-- Subtracting interval from current date
SELECT CURRENT_DATE - INTERVAL '1 year 2 months' AS past_date;

-- Age calculation
SELECT age(CURRENT_DATE, '1995-07-29') AS age_years;

-- Age for students table (example)
SELECT *, age(CURRENT_DATE, dob) AS age_of_student FROM students;

-- Extract month from date
SELECT EXTRACT(MONTH FROM '2024-01-25'::DATE) AS month_number;

-- Boolean casting
SELECT 'n'::BOOLEAN AS boolean_value;  -- 'n' will be false
