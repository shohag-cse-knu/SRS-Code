INSERT INTO usr_user_segment(user_id,segment_id)
SELECT 
u.id user_id,s.id segment_id
FROM (SELECT * FROM usr_users WHERE sts=1) u
LEFT OUTER JOIN par_product_segment s ON(FIND_IN_SET(s.id,u.segments_id))