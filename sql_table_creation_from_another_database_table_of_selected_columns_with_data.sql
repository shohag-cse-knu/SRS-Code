CREATE TABLE test.cust(	
	SELECT 
	  c.id,
	  c.cust_full_id,
	  c.customer_name
	FROM
	  edoc_cbl_v2.app_customer c
)