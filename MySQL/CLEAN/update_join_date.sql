UPDATE employees_cleaned
SET clean_join_date = CASE
    WHEN join_date IS NULL OR join_date = '' OR join_date = 'Unknown' THEN NULL
    
    WHEN join_date LIKE '%/%' 
        THEN STR_TO_DATE(join_date, '%Y/%m/%d')

    WHEN join_date LIKE '%-%-%' 
         AND join_date REGEXP '^[0-9]{4}-'
        THEN STR_TO_DATE(join_date, '%Y-%m-%d')

    ELSE STR_TO_DATE(join_date, '%d-%m-%Y')
END;
