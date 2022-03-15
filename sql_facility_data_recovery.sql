1. Rename facility table as facility_backup and rename facility_worked as facility

2.

CREATE TABLE `facility_references` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `first_code` varchar(50) NOT NULL,
  `rest_shortcodes` varchar(250) NOT NULL,
  `short_codes` varchar(250) NOT NULL,
  `facility_type` varchar(50) DEFAULT NULL,
  `division_code` varchar(50) NOT NULL,
  `district_code` varchar(50) NOT NULL,
  `thana_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3229 DEFAULT CHARSET=utf8;

3. Run Query

INSERT INTO `acf_heed_bd`.`facility_references`(`name`,`first_code`,`rest_shortcodes`,`short_codes`,`facility_type`,`division_code`,`district_code`,`thana_code`)
SELECT
sub.name,
sub.first_code,
REPLACE(short_codes,CONCAT(first_code,','),'') rest_shortcodes,
sub.short_codes,
sub.facility_type,
sub.division_codes,
sub.district_codes,
sub.thana_codes
FROM
(
SELECT
NAME,
SUBSTRING_INDEX(GROUP_CONCAT(short_code ORDER BY id SEPARATOR ','),',',1) first_code,
GROUP_CONCAT(short_code ORDER BY id SEPARATOR ',') short_codes,
GROUP_CONCAT(DISTINCT facility_type ORDER BY id SEPARATOR ',') facility_type,
GROUP_CONCAT(DISTINCT division_code ORDER BY id SEPARATOR ',') division_codes,
GROUP_CONCAT(DISTINCT district_code ORDER BY id SEPARATOR ',') district_codes,
GROUP_CONCAT(DISTINCT thana_code ORDER BY id SEPARATOR ',') thana_codes
FROM
facility -- WHERE NAME LIKE "Z%" OR NAME LIKE "z%" OR NAME LIKE "j%" OR NAME LIKE "j%"
GROUP BY NAME, facility_type, district_code, thana_code
ORDER BY NAME, thana_code ASC
) sub;


4. Delete duplicate from facility

-- SELECT
-- fl.*
DELETE fl
FROM facility fl
INNER JOIN facility_references ref ON FIND_IN_SET(fl.short_code,ref.rest_shortcodes) AND first_code != rest_shortcodes;

5. Check adult screening and then update

SELECT
ref.`first_code`,
ad.*
FROM 
adult_screening ad
INNER JOIN facility_references ref ON FIND_IN_SET(ad.facility_name, ref.rest_shortcodes) AND ad.facility_name != ref.first_code;

UPDATE
adult_screening ad, facility_references ref
SET ad.facility_name = ref.first_code
WHERE FIND_IN_SET(ad.facility_name, ref.rest_shortcodes);

/* New Optimized query for update */

UPDATE adult_screening a,
(
	SELECT
	ref.first_code,
	ad.id
	FROM 
	adult_screening ad
	INNER JOIN facility_references ref ON FIND_IN_SET(ad.facility_name, ref.rest_shortcodes) AND ad.facility_name != ref.first_code
) sub
SET a.facility_name = sub.first_code
WHERE a.id = sub.id

6. Delete Some garbages data from adult_screening
-- facility empty or 1 there
DELETE ad
FROM adult_screening ad
LEFT JOIN facility fl ON ad.`facility_name` = fl.`short_code`
WHERE fl.`id` IS NULL;




----------------------------------

UPDATE facility fl
INNER JOIN (SELECT short_codes FROM facility_references WHERE first_code = '') sh
SET fl.name = ''
WHERE FIND_IN_SET(fl.short_code,sh.short_codes)


243 Deleted facilities query
DELETE f
FROM facility f
INNER JOIN
(
	SELECT 
	fa.* 
	FROM
	(
		SELECT 
		fl.* 
		FROM
		facility fl
		INNER JOIN (SELECT short_codes FROM facility_references WHERE first_code IN(2024,642,2031,1007,733,325,1008,1109,2054,387,781,2069,1158,659,2017,
		2102,206,599,799,218,654,754,1038,772,812,1125,873,746,1121,780,1003,764,1150,337,775,2093,2085,729,771,1166,
		584,808,823,869,318,1056,737,1155,2091,752,1077,819,783,2070,1152,2188,1136,662,2061,748,735,758,1107,230,2148,
		1135,293,2143,1058,1168,841,2173,2200,2160,1106,344,1051,761,760,2133,223,234,645,2060,349,350,831,857,740,1184,756,
		647,763,2100,1025,1130,2094,2105,766,283,1006,1080,2090,720,882,1138,2089,2189,1062,399,220,1111,225,
		2114,1016,653,297,684,789,861,331,305,2164,2206,1068,630,768,2108,1045,747,715,2121,303,757,1073,2051,2196,811,1093,1133)) sh
		ON FIND_IN_SET(fl.short_code,sh.short_codes)
	) fa
	LEFT JOIN adult_screening ad ON ad.facility_name = fa.short_code
	WHERE ad.id IS NULL 
) custom ON custom.id = f.id