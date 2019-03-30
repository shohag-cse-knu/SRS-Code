
SELECT 
c.cust_full_id,
c.customer_name,
c.branch_name,
l.segment_name,
GROUP_CONCAT(l.loan_approval_ref_no ORDER BY l.id SEPARATOR ',\n') Sanction_Ref_No,
GROUP_CONCAT(l.total_bdt_amount ORDER BY l.id SEPARATOR ',\n') Sanction_Amount_BDT,
GROUP_CONCAT(l.total_usd_amount ORDER BY l.id SEPARATOR ',\n') Sanction_Amount_USD,
l.loan_approval_dt Sanction_Date,
GROUP_CONCAT(IF(t.id IS NOT NULL,'Yes','No') ORDER BY l.id SEPARATOR ',\n') Doc_Available,
GROUP_CONCAT(IF(t.id IS NOT NULL,IF(t.close_sts!=0,'Yes','No'),'NA') ORDER BY l.id SEPARATOR ',\n') Doc_STATUS,
GROUP_CONCAT(u.name ORDER BY l.id SEPARATOR ',\n') Document_Manager
FROM 
(
	SELECT 
	app.*,
	fl.dm_id
	FROM app_loan_approval app
	LEFT OUTER JOIN app_loan_facility_line_history fl ON(app.id = fl.approval_id)
	WHERE app.sts=1 AND fl.sts=1
	GROUP BY app.id
) l 
INNER JOIN app_customer c ON(l.cust_id = c.id AND c.sts=1)
LEFT OUTER JOIN title_level_access t ON(t.app_ref_no = l.loan_approval_ref_no AND t.sts=1)
LEFT OUTER JOIN usr_users u ON(u.id = l.dm_id)
GROUP BY l.cust_id, l.loan_approval_dt
HAVING COUNT(l.loan_approval_dt) > 1;