SELECT
ch.MV,ch.FSV,ch1.FDR, (ch.MV/2 + ch1.FDR) ESV
FROM
(
	SELECT 
	cust_id,
	app_ref_no,
	SUM(CASE WHEN field_6 !='' THEN field_6 ELSE 0 END) MV,
	SUM(CASE WHEN field_7 !='' THEN field_7 ELSE 0 END) FSV
	FROM ch_valuation_survey_report  WHERE sts=1 AND cust_id = '5227' AND app_ref_no = 'CBL/HO/CAD/2019/222' 
	AND (doc_sts = 'Obtain' OR doc_sts = 'Hardcopy')
) ch
LEFT OUTER JOIN (
	SELECT
	cust_id,
	app_ref_no,
	SUM(CASE WHEN field_3 !='0.00' THEN field_3 ELSE 0 END) FDR
	FROM ch_instrument_under_lien  WHERE sts=1 AND field_2 = 1 AND cust_id = '5227' AND app_ref_no = 'CBL/HO/CAD/2019/222' 
	AND (doc_sts = 'Obtain' OR doc_sts = 'Hardcopy')
) ch1 ON ch.cust_id = ch1.cust_id AND ch1.app_ref_no = ch.app_ref_no

