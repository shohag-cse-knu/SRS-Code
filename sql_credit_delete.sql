UPDATE app_loan_approval SET sts=1 WHERE loan_approval_ref_no='242342';

UPDATE app_loan_approval_covenants SET sts=1 WHERE approval_id='1';
UPDATE app_loan_cm_extention SET sts=1 WHERE app_id='1';
UPDATE app_loan_facility_line SET sts=1 WHERE approval_id='1';
UPDATE app_loan_facility_line_history SET sts=1 WHERE approval_id='1';
UPDATE app_loan_facility_line_history SET sts=1 WHERE approval_id='1';