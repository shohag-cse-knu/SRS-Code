SELECT
cust.customer_name customer_name,
b.name branch_name,
ref_seg.name segment_name,
app.loan_approval_ref_no,
GROUP_CONCAT(DISTINCT(u1.name) SEPARATOR ',') current_rm_name, 
GROUP_CONCAT(DISTINCT(u1.line_manager) SEPARATOR ',') rm_unit,
GROUP_CONCAT(DISTINCT(u1.superior) SEPARATOR ',') rm_division, 
GROUP_CONCAT(DISTINCT(u2.name) SEPARATOR ',') dm_name, 
GROUP_CONCAT(DISTINCT(u2.line_manager) SEPARATOR ',') dm_unit, 
GROUP_CONCAT(DISTINCT(u2.superior) SEPARATOR ',') dm_division, 
GROUP_CONCAT(DISTINCT(u3.name) SEPARATOR ',') risk_name,
GROUP_CONCAT(DISTINCT(u3.line_manager) SEPARATOR ',') risk_unit, 
GROUP_CONCAT(DISTINCT(u3.superior) SEPARATOR ',') risk_division,
IF(app.total_usd_amount=0.00,app.total_bdt_amount,app.total_usd_amount) total_sanction_amount,
IF(cm.cm_ext_exp_dt!='',
	SUBSTRING_INDEX(GROUP_CONCAT(cm.cm_ext_exp_dt ORDER BY cm.id),',',-1),''
) cm_ext_exp_dt
FROM 
(SELECT * FROM app_loan_approval WHERE sts = 1) app
INNER JOIN app_customer cust ON(cust.id=app.cust_id)
LEFT OUTER JOIN app_loan_cm_extention cm ON(app.id = cm.app_id AND cm.sts=1)
LEFT OUTER JOIN app_loan_facility_line_history fh ON(app.cust_id=fh.cust_id AND app.id = fh.approval_id AND fh.sts=1)
LEFT OUTER JOIN par_product_segment ref_seg ON(ref_seg.id = app.segment_id AND ref_seg.sts = 1)
LEFT OUTER JOIN usr_users u1 ON(u1.id=fh.current_rm_id)
LEFT OUTER JOIN usr_users u2 ON(u2.id=fh.dm_id)
LEFT OUTER JOIN usr_users u3 ON(u3.id=fh.risk_id)
LEFT OUTER JOIN ref_branch b ON(b.id=cust.branch_id)
GROUP BY app.id