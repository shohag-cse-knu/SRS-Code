UPDATE 
ch_mutation_order 
SET sts=0 
WHERE sts=1
AND (
     (e_dt IS NULL OR DATE_FORMAT(e_dt,'%Y-%m-%d') = '0000-00-00' OR DATE_FORMAT(e_dt,'%Y-%m-%d') <= '2017-12-31')
     AND (u_dt IS NULL OR DATE_FORMAT(u_dt,'%Y-%m-%d') = '0000-00-00' OR DATE_FORMAT(u_dt,'%Y-%m-%d') <= '2017-12-31')
);

UPDATE 
-- SELECT s2.*,s1.* FROM
docs_seg_1 s1,
(
	SELECT d.id,d.app_ref_no,g.id ins_id FROM
	(SELECT * FROM docs_seg_1 WHERE sts=1 AND has_child_sts=1 AND docs_title_id=141 ) d
	LEFT OUTER JOIN ch_mutation_order g ON (d.cust_id = g.cust_id AND d.app_ref_no=g.app_ref_no AND g.sts=1)
	GROUP BY d.id
) s2
SET s1.sts = 0
WHERE s1.id = s2.id AND s1.docs_title_id = 141 AND s1.sts=1 AND s2.ins_id IS NULL;

UPDATE 
-- SELECT s2.*,s1.* FROM
docs_seg_2 s1,
(
	SELECT d.id,d.app_ref_no,g.id ins_id FROM
	(SELECT * FROM docs_seg_2 WHERE sts=1 AND has_child_sts=1 AND docs_title_id=141 ) d
	LEFT OUTER JOIN ch_mutation_order g ON (d.cust_id = g.cust_id AND d.app_ref_no=g.app_ref_no AND g.sts=1)
	GROUP BY d.id
) s2
SET s1.sts = 0
WHERE s1.id = s2.id AND s1.docs_title_id = 141 AND s1.sts=1 AND s2.ins_id IS NULL;

UPDATE 
-- SELECT s2.*,s1.* FROM
docs_seg_3 s1,
(
	SELECT d.id,d.app_ref_no,g.id ins_id FROM
	(SELECT * FROM docs_seg_3 WHERE sts=1 AND has_child_sts=1 AND docs_title_id=141 ) d
	LEFT OUTER JOIN ch_mutation_order g ON (d.cust_id = g.cust_id AND d.app_ref_no=g.app_ref_no AND g.sts=1)
	GROUP BY d.id
) s2
SET s1.sts = 0
WHERE s1.id = s2.id AND s1.docs_title_id = 141 AND s1.sts=1 AND s2.ins_id IS NULL;

UPDATE 
-- SELECT s2.*,s1.* FROM
docs_seg_4 s1,
(
	SELECT d.id,d.app_ref_no,g.id ins_id FROM
	(SELECT * FROM docs_seg_4 WHERE sts=1 AND has_child_sts=1 AND docs_title_id=141 ) d
	LEFT OUTER JOIN ch_mutation_order g ON (d.cust_id = g.cust_id AND d.app_ref_no=g.app_ref_no AND g.sts=1)
	GROUP BY d.id
) s2
SET s1.sts = 0
WHERE s1.id = s2.id AND s1.docs_title_id = 141 AND s1.sts=1 AND s2.ins_id IS NULL;

UPDATE 
-- SELECT s2.*,s1.* FROM
docs_seg_5 s1,
(
	SELECT d.id,d.app_ref_no,g.id ins_id FROM
	(SELECT * FROM docs_seg_5 WHERE sts=1 AND has_child_sts=1 AND docs_title_id=141 ) d
	LEFT OUTER JOIN ch_mutation_order g ON (d.cust_id = g.cust_id AND d.app_ref_no=g.app_ref_no AND g.sts=1)
	GROUP BY d.id
) s2
SET s1.sts = 0
WHERE s1.id = s2.id AND s1.docs_title_id = 141 AND s1.sts=1 AND s2.ins_id IS NULL;

UPDATE 
-- SELECT s2.*,s1.* FROM
docs_files_seg_1 s1,
(
	SELECT d.id,d.app_ref_no,g.id ins_id FROM
	(SELECT * FROM docs_files_seg_1 WHERE sts=1 AND docs_title_id=141 ) d
	LEFT OUTER JOIN ch_mutation_order g ON (d.cust_id = g.cust_id AND d.app_ref_no=g.app_ref_no AND g.sts=1)
	GROUP BY d.id
) s2
SET s1.sts = 0
WHERE s1.id = s2.id AND s1.docs_title_id = 141 AND s1.sts=1 AND s2.ins_id IS NULL;

UPDATE 
-- SELECT s2.*,s1.* FROM
docs_files_seg_2 s1,
(
	SELECT d.id,d.app_ref_no,g.id ins_id FROM
	(SELECT * FROM docs_files_seg_2 WHERE sts=1 AND docs_title_id=141 ) d
	LEFT OUTER JOIN ch_mutation_order g ON (d.cust_id = g.cust_id AND d.app_ref_no=g.app_ref_no AND g.sts=1)
	GROUP BY d.id
) s2
SET s1.sts = 0
WHERE s1.id = s2.id AND s1.docs_title_id = 141 AND s1.sts=1 AND s2.ins_id IS NULL;

UPDATE 
-- SELECT s2.*,s1.* FROM
docs_files_seg_3 s1,
(
	SELECT d.id,d.app_ref_no,g.id ins_id FROM
	(SELECT * FROM docs_files_seg_3 WHERE sts=1 AND docs_title_id=141 ) d
	LEFT OUTER JOIN ch_mutation_order g ON (d.cust_id = g.cust_id AND d.app_ref_no=g.app_ref_no AND g.sts=1)
	GROUP BY d.id
) s2
SET s1.sts = 0
WHERE s1.id = s2.id AND s1.docs_title_id = 141 AND s1.sts=1 AND s2.ins_id IS NULL;

UPDATE 
-- SELECT s2.*,s1.* FROM
docs_files_seg_4 s1,
(
	SELECT d.id,d.app_ref_no,g.id ins_id FROM
	(SELECT * FROM docs_files_seg_4 WHERE sts=1 AND docs_title_id=141 ) d
	LEFT OUTER JOIN ch_mutation_order g ON (d.cust_id = g.cust_id AND d.app_ref_no=g.app_ref_no AND g.sts=1)
	GROUP BY d.id
) s2
SET s1.sts = 0
WHERE s1.id = s2.id AND s1.docs_title_id = 141 AND s1.sts=1 AND s2.ins_id IS NULL;

UPDATE 
-- SELECT s2.*,s1.* FROM
docs_files_seg_5 s1,
(
	SELECT d.id,d.app_ref_no,g.id ins_id FROM
	(SELECT * FROM docs_files_seg_5 WHERE sts=1 AND docs_title_id=141 ) d
	LEFT OUTER JOIN ch_mutation_order g ON (d.cust_id = g.cust_id AND d.app_ref_no=g.app_ref_no AND g.sts=1)
	GROUP BY d.id
) s2
SET s1.sts = 0
WHERE s1.id = s2.id AND s1.docs_title_id = 141 AND s1.sts=1 AND s2.ins_id IS NULL;