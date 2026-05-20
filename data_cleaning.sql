-- Clean the Data
UPDATE raw_data_banking
SET issue_d = TRIM(issue_d);

-- convert month-year into full date
UPDATE raw_data_banking
SET issue_d = CONCAT('01-', issue_d)
WHERE issue_d REGEXP '^[A-Za-z]{3}-[0-9]{2}$';

-- Convert ALL Dates
UPDATE raw_data_banking
SET issue_d = STR_TO_DATE(issue_d, '%d-%b-%Y')
WHERE issue_d LIKE '%-%-%';

-- Change Column Type
ALTER TABLE raw_data_banking MODIFY issue_d DATE;

-- SAME FOR last_pymnt_d
UPDATE raw_data_banking
SET last_pymnt_d = TRIM(last_pymnt_d);

UPDATE raw_data_banking
SET last_pymnt_d = CONCAT('01-', last_pymnt_d)
WHERE last_pymnt_d REGEXP '^[A-Za-z]{3}-[0-9]{2}$';

ALTER TABLE raw_data_banking ADD last_pymnt_clean DATE;

UPDATE raw_data_banking
SET last_pymnt_clean = 
CASE 
    WHEN last_pymnt_d LIKE '__-__-____' 
        THEN STR_TO_DATE(last_pymnt_d, '%d-%m-%Y')
    WHEN last_pymnt_d LIKE '__-___-____' 
        THEN STR_TO_DATE(last_pymnt_d, '%d-%b-%Y')
END;


-- 
ALTER TABLE raw_data_banking DROP COLUMN last_pymnt_d;
ALTER TABLE raw_data_banking CHANGE last_pymnt_clean last_pymnt_d DATE;



UPDATE raw_data_banking
SET issue_d_clean = 
CASE 
    WHEN issue_d LIKE '__-__-____' 
        THEN STR_TO_DATE(issue_d, '%d-%m-%Y')
    WHEN issue_d LIKE '__-___-____' 
        THEN STR_TO_DATE(issue_d, '%d-%b-%Y')
END;
