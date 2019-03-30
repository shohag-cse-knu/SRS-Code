//142
UPDATE 
-- SELECT DATE_FORMAT(e_dt,'%Y-%m-%d') ddd,DATE_FORMAT(u_dt,'%Y-%m-%d') ds FROM
ch_ground_rent_paid_receipt 
SET sts=0 
WHERE sts=1
AND (
     (e_dt IS NULL OR DATE_FORMAT(e_dt,'%Y-%m-%d') = '0000-00-00' OR DATE_FORMAT(e_dt,'%Y-%m-%d') <= '2017-12-31')
     AND (u_dt IS NULL OR DATE_FORMAT(u_dt,'%Y-%m-%d') = '0000-00-00' OR DATE_FORMAT(u_dt,'%Y-%m-%d') <= '2017-12-31')
)

UPDATE 
-- SELECT s2.*,s1.* FROM
docs_seg_2 s1,
(
	SELECT d.id,d.app_ref_no,g.id ins_id FROM
	(SELECT * FROM docs_seg_2 WHERE sts=1 AND has_child_sts=1 AND docs_title_id=90 ) d
	LEFT OUTER JOIN ch_insurance_policy g ON (d.cust_id = g.cust_id AND d.app_ref_no=g.app_ref_no AND g.sts=1)
	GROUP BY d.id
) s2
SET s1.sts = 0
WHERE s1.id = s2.id AND s1.docs_title_id = 90 AND s1.sts=1 AND s2.ins_id IS NULL

UPDATE 
-- SELECT s2.*,s1.* FROM
docs_files_seg_2 s1,
(
	SELECT d.id,d.app_ref_no,g.id ins_id FROM
	(SELECT * FROM docs_files_seg_2 WHERE sts=1 AND docs_title_id=90 ) d
	LEFT OUTER JOIN ch_insurance_policy g ON (d.cust_id = g.cust_id AND d.app_ref_no=g.app_ref_no AND g.sts=1)
	GROUP BY d.id
) s2
SET s1.sts = 0
WHERE s1.id = s2.id AND s1.docs_title_id = 90 AND s1.sts=1 AND s2.ins_id IS NULL