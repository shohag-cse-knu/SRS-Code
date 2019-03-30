SELECT 
s.cust_full_id,
s.customer_name,
IF(s.loan_approval_ref_no!='',s.loan_approval_ref_no,'') loan_approval_ref_no,
IF(s.segment_name!='',s.segment_name,'') segment_name,
IF(b.name!='',b.name,'') branch_name,
IF(s.loan_approval_dt!='',s.loan_approval_dt,'') loan_approval_dt,
IF(s.next_review_dt!='',s.next_review_dt,'') next_review_dt,
IF(s.total_bdt_amount!='',s.total_bdt_amount,'') total_bdt_amount,
IF(s.total_usd_amount!='',s.total_usd_amount,'') total_usd_amount,
s.credit_part_available,
s.credit_status,
s.doc_part_available,
s.doc_status,
IF(u.name!='',u.name,'') dm_name
FROM
(	SELECT
	s1.*,
	IF(t.id!='','Yes','No') doc_part_available,
	IF(t.id!='',IF(t.close_sts=1,'Close','Live'),'NA') doc_status
	FROM
	(
		SELECT 
		cust.cust_full_id,
		cust.customer_name,
		cust.branch_id,
		app.cust_id,
		app.loan_approval_ref_no,
		app.segment_name,
		app.total_bdt_amount,
		app.total_usd_amount,
		IF(app.loan_approval_dt='0000-00-00','',DATE_FORMAT(app.loan_approval_dt,'%d/%m/%Y')) loan_approval_dt,
		IF(app.next_review_dt='0000-00-00','',DATE_FORMAT(app.next_review_dt,'%d/%m/%Y')) next_review_dt,
		SUBSTRING_INDEX(GROUP_CONCAT(flh.dm_id ORDER BY flh.id),',',-1) dm_id,
		IF(app.id!='','Yes','No') credit_part_available,
		'' credit_status
		FROM 
		(SELECT * FROM app_customer  WHERE sts=1) cust
		LEFT OUTER JOIN app_loan_approval app ON(app.cust_id = cust.id AND app.sts=1)
		LEFT OUTER JOIN app_loan_facility_line_history flh ON(flh.approval_id = app.id AND flh.sts=1)
		GROUP BY app.id
	) s1
	LEFT OUTER JOIN title_level_access t ON(t.sts=1 AND t.customer_id = s1.cust_id AND t.app_ref_no=s1.loan_approval_ref_no)
) s
LEFT OUTER JOIN ref_branch b ON(b.id = s.branch_id)
LEFT OUTER JOIN usr_users u ON (u.id = s.dm_id)
ORDER BY b.name,s.customer_name;


SELECT 
s.cust_full_id,
s.cust_name,
IF(seg.Name!='',seg.Name,'') segment_name,
IF(b.Name!='',b.Name,'') branch_name,
s.SanctionReference,
s.SanctionDate,
s.ExpiryDate,
s.total_limit_amount,
s.credit_part_available,
s.credit_status,
s.doc_part_available,
s.doc_status,
IF(u.Name!='',u.Name,'') DocumentManager
FROM
(
	SELECT 
	s1.*,
	IF(d.Id!='','Yes','No') doc_part_available,
	IF(d.Id!='',IF(d.Status!=1,'Close','Live'),'NA') doc_status
	FROM
	(
		SELECT 
		cust.CustomerId cust_full_id,
		cust.Id CustomerId,
		cust.Name cust_name,
		cust.DocumentManager,
		cust.BranchUnitId,
		IF(cr.Id!='',GROUP_CONCAT(DISTINCT cr.SanctionReference),'') SanctionReference,
		IF(cr.Id!='',cr.SegmentId,'') SegmentId,
		IF(cr.Id!='',SUM(CASE WHEN cr.InerLimit=0 THEN cr.Limit_amount*100000 ELSE 0 END),'') total_limit_amount,
		IF(cr.SanctionDate!='',IF(cr.SanctionDate='0000-00-00','',DATE_FORMAT(cr.SanctionDate,'%d/%m/%Y')),'') SanctionDate,
		IF(cr.ExpiryDate!='',IF(cr.ExpiryDate='0000-00-00','',DATE_FORMAT(cr.ExpiryDate,'%d/%m/%Y')),'') ExpiryDate,
		IF(cr.Id!='','Yes','No') credit_part_available,
		IF(cr.Id!='',IF(cr.Status!=1,'Close','Live'),'NA') credit_status
		FROM 
		(SELECT * FROM customer WHERE STATUS!=0) cust
		LEFT OUTER JOIN customer_credit_facility cr ON(cust.Id = cr.CustomerId AND cr.Status!=0)
		GROUP BY cr.CustomerId,cr.SegmentId
	) s1
	LEFT OUTER JOIN cad_comment d ON(d.CustomerId = s1.CustomerId AND d.SegmentId = s1.SegmentId AND d.Status != 0)
	GROUP BY s1.CustomerId,s1.SegmentId
) s
LEFT OUTER JOIN branch_unit b ON(b.Id = s.BranchUnitId)
LEFT OUTER JOIN users u ON (u.Id = s.DocumentManager)
LEFT OUTER JOIN segment seg ON (seg.Id = s.SegmentId)
ORDER BY b.Name,s.cust_name;