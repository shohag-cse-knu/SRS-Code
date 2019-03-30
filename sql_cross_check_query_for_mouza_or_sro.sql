
-- Cross check mouza or sro with csms tables
SELECT 
m1.id,m1.name,m2.name
FROM
ref_sro_office_name_re m1
LEFT OUTER JOIN ref_sro_office_name m2 ON(m1.id = m2.id AND LOWER(m1.name) = LOWER(m2.name))
WHERE m2.name IS NULL