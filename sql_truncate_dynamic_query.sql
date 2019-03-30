SELECT CONCAT('TRUNCATE TABLE ', TABLE_NAME, ';')
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME LIKE 'ch_%' AND TABLE_NAME LIKE 'app_%' AND TABLE_NAME LIKE 'bb_%' 
                AND TABLE_NAME LIKE 'cib_%' AND TABLE_NAME LIKE 'cust_%' AND TABLE_NAME LIKE 'datahistory_%' 
                AND TABLE_NAME LIKE 'doc_%' AND TABLE_NAME LIKE 'docs_%' AND TABLE_NAME LIKE 'par_fi_%'
                 AND TABLE_NAME LIKE 'ssc_%'
                 
TRUNCATE TABLE (SELECT GROUP_CONCAT(DISTINCT TABLE_NAME) FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'edoc_mmbl' AND (TABLE_NAME LIKE 'ch_%' 
		OR TABLE_NAME LIKE 'app_%' OR TABLE_NAME LIKE 'bb_%' 
                OR TABLE_NAME LIKE 'cib_%' OR TABLE_NAME LIKE 'cust_%' OR TABLE_NAME LIKE 'datahistory_%' 
                OR TABLE_NAME LIKE 'doc_%' OR TABLE_NAME LIKE 'docs_%' OR TABLE_NAME LIKE 'par_fi_%'
                OR TABLE_NAME LIKE 'ssc_%'))