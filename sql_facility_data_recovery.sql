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

6. Delete Some garbages data from adult_screening
-- facility empty or 1 there
DELETE ad
FROM adult_screening ad
LEFT JOIN facility fl ON ad.`facility_name` = fl.`short_code`
WHERE fl.`id` IS NULL;