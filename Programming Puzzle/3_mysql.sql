SELECT 
u.*,
AVG(r.correct) avg_correct,
DATE_FORMAT(MAX(r.time_taken), '%d/%m/%Y %h:%i%p') time_taken
FROM 
USER u
LEFT OUTER JOIN test_result r ON (u.user_id = r.user_id)
GROUP BY u.user_id