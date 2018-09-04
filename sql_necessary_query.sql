UPDATE ref_cust_lawer_firm a 
LEFT OUTER JOIN ref_cust_lawer_firm b ON(a.id = b.id)
SET 
a.name = TRIM(b.name),
a.name_of_the_principal = TRIM(b.name_of_the_principal),
a.mobile_no = TRIM(b.mobile_no),
a.phone_no = TRIM(b.phone_no)


UPDATE par_prod_seg_nature SET f_type = 1 WHERE NAME!=''

DELETE FROM sys_prod_seg_title WHERE prod_seg_id = 5

SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'edoc_mmbl' AND 
TABLE_NAME = 'ch_fire_and_cd_certificate' AND COLUMN_NAME = 'ch_pending_dt'

sys_prod_seg_facility
par_prod_seg_nature`

INSERT INTO sys_prod_seg_facility(prod_seg_id,facility_id)
SELECT a.id prod_seg_id,b.id facility_id FROM par_product_segment a
LEFT OUTER JOIN par_prod_seg_nature b ON(1=1)
