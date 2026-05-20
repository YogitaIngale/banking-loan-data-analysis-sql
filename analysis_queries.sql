-- 1. Year-wise Loan Amount Stats
SELECT 
    YEAR(issue_d) AS year,
    COUNT(*) AS total_loans,
    SUM(loan_amnt) AS total_loan_amount,
    AVG(loan_amnt) AS avg_loan_amount,
    MIN(loan_amnt) AS min_loan,
    MAX(loan_amnt) AS max_loan
FROM raw_data_banking
GROUP BY YEAR(issue_d)
ORDER BY year;

-- 2. Grade & Sub-grade wise Revolving Balance
SELECT 
    grade,
    sub_grade,
    COUNT(*) AS total_loans,
    SUM(revol_bal) AS total_revol_balance,
    AVG(revol_bal) AS avg_revol_balance
FROM raw_data_banking
GROUP BY grade, sub_grade
ORDER BY grade, sub_grade;

-- 3. Verified vs Non-Verified Total Payment
SELECT 
    verification_status,
    COUNT(*) AS total_loans,
    SUM(total_pymnt) AS total_payment,
    AVG(total_pymnt) AS avg_payment,
    MAX(total_pymnt) AS max_payment
FROM raw_data_banking
GROUP BY verification_status;

-- 4. State-wise & Month-wise Loan Status
SELECT 
    addr_state,
    MONTHNAME(issue_d) AS month,
    loan_status,
    COUNT(*) AS total_loans
FROM raw_data_banking
GROUP BY addr_state, MONTH(issue_d), MONTHNAME(issue_d), loan_status
ORDER BY addr_state, MONTH(issue_d);

-- 5. Home Ownership vs Last Payment Date Stats
SELECT 
    home_ownership,
    COUNT(*) AS total_loans,
    MIN(last_pymnt_d) AS first_payment_date,
    MAX(last_pymnt_d) AS last_payment_date,
    SUM(total_pymnt) AS total_payment,
    AVG(total_pymnt) AS avg_payment
FROM raw_data_banking
GROUP BY home_ownership;
