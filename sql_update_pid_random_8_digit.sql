UPDATE adult_screening ad
SET 
ad.pid = CONCAT(ad.sender_id,'-',IF(ad.place_of_screening = 'Facility','F','C'),'-',SUBSTRING(CONCAT(FLOOR(0+ RAND() * 100000000), '', '0000'),1,8),'-',FLOOR(0+ RAND() * 10)),
ad.pid_added_flag = 1
WHERE ad.pid = '';