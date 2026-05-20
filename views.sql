CREATE VIEW yearly_loan_summary AS
SELECT 
    YEAR(issue_d) AS year,
    SUM(loan_amnt) AS total_loan_amount,
    AVG(loan_amnt) AS avg_loan_amount
FROM raw_data_banking
GROUP BY YEAR(issue_d);
