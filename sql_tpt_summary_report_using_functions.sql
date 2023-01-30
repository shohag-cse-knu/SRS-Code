SELECT 
	division_name(p.present_division) division_name,
	district_name(p.present_division,p.present_district) district_name,
	thana_name(p.present_division,p.present_district,p.present_thana) thana_name,
	union_name(p.present_division,p.present_district,p.present_thana,p.present_union) union_name,
	index_case_created(p.present_division,p.present_district,p.present_thana,'2022-01-01','2023-01-06') index_case,
        --  COUNT(DISTINCT c.parent_uuid) index_case,
          COUNT(DISTINCT c.id) number_of_contact,
          SUM(
               CASE
                    WHEN c.xray_done = 1 
                    THEN 1 
                    ELSE 0 
               END
          ) xray_done,
          SUM(
               CASE
                    WHEN c.gxp_test_done = 1 
                    THEN 1 
                    ELSE 0 
               END
          ) gxp_done,
          SUM(
               CASE
                    WHEN c.microscopy_done = 1 
                    THEN 1 
                    ELSE 0 
               END
          ) afb_done,
          st.* 
     FROM
          (SELECT 
               * 
          FROM
               tbl_contact_data 
          WHERE DATE(inserted_on) >= '2022-01-01' 
               AND DATE(inserted_on) <= '2023-01-06') c 
          INNER JOIN tbl_patient_information p 
               ON (c.parent_uuid = p.uuid) 
          INNER JOIN staff_table st 
               ON (
                    st.div_code = p.present_division 
                    AND st.dis_code = p.present_district 
                    AND st.upz_thana_code = p.present_thana 
                    AND st.position = 'FA'
               ) 
     GROUP BY st.id