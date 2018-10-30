DELIMITER $$

USE `test`$$

DROP FUNCTION IF EXISTS `GETFULLNAME`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `GETFULLNAME`(fname CHAR(250),lname CHAR(250)) RETURNS CHAR(250) CHARSET latin1
BEGIN
        DECLARE fullname CHAR(250);
        SET fullname=CONCAT(fname,' ',lname);
        RETURN fullname;
    END$$

DELIMITER ;