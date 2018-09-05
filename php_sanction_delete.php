function sanction_delete($app_ref_no=0)
{
	$app_ref_no = $app_ref_no;
	$table_list = $this->db->query("SELECT DISTINCT child_table_name FROM child_table_list WHERE sts=1")->result();
	if(count($table_list)>0)
	{
		foreach ($table_list as $row) 
		{
			$this->db->query("UPDATE ".$row->child_table_name." SET sts=0 WHERE app_ref_no = '".$app_ref_no."'");
		}
	}
}