<?

$arr_dist_sro = array(
	  array('id'=>127,'district'=>'field_6','sro'=>'field_9'),
	  array('id'=>128,'district'=>'field_6','sro'=>'field_7'),
	  array('id'=>133,'district'=>'field_4','sro'=>'field_6'), 
	  array('id'=>136,'district'=>'field_6','sro'=>'field_7'),
	  array('id'=>145,'district'=>'field_4','sro'=>'field_5') 
 );
 
 elseif(array_search($row2->docs_title_id, array_column($arr_dist_sro, 'id')) !== false)
{
	$index = array_search($row2->docs_title_id, array_column($arr_dist_sro, 'id'));
	$fil_district = $arr_dist_sro[$index]['district'];
	$fil_sro = $arr_dist_sro[$index]['sro'];
	if($arr_field[$k] == $fil_district)
	{$str_onchange = " onChange='change_sro_mouza(this.value, \"child_".$counter."_".$fil_sro."_".$child_counter."\",0,0,".$row2->docs_title_id.")'";}
}

?>