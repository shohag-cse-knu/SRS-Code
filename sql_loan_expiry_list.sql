SELECT c.unit_id, u.name, SUM(s1.lon) AS lon
FROM (SELECT * FROM app_customer WHERE sts=1 AND unit_id IN(39,37,38,40,11,1,26,21,31,32,20,10,12,2,27,22,33,13,3,
28,23,34,14,4,29,24,35,15,5,30,25,36,16,6,17,7,18,8,19,9)) c  
INNER JOIN ( SELECT cd.*,COUNT(cd.id) AS lon FROM app_loan_facility_line cd WHERE cd.sts=1 
AND ( DATEDIFF(cd.expiry_dt,CURDATE())<='30' AND cd.expiry_dt!='0000-00-00') 
) s1 ON(s1.cust_id = c.id)
LEFT OUTER JOIN ref_unit u ON u.id=c.unit_id GROUP BY c.unit_id ORDER BY u.name


SELECT c.id custid,c.cust_full_id CFUL,c.customer_name,sg.name facName,app.loan_approval_ref_no,s1.l_ExDt	
FROM 
(SELECT cd.*,DATE_FORMAT(cd.expiry_dt,'%d-%b-%Y') l_ExDt FROM app_loan_facility_line cd WHERE cd.sts=1 
AND ( DATEDIFF(cd.expiry_dt,CURDATE())<='30' AND cd.expiry_dt!='0000-00-00') GROUP BY cd.id) s1
INNER JOIN
(SELECT * FROM app_customer WHERE sts=1 AND unit_id = 38) c  ON(s1.cust_id = c.id)
LEFT JOIN par_prod_seg_nature sg ON (s1.facility_type=sg.id)
LEFT JOIN app_loan_approval app ON (s1.last_approval_id=app.id)
GROUP BY c.id,s1.id

					SELECT SUM(s1.crexp) AS crexp 
					FROM (( SELECT * FROM app_customer WHERE unit_id = 38) c 
					LEFT OUTER JOIN app_cust_reltd_code t1 ON ( c.id = t1.cust_id ) 
					WHERE c.sts = 1 AND unit_id IN(".$this->session->userdata['user']['unit_id'].") 
					AND DATEDIFF(t1.date_cr_rating_expiry, CURDATE()) <= '15' AND t1.date_cr_rating_expiry <> '0000-00-00' 
					GROUP BY c.id) s1 
					GROUP BY s1.id,s1.customer_name
					
$str = "SELECT s1.unit_id, u.name, s1.def
							FROM 
							(
								SELECT c.unit_id, COUNT(defdoc.id) def
								FROM (SELECT * FROM doc_deferral_details WHERE sts=1 AND DATEDIFF(expiry_dt,CURDATE())<= ".$def_ck." AND expiry_dt<>'0000-00-00') defdoc
								INNER JOIN (SELECT * FROM app_customer WHERE unit_id IN(".$this->session->userdata['user']['unit_id'].")) c ON(c.id=defdoc.cust_id)
								GROUP BY c.unit_id
							) s1 
							LEFT OUTER JOIN ref_unit u ON s1.unit_id = u.id
							ORDER BY u.name";
							
							
							
							
							
							
							
							
SELECT s1.custid, s1.CFUL, sg.name AS sName, sg.id segid, s1.customer_name, 
			SUM(s1.tax) AS tax, GROUP_CONCAT(DISTINCT s1.l_ExDt ORDER BY s1.l_ExDt ASC SEPARATOR ',') AS expdt, s1.app_ref_no	
			FROM 
			(
				SELECT c.id custid, cd.seg_id, c.cust_full_id AS CFUL, c.customer_name, 
				COUNT(cd.id) AS tax, cd.app_ref_no,
				GROUP_CONCAT(DISTINCT DATE_FORMAT(cd.field_5,'%d-%b-%Y') ORDER BY cd.field_5 ASC SEPARATOR ',') AS l_ExDt
				FROM ch_municipal_tax_paid_receipt cd 
				INNER JOIN (SELECT * FROM app_customer WHERE unit_id IN(37,38,39)c ON cd.cust_id=c.id 
				WHERE cd.sts=1 AND cd.ch_cf_with=0 AND cd.safe_out_sts < 3
				AND  ( DATEDIFF(cd.field_5,CURDATE())<=30 AND cd.field_5 <>'0000-00-00') 
				GROUP BY cd.cust_id, cd.app_ref_no ORDER BY cd.cust_id
			) s1 
			LEFT JOIN par_product_segment sg ON (s1.seg_id=sg.id) GROUP BY s1.custid, s1.app_ref_no
			
SELECT s1.unit_id, u.name, SUM(s1.tax) AS tax
			FROM 
			(
				SELECT c.unit_id, COUNT(cd.id) AS tax 
				FROM (SELECT * FROM ch_municipal_tax_paid_receipt WHERE sts=1 AND ch_cf_with=0 AND safe_out_sts < 3 
				AND ( DATEDIFF(field_5,CURDATE())<=100 AND field_5!='0000-00-00')) cd  
				INNER JOIN (SELECT * FROM app_customer WHERE unit_id IN (37,38,39)) c ON(c.id = cd.cust_id)
				GROUP BY c.unit_id ORDER BY c.unit_id
			) s1 
			LEFT OUTER JOIN ref_unit u ON(s1.unit_id=u.id)
			GROUP BY s1.unit_id ORDER BY u.name
			
SELECT s1.unit_id, u.name, SUM(s1.rent) AS rent
			FROM 
			(
				SELECT c.unit_id, COUNT(cd.id) AS rent 
				FROM (SELECT * FROM ch_rent_paid_receipt WHERE sts=1 AND ch_cf_with=0 AND safe_out_sts < 3 
				AND ( DATEDIFF(field_5,CURDATE())<=30 AND field_5!='0000-00-00')) cd 
				INNER JOIN (SELECT * FROM app_customer WHERE unit_id IN (37,38,39)) c ON(c.id = cd.cust_id) 
				GROUP BY c.unit_id ORDER BY c.unit_id
			) s1 
			LEFT OUTER JOIN ref_unit u ON(s1.unit_id=u.id)
			GROUP BY s1.unit_id ORDER BY u.name

SELECT s1.custid, s1.CFUL, sg.name AS sName, sg.id segid, s1.customer_name, 
			SUM(s1.rent) AS rent, GROUP_CONCAT(DISTINCT s1.l_ExDt ORDER BY s1.l_ExDt ASC SEPARATOR ',') AS expdt, s1.app_ref_no
			FROM 
			(
				SELECT c.id custid, cd.seg_id, c.cust_full_id AS CFUL, c.customer_name, 
				COUNT(cd.id) AS rent, cd.app_ref_no,
				GROUP_CONCAT(DISTINCT DATE_FORMAT(cd.field_5,'%d-%b-%Y') ORDER BY cd.field_5 ASC SEPARATOR ',') AS l_ExDt
				FROM ch_rent_paid_receipt cd 
				LEFT OUTER JOIN app_customer c ON cd.cust_id=c.id 
				WHERE cd.sts=1 AND cd.ch_cf_with=0 AND cd.safe_out_sts < 3
				AND  ( DATEDIFF(cd.field_5,CURDATE())<='".$rent_ck."' AND cd.field_5 <>'0000-00-00') 
				GROUP BY cd.cust_id, cd.app_ref_no ORDER BY cd.cust_id
			) s1 
			LEFT JOIN par_product_segment sg ON (s1.seg_id=sg.id) GROUP BY s1.custid, s1.app_ref_no			
			
SELECT s1.custid, s1.CFUL, sg.name AS sName, sg.id segid, s1.customer_name, 
			SUM(s1.rent) AS rent, GROUP_CONCAT(s1.l_ExDt ORDER BY s1.l_ExDt ASC SEPARATOR ',') AS expdt, s1.app_ref_no
			FROM 
			(
				SELECT c.id custid, cd.seg_id, c.cust_full_id AS CFUL, c.customer_name, 
				COUNT(cd.id) AS rent, cd.app_ref_no,
				GROUP_CONCAT( DATE_FORMAT(cd.field_5,'%d-%b-%Y') ORDER BY cd.field_5 ASC SEPARATOR ',') AS l_ExDt
				FROM (SELECT * FROM ch_rent_paid_receipt WHERE cust_id IN(4) AND sts=1 AND ch_cf_with=0 AND safe_out_sts < 3
				AND  ( DATEDIFF(field_5,CURDATE())<= 15 AND field_5 <>'0000-00-00')) cd 
				LEFT OUTER JOIN app_customer c ON cd.cust_id=c.id 
				GROUP BY cd.cust_id, cd.app_ref_no ORDER BY cd.cust_id
			) s1 
			LEFT JOIN par_product_segment sg ON (s1.seg_id=sg.id) GROUP BY s1.custid, s1.app_ref_no			
										