CREATE TABLE employees_cleaned AS
SELECT
    employee_id,
    name,
    department,
    CAST(age AS UNSIGNED) AS age,
    CAST(salary AS UNSIGNED) AS salary,
    STR_TO_DATE(join_date, '%Y-%m-%d') AS join_date,
    performance_score,
    remote_work
FROM employees_raw;
