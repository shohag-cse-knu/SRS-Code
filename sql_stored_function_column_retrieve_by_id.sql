DELIMITER $$

USE `test`$$

DROP FUNCTION IF EXISTS `get_quantity`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `get_quantity`(PID INT) RETURNS VARCHAR(50) CHARSET latin1
BEGIN
	DECLARE nam VARCHAR(50);
	SELECT cust_full_id INTO nam FROM test.app_customer WHERE id = PID;
	RETURN nam;
END$$

DELIMITER ;