SELECT
division_name(p.division) division,
district_name(p.division, p.district) district,
COUNT(DISTINCT p.uuid) index_case,
SUM(p.no_of_family_members) household_or_close_contacts_identified,

household_close_contacts_screened_for_tb(p.division, p.district, 1, '2023-02-01', '2023-03-05') m_household_close_contacts_screened_for_tb,
household_close_contacts_screened_for_tb(p.division, p.district, 2, '2023-02-01', '2023-03-05') f_household_close_contacts_screened_for_tb,

contacts_tested_for_tpt_eligibility(p.division, p.district, 1, '2023-02-01', '2023-03-05') m_contacts_tested_for_tpt_eligibility,
contacts_tested_for_tpt_eligibility(p.division, p.district, 2, '2023-02-01', '2023-03-05') f_contacts_tested_for_tpt_eligibility,

how_much_contacts_tested(p.division, p.district, 'Chest X-Ray', 1, '2023-02-01', '2023-03-05') m_how_much_contacts_tested_xray,
how_much_contacts_tested(p.division, p.district, 'Chest X-Ray', 2, '2023-02-01', '2023-03-05') f_how_much_contacts_tested_xray,
how_much_contacts_tested(p.division, p.district, 'TST/IGRA', 1, '2023-02-01', '2023-03-05') m_how_much_contacts_tested_tst,
how_much_contacts_tested(p.division, p.district, 'TST/IGRA', 2, '2023-02-01', '2023-03-05') f_how_much_contacts_tested_tst,

contacts_eligible_for_tpt(p.division, p.district, 0, 4, 1, '2023-02-01', '2023-03-05') m_0_4_contacts_eligible_for_tpt,
contacts_eligible_for_tpt(p.division, p.district, 0, 4, 2, '2023-02-01', '2023-03-05') f_0_4_contacts_eligible_for_tpt,
contacts_eligible_for_tpt(p.division, p.district, 5, 14, 1, '2023-02-01', '2023-03-05') m_5_14_contacts_eligible_for_tpt,
contacts_eligible_for_tpt(p.division, p.district, 5, 14, 2, '2023-02-01', '2023-03-05') f_5_14_contacts_eligible_for_tpt,
contacts_eligible_for_tpt(p.division, p.district, 15, 200, 1, '2023-02-01', '2023-03-05') m_15_greater_contacts_eligible_for_tpt,
contacts_eligible_for_tpt(p.division, p.district, 15, 200, 2, '2023-02-01', '2023-03-05') f_15_greater_contacts_eligible_for_tpt,

contacts_initiated_tpt(p.division, p.district, 0, 4, 1, '2023-02-01', '2023-03-05') m_0_4_contacts_initiated_tpt,
contacts_initiated_tpt(p.division, p.district, 0, 4, 2, '2023-02-01', '2023-03-05') f_0_4_contacts_initiated_tpt,
contacts_initiated_tpt(p.division, p.district, 5, 14, 1, '2023-02-01', '2023-03-05') m_5_14_contacts_initiated_tpt,
contacts_initiated_tpt(p.division, p.district, 5, 14, 2, '2023-02-01', '2023-03-05') f_5_14_contacts_initiated_tpt,
contacts_initiated_tpt(p.division, p.district, 15, 200, 1, '2023-02-01', '2023-03-05') m_15_greater_contacts_initiated_tpt,
contacts_initiated_tpt(p.division, p.district, 15, 200, 2, '2023-02-01', '2023-03-05') f_15_greater_contacts_initiated_tpt,

contacts_detected_with_tb(p.division, p.district, 5, 14, 1, '2023-02-01', '2023-03-05') m_0_14_contacts_detected_with_tb,
contacts_detected_with_tb(p.division, p.district, 5, 14, 2, '2023-02-01', '2023-03-05') f_0_14_contacts_detected_with_tb,
contacts_detected_with_tb(p.division, p.district, 15, 200, 1, '2023-02-01', '2023-03-05') m_15_greater_contacts_detected_with_tb,
contacts_detected_with_tb(p.division, p.district, 15, 200, 2, '2023-02-01', '2023-03-05') f_15_greater_contacts_detected_with_tb,


tb_types(p.division, p.district, '1','2', 5, 14, 1, '2023-02-01', '2023-03-05') m_0_14_ptb_b_plus,
tb_types(p.division, p.district, '1','2', 5, 14, 2, '2023-02-01', '2023-03-05') f_0_14_ptb_b_plus,
tb_types(p.division, p.district, '1','2', 15, 200, 1, '2023-02-01', '2023-03-05') m_15_greater_ptb_b_plus,
tb_types(p.division, p.district, '1','2', 15, 200, 2, '2023-02-01', '2023-03-05') f_15_greater_ptb_b_plus,

tb_types(p.division, p.district, '1','1', 5, 14, 1, '2023-02-01', '2023-03-05') m_0_14_ptb_cd_case,
tb_types(p.division, p.district, '1','1', 5, 14, 2, '2023-02-01', '2023-03-05') f_0_14_ptb_cd_case,
tb_types(p.division, p.district, '1','1', 15, 200, 1, '2023-02-01', '2023-03-05') m_15_ptb_cd_case,
tb_types(p.division, p.district, '1','1', 15, 200, 2, '2023-02-01', '2023-03-05') f_15_greater_ptb_cd_case,

tb_types(p.division, p.district, '2','0,1,2', 5, 14, 1, '2023-02-01', '2023-03-05') m_0_14_eptb,
tb_types(p.division, p.district, '2','0,1,2', 5, 14, 2, '2023-02-01', '2023-03-05') f_0_14_eptb,
tb_types(p.division, p.district, '2','0,1,2', 15, 200, 1, '2023-02-01', '2023-03-05') m_15_eptb,
tb_types(p.division, p.district, '2','0,1,2', 15, 200, 2, '2023-02-01', '2023-03-05') f_15_greater_eptb

FROM
heed_index_patients p
WHERE DATE(p.insertedOn) >= '2023-02-01' AND DATE(p.insertedOn) <= '2023-03-05'
GROUP BY p.division, p.district
ORDER BY district