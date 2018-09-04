function inade_doc_pdf($menu_group,$menu_cat, $search_fieldes=NULL)
{	
	$aray=explode(":",$search_fieldes);
				
	$customer_id=$aray[0];			
	$dm_id=$aray[1];
	$rm_id=$aray[2];
	$branch_unit_slt=$aray[3];
	$custname=$aray[4];

	$customer_id=$this->clean(trim(strtoupper($customer_id)));
	if($customer_id==""){$particular=2;}else{$particular=1;}
	
	$result_inad= $this->doc_report_model->get_Inadicuices_Document($customer_id,1,$branch_unit_slt,$dm_id,$rm_id,$custname);
			
	$data = array(
		'menu_group'=> $menu_group,
		'menu_cat'=> $menu_cat,
		'customer_id' => $customer_id,
		'custname' => stripslashes($custname),
		'rm_id' => $rm_id,
		'dm_id' => $dm_id,
		'branch_unit_slt' => $branch_unit_slt,							   
		'result_inad' => $result_inad,							   				
		'option' => 'inade_doc',
		'report_generated_by' => $this->session->userdata['user']['user_full_id'],
		'report_generated_name' => $this->session->userdata['user']['user_name'],		   
		'particular' => $particular,
		'reportName'=>'Document Inadequacy Report',
		'f'=>'Document_Inadequacy'
	 );
	  
	 $this->load->view('doc_report/pages/pdf_report_view',$data);
}

//model
function get_Inadicuices_Document($customer_id=NULL,$Show_1=NULL,$branch_unit=NULL,$dm_id=NULL,$rm_id=NULL,$custname=NULL)
{
	if($Show_1=='0'){return array();}
	
	$where1=''; $where2=' j4.sts=1'; $str=""; $inad_row = "";
	
	$where1 ='j0.sts=1 AND ((j0.has_child_sts=0 AND j0.doc_sts="Inadequacy") || (j0.has_child_sts=1 AND j0.doc_sts="N/A"))';
	if($customer_id != '') {$where1.=" AND j0.cust_full_id = '".$customer_id."'";}
			
	if($branch_unit != '' && $branch_unit !='0')
	{
		$where1.=" AND j0.branch_id=".$branch_unit."";
	}
	elseif($this->session->userdata['user']['user_branch_id']!=101 && $this->session->userdata['user']['user_system_admin_sts']!=2)
	{
		$where1.=" AND j0.branch_id = ".$this->session->userdata['user']['user_branch_id']."";
	}
	else
	{
		$arr_usr_branch = explode(',', $this->session->userdata['user']['usr_opt_branch']);
		$str_query = "";
		foreach($arr_usr_branch as $brnch)
		{
			if($brnch !='')
			{
				$str_query.=" OR FIND_IN_SET(".$brnch.",operating_branch)";
			}
		}
		$str_query = trim($str_query,' OR');
		$where1.=" AND j0.cust_id IN(SELECT id FROM app_customer WHERE ".$str_query." AND sts=1)";
	}		
	
	if($custname != '') {$where2.=" AND j4.customer_name LIKE ('%".trim($custname)."%')";}
	
	if($dm_id != '') 
	{
		$dm=implode(',',explode('_', $dm_id));
		$ser_dm = $this->get_dm_ids($dm);
		if($ser_dm!=''){
			$where1.= " AND cust_id IN(".$ser_dm.")";
		}else{$where1.= " AND 1=0";}
	}

	if($rm_id != ''){
		$rm=implode(',',explode('_', $rm_id));
		$ser_rm = $this->get_rm_ids($rm);
		if($ser_rm!=''){
			$where1.= " AND cust_id IN(".$ser_rm.")";
		}else{$where1.= " AND 1=0";}
	}		

	$seg_q = $this->user_model->get_user_segment($this->session->userdata['user']['user_id']);
	foreach($seg_q as $row)
	{
		$str.="(SELECT j0.* FROM docs_seg_".$row->id." j0 WHERE ".$where1." 
		ORDER BY docs_head_id, docs_title_id)
		UNION ALL";
	}	
	$str = strrev(preg_replace(strrev("/UNION ALL/"),strrev(''),strrev($str),1));
			
	$q= $this->db->query("SELECT s1.*, j7.name titlename, j3.name branchname,
	j4.customer_name custname, j8.name headname,  j7.child_table_name, '' as reg_date,
	IF(j7.materiality = 0,'Material','Less Material') materiality
	FROM (".$str.") s1
	LEFT OUTER JOIN par_docs_title as j7 ON(s1.docs_title_id=j7.id) 
	LEFT OUTER JOIN par_docs_head as j8 ON(s1.docs_head_id=j8.id) 
	LEFT OUTER JOIN ref_branch as j3 ON(s1.branch_id=j3.id)
	LEFT OUTER JOIN app_customer as j4 ON(s1.cust_id=j4.id)
	WHERE ".$where2." 
	ORDER BY s1.cust_full_id")->result();
	
	$counter=1;
	foreach($q as $row)
	{
		if($row->doc_sts == 'Inadequacy')
		{
			$inad_row.='<tr style="vertical-align:top;" class="hoverRow" >
			<td style="text-align:center;">'.$counter.'</td>
			<td style="text-align:left;">'.$row->branchname.'</td>	
			<td style="text-align:left;">'.$row->cust_full_id.'</td>
			<td style="text-align:left;">'.$row->custname.'</td>
			<td style="text-align:left;">'.$row->headname.'</td>		
			<td style="text-align:left;">'.$row->titlename.'</td>				
			<td style="text-align:left;">'.$row->app_ref_no.'</td>							
			<td style="text-align:left;">'.$row->materiality.'</td>							
			<td style="text-align:left;">'.$row->remarks.'</td>
			</tr>';
			$counter++;
		}
		elseif($row->doc_sts == 'N/A' && $row->child_table_name!='')
		{
			$q1 = $this->db->query("SELECT s1.* FROM ".$row->child_table_name." s1 
			WHERE s1.docs_id = $row->id AND s1.doc_sts='Inadequacy' AND s1.sts=1
			AND app_ref_no='".$row->app_ref_no."' AND cust_id=".$row->cust_id."")->result();
			foreach ($q1 as $row1)
			{
				if($row1->doc_sts == 'Inadequacy')
				{
					$inad_row.='<tr style="vertical-align:top;" class="hoverRow" >
					<td style="text-align:center;">'.$counter.'</td>
					<td style="text-align:left;">'.$row->branchname.'</td>	
					<td style="text-align:left;">'.$row->cust_full_id.'</td>
					<td style="text-align:left;">'.$row->custname.'</td>
					<td style="text-align:left;">'.$row->headname.'</td>		
					<td style="text-align:left;">'.$row->titlename.'</td>				
					<td style="text-align:left;">'.$row->app_ref_no.'</td>								
					<td style="text-align:left;">'.$row->materiality.'</td>								
					<td style="text-align:left;">'.$row->remarks.'</td>
					</tr>';
					$counter++;
				}
			}
		}		
	}
	
	return $inad_row;
}