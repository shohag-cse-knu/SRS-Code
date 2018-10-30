DELIMITER $$

USE `test`$$

DROP FUNCTION IF EXISTS `customer_full_id`$$

CREATE DEFINER=`root`@`localhost` 
       FUNCTION `customer_full_id`(PID INT) RETURNS VARCHAR(50) CHARSET latin1
BEGIN
	DECLARE customer_id VARCHAR(50);
	SELECT cust_full_id INTO customer_id FROM test.app_customer WHERE id = PID;
	RETURN customer_id;
END$$

DELIMITER ;

-- RUn this query to retrieve data from function
-- id_of_that_table = 1
-- SELECT customer_full_id(id_of_that_table) customer_id; 
