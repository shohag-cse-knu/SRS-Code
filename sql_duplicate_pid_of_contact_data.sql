SELECT
DISTINCT b_y
FROM
(
	SELECT
	GROUP_CONCAT(id) ids,
	GROUP_CONCAT(DATE(inserted_on)) dt,
	GROUP_CONCAT(DISTINCT inserted_by) b_y
	FROM
	(
		SELECT
		c.* 
		FROM
		tbl_contact_data c
		WHERE c.pid != '' 
	) sub
	GROUP BY sub.pid
	HAVING COUNT(sub.pid) > 1
) sub1