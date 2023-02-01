SELECT 
ad.pid,
ad.x_pert_done,
ad.x_pert_report_value,
xr.id,
xr.patient_referral_id,
xr.test_referred_for,
xr.test_result,
xr.data_source
FROM
adult_screening ad
INNER JOIN
(
	SELECT
	xray.*
	FROM
	tbl_xray_information xray
	WHERE (xray.data_source = 'acf_community' OR xray.data_source = 'acf_tpt')
	    AND (xray.test_referred_for = 'Xpert' OR xray.test_referred_for = 'Microscopy') 
	    AND xray.test_result = ''
) xr ON ad.pid = xr.patient_referral_id;

ALTER DATABASE tpt_icddrb CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE tbl_xray_information CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;

UPDATE
tbl_xray_information xray,
adult_screening ad 
SET
xray.test_result = IF(xray.test_referred_for = 'Microscopy', ad.afb_microscopy_report_value, ad.x_pert_report_value),
xray.flag = 1
WHERE ad.pid = xray.patient_referral_id AND (ad.x_pert_done = 1 OR ad.afb_microscopy_done = 1) AND xray.data_source = 'acf_community'
    AND (xray.test_referred_for = 'Xpert' OR xray.test_referred_for = 'Microscopy') 
    AND xray.test_result = '';
    
UPDATE 
  tbl_xray_information xray,
  tbl_contact_data c 
SET
  xray.test_result = IF(xray.test_referred_for = 'Microscopy',
    IF(c.microscopy_done = 1,'Positive',
      IF(c.microscopy_done = 2,'Negative', '')
    ),
    IF(c.gxp_test_done = 2, 'Rif Resistance NOT DETECTED',
      IF(c.gxp_test_done = 1 AND c.rif_resistance = 1, 'Rif Resistance DETECTED',
        IF(c.gxp_test_done = 1 AND c.rif_resistance = 2, 'MTB NOT DETECTED', '')
      )
    )
  ),
  xray.flag = 1 
WHERE c.pid = xray.patient_referral_id 
  AND (c.gxp_test_done = 1 OR c.microscopy_done = 1) 
  AND xray.data_source = 'acf_tpt' 
  AND (xray.test_referred_for = 'Xpert' OR xray.test_referred_for = 'Microscopy') 
  AND xray.test_result = '';