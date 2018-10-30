CREATE TABLE database_name2.custinfo(	
	SELECT 
	  cust.id,
	  cust.cust_full_id,
	  cust.customer_name
	FROM
	  database_name1.customer cust
	  INNER JOIN database_name1.customer_address details ON(cust.id = details.id)
)
