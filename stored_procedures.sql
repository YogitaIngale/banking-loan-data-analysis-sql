DELIMITER //

CREATE PROCEDURE GetLoanByState(IN state_name VARCHAR(10))
BEGIN
    SELECT *
    FROM raw_data_banking
    WHERE addr_state = state_name;
END //

DELIMITER ;
