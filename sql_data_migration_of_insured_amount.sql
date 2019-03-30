cust_id
seg_id
field_2 - Policy NO
field_9 - Insured Amount
ch_insurance_policy

UPDATE
SELECT s1.*,s2.*
FROM
ch_insurance_policy s3,
(
	SELECT c1.cust_full_id, i1.*
	FROM
	app_customer c1
	INNER JOIN ch_insurance_policy i1 ON (c1.sts=1 AND i1.sts=1 AND i1.cust_id=c1.id AND i1.field_9 < 1)
) s1,
(
	SELECT c2.CustomerId cust_full_id, i2.*
	FROM
	customer c2
	INNER JOIN customer_insurance_policy i2 ON (c2.Status!=0 AND i2.Status!=0 AND i2.CustomerId=c2.Id AND i2.PolicyValue > 0)
	GROUP BY i2.CustomerId,i2.SegmentId,i2.PolisyNo
	HAVING COUNT(i2.PolisyNo)=1
) s2
WHERE (s3.id=s1.id AND s1.cust_full_id = s2.cust_full_id AND s1.seg_id = s2.SegmentId AND s1.field_2=s2.PolisyNo)
SET s3.field_9 = s2.PolicyValue
	