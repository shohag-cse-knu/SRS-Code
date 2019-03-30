function multiple_cif_mapping_form_submit(){
		$str_multiple_cif = $this->input->post('data');
		$arr_multiple_cif = explode(',', $str_multiple_cif);

		for($i=0;$i<count($arr_multiple_cif);$i++){
			$arr_secondary = array();
			$str_secondary ='';
			for($j=0;$j<count($arr_multiple_cif) ;$j++){
				if($j!=$i){
					array_push($arr_secondary, $arr_multiple_cif[$j]);
				}
			}
			$str_secondary = implode(',', $arr_secondary);
			$query = $this->db->query("UPDATE app_customer SET multi_cif = '".$str_secondary."' WHERE id='".$arr_multiple_cif[$i]."'");
		}
		return 1;
	}