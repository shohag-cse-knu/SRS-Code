UPDATE tbl_contact_data c, tbl_patient_information p
SET 
c.present_division = p.present_division,
c.present_district = p.present_district,
c.present_thana = p.present_thana,
c.present_union = p.present_union
WHERE c.parent_uuid = p.uuid
AND (c.present_division != p.present_division OR 
c.present_district != p.present_district OR
c.present_thana != p.present_thana OR
c.present_union = p.present_union)