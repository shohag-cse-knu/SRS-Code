1. Data migration from value of insurance to insurance policy

UPDATE ch_insurance_policy a,
(
	SELECT p.id, p.field_9, v.field_3 FROM ch_insurance_policy p 
	LEFT OUTER JOIN ch_value_of_insurance v ON (p.cust_id=v.cust_id AND p.app_ref_no=v.app_ref_no AND p.seg_id=v.seg_id)
	WHERE p.sts=1 AND v.sts=1
	GROUP BY p.id
) b
SET a.field_9 = b.field_3
WHERE a.id=b.id AND a.field_9 <= 0
