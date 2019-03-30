<?php
	function download_zip($cust_id=NULL){
		$this->load->library('zip');
		$this->load->helper('file');
		$query = $this->db->query("SELECT * FROM cib_file_histry WHERE cust_id = $cust_id")->row();
		$path ='cib_files/';
		$arr_file = explode(',', $query->cib_file);
		foreach ($arr_file as $a_file) {
			$this->zip->read_file($path.$a_file,TRUE);
			//$this->zip->read_file($path.$a_file,FALSE); //Folder Directory won't be added
		}
		$this->zip->download("all_cib_files");
	}
?>