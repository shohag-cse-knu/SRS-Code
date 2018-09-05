UPDATE ch_basic_charge_document SET field_6 = 8
WHERE sts=1 
AND DATE_FORMAT(e_dt,'%Y-%m-%d') <= '2017-12-31' 
AND DATE_FORMAT(u_dt,'%Y-%m-%d') <= '2017-12-31'


UPDATE ch_basic_charge_document SET field_2 = 1
WHERE sts=1 
AND DATE_FORMAT(e_dt,'%Y-%m-%d') <= '2017-12-31' 
AND DATE_FORMAT(u_dt,'%Y-%m-%d') <= '2017-12-31'


UPDATE ch_debit_authority SET field_3 = 8
WHERE sts=1 
AND DATE_FORMAT(e_dt,'%Y-%m-%d') <= '2017-12-31' 
AND DATE_FORMAT(u_dt,'%Y-%m-%d') <= '2017-12-31'


UPDATE ch_debit_authority SET field_1 = 1
WHERE sts=1 
AND DATE_FORMAT(e_dt,'%Y-%m-%d') <= '2017-12-31' 
AND DATE_FORMAT(u_dt,'%Y-%m-%d') <= '2017-12-31'


UPDATE ch_rjsc_search_report SET field_1 = 1
WHERE sts=1 
AND DATE_FORMAT(e_dt,'%Y-%m-%d') <= '2017-12-31' 
AND DATE_FORMAT(u_dt,'%Y-%m-%d') <= '2017-12-31'



ch_value_of_insurance

ref_type_of_vessel
ref_type_of_vehicle
ref_type_of_aircraft
ref_vessel_vehicle_aircraft_type

INSERT INTO ref_vessel_vehicle_aircraft_type(NAME,sts,e_by,e_dt,u_by,u_dt,d_by,d_dt)
SELECT NAME,sts,e_by,e_dt,u_by,u_dt,d_by,d_dt FROM ref_type_of_vessel

INSERT INTO ref_vessel_vehicle_aircraft_type(NAME,sts,e_by,e_dt,u_by,u_dt,d_by,d_dt)
SELECT NAME,sts,e_by,e_dt,u_by,u_dt,d_by,d_dt FROM ref_type_of_vehicle

INSERT INTO ref_vessel_vehicle_aircraft_type(NAME,sts,e_by,e_dt,u_by,u_dt,d_by,d_dt)
SELECT NAME,sts,e_by,e_dt,u_by,u_dt,d_by,d_dt FROM ref_type_of_aircraft