UPDATE ch_insurance_policy s1,
(
	SELECT DISTINCT i1.id,i1.cust_id,i1.app_ref_no, i1.field_2, i1.sts
	FROM ch_insurance_policy i1
	JOIN ch_insurance_policy i2 ON (i1.id > i2.id AND i1.field_2 = i2.field_2 AND i1.cust_id =i2.cust_id)
	WHERE i1.field_2!='' AND i1.sts =1 AND i2.sts = 1 
	ORDER BY  i1.cust_id,i1.app_ref_no,i1.id
) s2
SET 
	s1.sts = 0,
	s1.duplicate_sts = 1

WHERE s1.id = s2.id

SELECT * FROM `edoc_cbl_v2`.`ch_insurance_policy` WHERE `cust_id` = '18' 

ALTER TABLE `edoc_cbl_v2`.`ch_insurance_policy` ADD COLUMN `duplicate_sts` TINYINT(1) DEFAULT 0 NOT NULL AFTER `send_reminder_sts`;