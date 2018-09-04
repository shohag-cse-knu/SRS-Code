SELECT 
COUNT(CASE WHEN gender='male' THEN 1 END) male,
COUNT(CASE WHEN gender='female' THEN 1 END) female 
FROM emp_info