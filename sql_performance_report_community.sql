SELECT
sub.present_division, 
sub.present_district, 
sub.present_thana,
division_name(sub.present_division) division,
district_name(sub.present_division, sub.present_district) district,
thana_name(sub.present_division, sub.present_district, sub.present_thana) thana,
SUM(sub.index_case) index_case,
SUM(sub.household_or_close_contacts_identified) household_or_close_contacts_identified,
SUM(sub.m_household_close_contacts_screened_for_tb)  m_household_close_contacts_screened_for_tb,
SUM(sub.f_household_close_contacts_screened_for_tb)  f_household_close_contacts_screened_for_tb,

SUM(sub.m_contacts_tested_for_tpt_eligibility)  m_contacts_tested_for_tpt_eligibility,
SUM(sub.f_contacts_tested_for_tpt_eligibility)  f_contacts_tested_for_tpt_eligibility,

SUM(sub.m_how_much_contacts_tested_xray)  m_how_much_contacts_tested_xray,
SUM(sub.f_how_much_contacts_tested_xray)  f_how_much_contacts_tested_xray,
SUM(sub.m_how_much_contacts_tested_tst)  m_how_much_contacts_tested_tst,
SUM(sub.f_how_much_contacts_tested_tst)  f_how_much_contacts_tested_tst,

SUM(sub.m_0_4_contacts_eligible_for_tpt)  m_0_4_contacts_eligible_for_tpt,
SUM(sub.f_0_4_contacts_eligible_for_tpt)  f_0_4_contacts_eligible_for_tpt,
SUM(sub.m_5_14_contacts_eligible_for_tpt)  m_5_14_contacts_eligible_for_tpt,
SUM(sub.f_5_14_contacts_eligible_for_tpt)  f_5_14_contacts_eligible_for_tpt,
SUM(sub.m_15_greater_contacts_eligible_for_tpt)  m_15_greater_contacts_eligible_for_tpt,
SUM(sub.f_15_greater_contacts_eligible_for_tpt)  f_15_greater_contacts_eligible_for_tpt,

SUM(sub.m_0_4_contacts_initiated_tpt)  m_0_4_contacts_initiated_tpt,
SUM(sub.f_0_4_contacts_initiated_tpt)  f_0_4_contacts_initiated_tpt,
SUM(sub.m_5_14_contacts_initiated_tpt)  m_5_14_contacts_initiated_tpt,
SUM(sub.f_5_14_contacts_initiated_tpt)  f_5_14_contacts_initiated_tpt,
SUM(sub.m_15_greater_contacts_initiated_tpt)  m_15_greater_contacts_initiated_tpt,
SUM(sub.f_15_greater_contacts_initiated_tpt)  f_15_greater_contacts_initiated_tpt,

SUM(sub.m_0_14_contacts_detected_with_tb)  m_0_14_contacts_detected_with_tb,
SUM(sub.f_0_14_contacts_detected_with_tb)  f_0_14_contacts_detected_with_tb,
SUM(sub.m_15_greater_contacts_detected_with_tb)  m_15_greater_contacts_detected_with_tb,
SUM(sub.f_15_greater_contacts_detected_with_tb)  f_15_greater_contacts_detected_with_tb,

SUM(sub.m_0_14_ptb_b_plus)  m_0_14_ptb_b_plus,
SUM(sub.f_0_14_ptb_b_plus)  f_0_14_ptb_b_plus,
SUM(sub.m_15_greater_ptb_b_plus)  m_15_greater_ptb_b_plus,
SUM(sub.f_15_greater_ptb_b_plus)  f_15_greater_ptb_b_plus,

SUM(sub.m_0_14_ptb_cd_case)  m_0_14_ptb_cd_case,
SUM(sub.f_0_14_ptb_cd_case)  f_0_14_ptb_cd_case,
SUM(sub.m_15_greater_ptb_cd_case)  m_15_greater_ptb_cd_case,
SUM(sub.f_15_greater_ptb_cd_case)  f_15_greater_ptb_cd_case,

SUM(sub.m_0_14_eptb)  m_0_14_eptb,
SUM(sub.f_0_14_eptb)  f_0_14_eptb,
SUM(sub.m_15_greater_eptb)  m_15_greater_eptb,
SUM(sub.f_15_greater_eptb)  f_15_greater_eptb
FROM
(
	SELECT 
	p.present_division, p.present_district, p.present_thana,
	COUNT(DISTINCT p.uuid) index_case,
	SUM(p.no_of_family_member) household_or_close_contacts_identified,
	'0' m_household_close_contacts_screened_for_tb,
	'0' f_household_close_contacts_screened_for_tb,

	'0' m_contacts_tested_for_tpt_eligibility,
	'0' f_contacts_tested_for_tpt_eligibility,

	'0' m_how_much_contacts_tested_xray,
	'0' f_how_much_contacts_tested_xray,
	'0' m_how_much_contacts_tested_tst,
	'0' f_how_much_contacts_tested_tst,

	'0' m_0_4_contacts_eligible_for_tpt,
	'0' f_0_4_contacts_eligible_for_tpt,
	'0' m_5_14_contacts_eligible_for_tpt,
	'0' f_5_14_contacts_eligible_for_tpt,
	'0' m_15_greater_contacts_eligible_for_tpt,
	'0' f_15_greater_contacts_eligible_for_tpt,

	'0' m_0_4_contacts_initiated_tpt,
	'0' f_0_4_contacts_initiated_tpt,
	'0' m_5_14_contacts_initiated_tpt,
	'0' f_5_14_contacts_initiated_tpt,
	'0' m_15_greater_contacts_initiated_tpt,
	'0' f_15_greater_contacts_initiated_tpt,

	'0' m_0_14_contacts_detected_with_tb,
	'0' f_0_14_contacts_detected_with_tb,
	'0' m_15_greater_contacts_detected_with_tb,
	'0' f_15_greater_contacts_detected_with_tb,

	'0' m_0_14_ptb_b_plus,
	'0' f_0_14_ptb_b_plus,
	'0' m_15_greater_ptb_b_plus,
	'0' f_15_greater_ptb_b_plus,

	'0' m_0_14_ptb_cd_case,
	'0' f_0_14_ptb_cd_case,
	'0' m_15_greater_ptb_cd_case,
	'0' f_15_greater_ptb_cd_case,

	'0' m_0_14_eptb,
	'0' f_0_14_eptb,
	'0' m_15_greater_eptb,
	'0' f_15_greater_eptb
	FROM
	tbl_patient_information p
	WHERE DATE(p.insertedOn) >= "2023-03-01" AND DATE(p.insertedOn) <= "2023-03-07" -- AND p.present_division = 50 AND p.present_district = 10 AND p.present_thana = 67
	GROUP BY p.present_division, p.present_district, p.present_thana

	UNION

	SELECT
	c.present_division, c.present_district, c.present_thana,
	'0' index_case,
	'0' household_or_close_contacts_identified,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 1 THEN 1 ELSE 0 END) m_household_close_contacts_screened_for_tb,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 2 THEN 1 ELSE 0 END) f_household_close_contacts_screened_for_tb,

	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 1 AND (c.gxp_test_done = 1 OR c.xray_done = 1 OR c.tst_igra_test_done = 1 OR c.microscopy_done = 1) THEN 1 ELSE 0 END) m_contacts_tested_for_tpt_eligibility,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 2 AND (c.gxp_test_done = 1 OR c.xray_done = 1 OR c.tst_igra_test_done = 1 OR c.microscopy_done = 1) THEN 1 ELSE 0 END) f_contacts_tested_for_tpt_eligibility,

	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 1 AND c.xray_done = 1 THEN 1 ELSE 0 END) m_how_much_contacts_tested_xray,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 2 AND c.xray_done = 1 THEN 1 ELSE 0 END) f_how_much_contacts_tested_xray,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 1 AND c.tst_igra_test_done = 1 THEN 1 ELSE 0 END) m_how_much_contacts_tested_tst,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 2 AND c.tst_igra_test_done = 1 THEN 1 ELSE 0 END) f_how_much_contacts_tested_tst,

	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 1 AND c.tb_confirmed = 2 AND c.contact_age >= 0 AND c.contact_age <= 4 THEN 1 ELSE 0 END) m_0_4_contacts_eligible_for_tpt,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 2 AND c.tb_confirmed = 2 AND c.contact_age >= 0 AND c.contact_age <= 4 THEN 1 ELSE 0 END) f_0_4_contacts_eligible_for_tpt,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 1 AND c.tb_confirmed = 2 AND c.contact_age >= 5 AND c.contact_age <= 14 THEN 1 ELSE 0 END) m_5_14_contacts_eligible_for_tpt,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 2 AND c.tb_confirmed = 2 AND c.contact_age >= 5 AND c.contact_age <= 14 THEN 1 ELSE 0 END) f_5_14_contacts_eligible_for_tpt,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 1 AND c.tb_confirmed = 2 AND c.contact_age >= 15 AND c.contact_age <= 200 THEN 1 ELSE 0 END) m_15_greater_contacts_eligible_for_tpt,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 2 AND c.tb_confirmed = 2 AND c.contact_age >= 15 AND c.contact_age <= 200 THEN 1 ELSE 0 END) f_15_greater_contacts_eligible_for_tpt,

	SUM(CASE WHEN DATE(c.tpt_start_date) >= "2023-03-01" AND DATE(c.tpt_start_date) <= "2023-03-07" AND c.contact_gender = 1 AND c.tpt_start = 1 AND c.contact_age >= 0 AND c.contact_age <= 4 THEN 1 ELSE 0 END) m_0_4_contacts_initiated_tpt,
	SUM(CASE WHEN DATE(c.tpt_start_date) >= "2023-03-01" AND DATE(c.tpt_start_date) <= "2023-03-07" AND c.contact_gender = 2 AND c.tpt_start = 1 AND c.contact_age >= 0 AND c.contact_age <= 4 THEN 1 ELSE 0 END) f_0_4_contacts_initiated_tpt,
	SUM(CASE WHEN DATE(c.tpt_start_date) >= "2023-03-01" AND DATE(c.tpt_start_date) <= "2023-03-07" AND c.contact_gender = 1 AND c.tpt_start = 1 AND c.contact_age >= 5 AND c.contact_age <= 14 THEN 1 ELSE 0 END) m_5_14_contacts_initiated_tpt,
	SUM(CASE WHEN DATE(c.tpt_start_date) >= "2023-03-01" AND DATE(c.tpt_start_date) <= "2023-03-07" AND c.contact_gender = 2 AND c.tpt_start = 1 AND c.contact_age >= 5 AND c.contact_age <= 14 THEN 1 ELSE 0 END) f_5_14_contacts_initiated_tpt,
	SUM(CASE WHEN DATE(c.tpt_start_date) >= "2023-03-01" AND DATE(c.tpt_start_date) <= "2023-03-07" AND c.contact_gender = 1 AND c.tpt_start = 1 AND c.contact_age >= 15 AND c.contact_age <= 200 THEN 1 ELSE 0 END) m_15_greater_contacts_initiated_tpt,
	SUM(CASE WHEN DATE(c.tpt_start_date) >= "2023-03-01" AND DATE(c.tpt_start_date) <= "2023-03-07" AND c.contact_gender = 2 AND c.tpt_start = 1 AND c.contact_age >= 15 AND c.contact_age <= 200 THEN 1 ELSE 0 END) f_15_greater_contacts_initiated_tpt,

	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 1 AND c.tb_confirmed = 1 AND c.contact_age >= 0 AND c.contact_age <= 14 THEN 1 ELSE 0 END) m_0_14_contacts_detected_with_tb,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 2 AND c.tb_confirmed = 1 AND c.contact_age >= 0 AND c.contact_age <= 14 THEN 1 ELSE 0 END) f_0_14_contacts_detected_with_tb,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 1 AND c.tb_confirmed = 1 AND c.contact_age >= 15 AND c.contact_age <= 200 THEN 1 ELSE 0 END) m_15_greater_contacts_detected_with_tb,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 2 AND c.tb_confirmed = 1 AND c.contact_age >= 15 AND c.contact_age <= 200 THEN 1 ELSE 0 END) f_15_greater_contacts_detected_with_tb,

	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 1 AND c.tb_type = 1 AND c.case_type = 2 AND c.contact_age >= 0 AND c.contact_age <= 14 THEN 1 ELSE 0 END) m_0_14_ptb_b_plus,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 2 AND c.tb_type = 1 AND c.case_type = 2 AND c.contact_age >= 0 AND c.contact_age <= 14 THEN 1 ELSE 0 END) f_0_14_ptb_b_plus,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 1 AND c.tb_type = 1 AND c.case_type = 2 AND c.contact_age >= 15 AND c.contact_age <= 200 THEN 1 ELSE 0 END) m_15_greater_ptb_b_plus,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 2 AND c.tb_type = 1 AND c.case_type = 2 AND c.contact_age >= 15 AND c.contact_age <= 200 THEN 1 ELSE 0 END) f_15_greater_ptb_b_plus,

	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 1 AND c.tb_type = 1 AND c.case_type = 1 AND c.contact_age >= 0 AND c.contact_age <= 14 THEN 1 ELSE 0 END) m_0_14_ptb_cd_case,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 2 AND c.tb_type = 1 AND c.case_type = 1 AND c.contact_age >= 0 AND c.contact_age <= 14 THEN 1 ELSE 0 END) f_0_14_ptb_cd_case,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 1 AND c.tb_type = 1 AND c.case_type = 1 AND c.contact_age >= 15 AND c.contact_age <= 200 THEN 1 ELSE 0 END) m_15_greater_ptb_cd_case,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 2 AND c.tb_type = 1 AND c.case_type = 1 AND c.contact_age >= 15 AND c.contact_age <= 200 THEN 1 ELSE 0 END) f_15_greater_ptb_cd_case,

	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 1 AND c.tb_type = 2 AND c.contact_age >= 0 AND c.contact_age <= 14 THEN 1 ELSE 0 END) m_0_14_eptb,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 2 AND c.tb_type = 2 AND c.contact_age >= 0 AND c.contact_age <= 14 THEN 1 ELSE 0 END) f_0_14_eptb,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 1 AND c.tb_type = 2 AND c.contact_age >= 15 AND c.contact_age <= 200 THEN 1 ELSE 0 END) m_15_greater_eptb,
	SUM(CASE WHEN DATE(c.inserted_on) >= "2023-03-01" AND DATE(c.inserted_on) <= "2023-03-07" AND c.contact_gender = 2 AND c.tb_type = 2 AND c.contact_age >= 15 AND c.contact_age <= 200 THEN 1 ELSE 0 END) f_15_greater_eptb
	FROM
	tbl_contact_data c
	-- WHERE c.present_division = 50 AND c.present_district = 10 AND c.present_thana = 67
	GROUP BY c.present_division, c.present_district, c.present_thana
) sub 
GROUP BY sub.present_division, sub.present_district, sub.present_thana
ORDER BY sub.present_division, sub.present_district, sub.present_thana