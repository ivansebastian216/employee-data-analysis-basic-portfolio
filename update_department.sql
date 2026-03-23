UPDATE employees_cleaned
SET department = 'Unknown'
WHERE department IS NULL
AND employee_id IS NOT NULL;