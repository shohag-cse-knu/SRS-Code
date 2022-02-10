-- Registered based report logic

screening_date number_of_patients_screened_for_tb,

presumptive_by_screener = 1 AND screening_date number_tb_presumptive_identified,

presumptive_by_physician = 1 AND screening_date number_tb_presumptive_advised_for_tests_by_physicians,

(ch.afb_microscopy_done = 1 OR ch.ascitic_fluid_study_done = 1 OR ch.biopsy_done = 1 OR ch.csf_study_done =1 OR ch.ct_scan_done = 1 OR ch.fnac_done = 1 OR ch.mt_done = 1 OR ch.other_investigation_done = 1 OR ch.plural_fluid_study_done = 1 OR ch.pus_study_done = 1 OR ch.x_pert_done = 1 OR ch.x_ray_done = 1) AND followupdate number_tb_presumptive_tested

ptb_type = 'B(+)' AND resultdate number_of_bacteriologically_confirmed_tb_cases

ptb_type = 'Clinically diagnosed' AND resultdate  number_of_clinically_diagnosed

tb_type = 'EPTB' AND resultdate number_of_eptb_cases_detected

diagnosed_tb = 1 AND resultdate number_all_forms_of_tb_cases_diagnosed

x_pert_report_value = 'Rif Resistance DETECTED' AND followupdate number_of_dr_tb_cases_diagnosed

tb_positive_treatment_start_date number_of_tb_cases_started_treatment


