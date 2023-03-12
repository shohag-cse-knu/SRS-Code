UPDATE heed_contacts c, heed_index_patients p
SET 
c.division = p.division,
c.district = p.district,
c.thana = p.thana,
c.union = p.union
WHERE c.parent_uuid = p.uuid
AND (c.division != p.division OR c.district != p.district OR c.thana != p.thana OR c.union != p.union)

SELECT 
c.*
FROM
heed_contacts c
LEFT JOIN heed_index_patients p ON c.parent_uuid = p.uuid
WHERE p.id IS NULL