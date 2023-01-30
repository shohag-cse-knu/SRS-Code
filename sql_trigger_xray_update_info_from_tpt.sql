DELIMITER $$

USE `xray`$$

DROP TRIGGER /*!50032 IF EXISTS */ `update_info_from_tpt`$$

CREATE
    /*!50017 DEFINER = 'syfur'@'%' */
    TRIGGER `update_info_from_tpt` AFTER INSERT ON `tbl_xray_information` 
    FOR EACH ROW BEGIN
	UPDATE tbl_xray_information xray, tbl_tpt tpt 
	SET 
	xray.patient_name = tpt.name,
	xray.age = tpt.age,
	xray.sex = tpt.gender
	WHERE xray.patientID = tpt.pid AND xray.patientId LIKE 'TPT%' AND xray.patient_name IS NULL AND xray.id = NEW.id;
    END;
$$

DELIMITER ;