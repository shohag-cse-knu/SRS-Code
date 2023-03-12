ALTER TABLE `heed_tpt`.`heed_treatments` 
ADD COLUMN `division` INT NOT NULL AFTER `contact_uid`, 
ADD COLUMN `district` INT NOT NULL AFTER `division`, 
ADD COLUMN `thana` INT NOT NULL AFTER `district`, 
ADD COLUMN `union` INT NOT NULL AFTER `thana`; 


UPDATE
heed_contacts c, heed_index_patients P 
SET
c.division = p.division,
c.district = p.district,
c.thana = p.thana,
c.union = p.union
WHERE p.uuid = c.parent_uuid

UPDATE
heed_contact_followups f, heed_contacts c
SET
f.division = c.division,
f.district = c.district,
f.thana = c.thana,
f.union = c.union
WHERE c.uuid = f.contact_uid

UPDATE
heed_investigations f, heed_contacts c
SET
f.division = c.division,
f.district = c.district,
f.thana = c.thana,
f.union = c.union
WHERE c.uuid = f.contact_uid

UPDATE
heed_tpt_followups f, heed_contacts c
SET
f.division = c.division,
f.district = c.district,
f.thana = c.thana,
f.union = c.union
WHERE c.uuid = f.contact_uid

UPDATE
heed_treatments f, heed_contacts c
SET
f.division = c.division,
f.district = c.district,
f.thana = c.thana,
f.union = c.union
WHERE c.uuid = f.contact_uid



DELETE c
FROM
heed_contacts c
LEFT JOIN heed_index_patients p ON c.parent_uuid = p.uuid
WHERE p.id IS NULL

DELETE f
FROM
heed_contact_followups f
LEFT JOIN heed_contacts c ON c.uuid = f.contact_uid
WHERE c.id IS NULL

DELETE f
FROM
heed_investigations f
LEFT JOIN heed_contacts c ON c.uuid = f.contact_uid
WHERE c.id IS NULL

DELETE f
FROM
heed_treatments f
LEFT JOIN heed_contacts c ON c.uuid = f.contact_uid
WHERE c.id IS NULL