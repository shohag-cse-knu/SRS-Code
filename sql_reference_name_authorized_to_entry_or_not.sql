SELECT 
ref_name,
IF(id NOT IN(9,137,87,42,64,30,127,28,46,48,85,126,73,69,23,128,
144,145,62,54,19,136,209,38,65,20,84,96,10,66,63,40,39,98,131),'YES','NO') authorizedtoentry,
table_name
FROM 
ref_list WHERE sts=1 AND table_name LIKE "ref_%"
ORDER BY ref_name