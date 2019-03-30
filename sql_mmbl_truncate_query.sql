function mmbl_truncate(){
		$list = $this->db->query("SELECT 
										DISTINCT TABLE_NAME
										FROM 
										information_schema.COLUMNS 
										WHERE 
										TABLE_SCHEMA = 'edoc_mmbl' 
									AND 
									(
										TABLE_NAME LIKE 'ch\_%' 
										OR TABLE_NAME LIKE 'app_loan\_%'
										OR TABLE_NAME LIKE 'app_facility\_%'
										OR TABLE_NAME LIKE 'title\_%'
										OR TABLE_NAME LIKE 'doc%'
										OR TABLE_NAME LIKE 'vault\_%'
										OR TABLE_NAME LIKE 'ssc_history'
										OR TABLE_NAME LIKE 'cib\_%'
									)
									ORDER BY TABLE_NAME;")->result();
		/*echo "<pre>";
		print_r($list);
		exit();*/
		$str = '';
		if(count($list)>0)
		{
			foreach($list AS $object){
				$str .= "TRUNCATE TABLE `edoc_mmbl`.`".$object->TABLE_NAME."`;\n\r";
				//$this->db->query("TRUNCATE TABLE `edoc_mmbl`.`".$object->TABLE_NAME."`;");
			}
		}
		echo $str;
	}