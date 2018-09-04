SELECT a.* FROM (SELECT * FROM title_level_access WHERE sts=1) a
INNER JOIN 
(SELECT customer_id,app_ref_no,sts,MAX(id) AS maxid FROM title_level_access GROUP BY customer_id) AS b ON (a.id = b.maxid AND b.sts=1)