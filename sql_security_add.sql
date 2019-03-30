`ref_sd_nature`

INSERT INTO `edoc_cbl_v2`.`ref_sd_nature` (`code`, `name`, `e_by`, `e_dt`, `eligibility`) 
VALUES ('Financial Instrument', 'FDR', '1', '2018-09-20 16:52:59', '1'); 


INSERT INTO sys_prod_security_title(prod_sec_id,docs_head_id,docs_title_id)
SELECT 
s.id prod_sec_id,
t.docs_head_id docs_head_id, 
t.id docs_title_id
FROM
(SELECT * FROM ref_sd_nature WHERE id =66) s
LEFT OUTER JOIN par_docs_title t ON(t.sts=1 AND 1=1)