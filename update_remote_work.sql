UPDATE employees_cleaned
SET remote_work = CASE
    WHEN remote_work IN ('Y', 'Yes') THEN 'Yes'
    WHEN remote_work IN ('N', 'No') THEN 'No'
    ELSE NULL
END;