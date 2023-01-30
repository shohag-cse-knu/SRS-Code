SET GLOBAL log_bin_trust_function_creators = 1;
/* Function  structure for function  `district_name` */

/*!50003 DROP FUNCTION IF EXISTS `district_name` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`syfur`@`%` FUNCTION `district_name`(div_code INT, dis_code INT) RETURNS varchar(50) CHARSET latin1
BEGIN
	DECLARE `name` VARCHAR(50);
	SELECT district INTO `name` FROM tbl_geocode WHERE division_code = div_code AND district_code = dis_code LIMIT 1;
	RETURN `name`;
END */$$
DELIMITER ;

/* Function  structure for function  `division_name` */

/*!50003 DROP FUNCTION IF EXISTS `division_name` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`syfur`@`%` FUNCTION `division_name`(div_code INT) RETURNS varchar(50) CHARSET latin1
BEGIN
	DECLARE `name` VARCHAR(50);
	SELECT division INTO `name` FROM tbl_geocode WHERE division_code = div_code LIMIT 1;
	RETURN `name`;
END */$$
DELIMITER ;

/* Function  structure for function  `thana_name` */

/*!50003 DROP FUNCTION IF EXISTS `thana_name` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`syfur`@`%` FUNCTION `thana_name`(div_code INT, dis_code INT, upz_code INT) RETURNS varchar(50) CHARSET latin1
BEGIN
	DECLARE `name` VARCHAR(50);
	SELECT upazilla INTO `name` FROM tbl_geocode WHERE division_code = div_code AND district_code = dis_code AND upazilla_code = upz_code LIMIT 1;
	RETURN `name`;
END */$$
DELIMITER ;

/* Function  structure for function  `union_name` */

/*!50003 DROP FUNCTION IF EXISTS `union_name` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`syfur`@`%` FUNCTION `union_name`(div_code INT, dis_code INT, upz_code INT, unn_code INT) RETURNS varchar(50) CHARSET latin1
BEGIN
	DECLARE `name` VARCHAR(50);
	SELECT `union` INTO `name` FROM tbl_geocode WHERE division_code = div_code AND district_code = dis_code AND upazilla_code = upz_code LIMIT 1;
	RETURN `name`;
END */$$
DELIMITER ;

