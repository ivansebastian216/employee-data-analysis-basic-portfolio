SELECT COUNT(*) AS null_departments
FROM employees_cleaned
WHERE department IS NULL;