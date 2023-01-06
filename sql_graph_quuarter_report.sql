SELECT
GROUP_CONCAT(d1.year_quarter) year_quarters,
GROUP_CONCAT(d1.number_of_patients_screened_for_tb) number_of_patients_screened_for_tb,
GROUP_CONCAT(d1.number_tb_presumptive_identified) number_tb_presumptive_identified,
GROUP_CONCAT(d1.number_tb_presumptive_identified_by_physician) number_tb_presumptive_identified_by_physician,
GROUP_CONCAT(d1.number_tb_presumptive_tested) number_tb_presumptive_tested,
GROUP_CONCAT(d1.number_all_forms_of_tb_cases_diagnosed) number_all_forms_of_tb_cases_diagnosed
FROM
(
	SELECT 
	CONCAT(YEAR(screening_date),'-',QUARTER(screening_date)) year_quarter,
	COUNT(*) number_of_patients_screened_for_tb,
	SUM(CASE WHEN presumptive_by_screener = 1 THEN 1 ELSE 0 END) number_tb_presumptive_identified,
	SUM(CASE WHEN presumptive_by_physician = 1 THEN 1 ELSE 0 END) number_tb_presumptive_identified_by_physician,
	SUM(CASE WHEN (ad.afb_microscopy_done = 1 OR ad.ascitic_fluid_study_done = 1 OR ad.biopsy_done = 1 OR ad.csf_study_done =1 OR ad.ct_scan_done = 1 OR ad.ESR_study_done = 1 OR ad.fnac_done = 1 OR ad.mt_done = 1 OR ad.other_investigation_done = 1 OR ad.plural_fluid_study_done = 1 OR ad.pus_study_done = 1 OR ad.x_pert_done = 1 OR ad.x_ray_done = 1) THEN 1 ELSE 0 END) number_tb_presumptive_tested,
	SUM(CASE WHEN ((ad.ptb_type = 'B(+)' AND ad.tb_type = 'PTB') OR (ad.ptb_type = 'Clinically diagnosed' AND ad.tb_type = 'PTB') OR ad.tb_type = 'EPTB') THEN 1 ELSE 0 END) number_all_forms_of_tb_cases_diagnosed
	FROM
	adult_screening ad
	LEFT JOIN facility fl ON (fl.short_code = ad.hospital_name)
	GROUP BY YEAR(screening_date), QUARTER(screening_date)
	ORDER BY YEAR(screening_date), QUARTER(screening_date)
) d1