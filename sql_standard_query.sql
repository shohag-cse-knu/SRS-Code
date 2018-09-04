SELECT s1.*,
SUM(CASE WHEN s1.facility_nature='Funded' THEN s1.fl_limit ELSE 0 END) funded_limit,
SUM(CASE WHEN s1.facility_nature='Non-funded' THEN s1.fl_limit ELSE 0 END) non_funded_limit,
SUM(s1.fl_limit) total_limit
	FROM
	(SELECT c.customer_name,c.cust_full_id,app.id app_id,cust_rel.crg_score,app.segment_name,app.loan_approvng_authority,
	IF(app.loan_approval_dt='0000-00-00','',DATE_FORMAT(app.loan_approval_dt,'%d/%m/%Y')) loan_approval_dt,
	IF(app.app_receiving_dt='0000-00-00','',DATE_FORMAT(app.app_receiving_dt,'%d/%m/%Y')) app_receiving_dt,
	IF(app.next_review_dt='0000-00-00','',DATE_FORMAT(app.next_review_dt,'%d/%m/%Y')) next_review_dt,app.proposal_type,
	f.*,IF(u1.name!='',u1.name,'') rmname,IF(u2.name!='',u2.name,'') dmname
		FROM app_loan_approval app
		INNER JOIN app_loan_facility_line  f ON(app.id=f.approval_id)
		INNER JOIN (SELECT * FROM app_customer WHERE ".$where2.") c ON(c.id=f.cust_id) 
		LEFT OUTER JOIN app_cust_reltd_code cust_rel ON(c.id = cust_rel.cust_id)
		LEFT OUTER JOIN par_prod_seg_nature fl ON(fl.id=f.facility_type)
		LEFT OUTER JOIN usr_users u1 ON (u1.id = c.current_rm_id)
		LEFT OUTER JOIN usr_users u2 ON (u2.id = c.dm_id)
	) s1 
GROUP BY s1.cust_id,s1.app_id,s1.fl_currency ORDER BY s1.cust_id,s1.app_id