<?
	//for category
	$doc_head_list = $this->user_model->get_parameter_data('par_docs_head','name',"sts = '1'");
?>

<script type="text/javascript">
//category source
var head_list = [<? $i=1; foreach($doc_head_list as $row){ if($i!=1){echo ',';} echo '{value:"'.$row->id.'", label:"'.$row->name.'"}'; $i++;}?>];
jQuery("#head_list").jqxComboBox({theme: theme,  autoOpen: false, autoDropDownHeight: false, promptText: "Select Document Category", source: head_list, width: 500, height: 21});


jQuery("#sortable").sortable({ 
	placeholder: "ui-sortable-placeholder"
});

//sorting form submit
jQuery("#Save").click(function(){	
	jQuery("#loader").show();
	jQuery.ajax({
		type: "POST",
		url: "<?=base_url()?>index.php/security_title/sorting_order_update/",
		data: jQuery("#form").serialize(),
		cache: false,
		success: function(result){
			jQuery("#loader").hide();
			if(parseInt(result) >0 ){
				jQuery("#jqxgrid").jqxGrid('updatebounddata');
				alert('Updated Successfully');
				jQuery('#sorting_order_popup').jqxWindow('Close');
			}else {
				jQuery("#jqxgrid").jqxGrid('updatebounddata');
				jQuery('#sorting_order_popup').jqxWindow('Close');
				alert('Updated Successfully');
			 }
		}
	});	
});
//category selection
jQuery('#head_list').on('select',function (){
	var item = jQuery(this).jqxComboBox('getSelectedItem');
	if(!item){ return false; }
	jQuery.ajax({
		type: "POST",
		cache: false,
		url: "<?=base_url()?>index.php/security_title/get_title_list/",
		data : {id:item.value},
		datatype: "json",
		success: function(data){ 
			var arr = data.split('*');
			jQuery('#numb12').html('');
			jQuery('#numb12').html(arr[1]);
			jQuery('#numb12').show();
			jQuery('#sortable').html('');
			jQuery('#sortable').html(arr[0]);
			jQuery('#sortable').show();

			jQuery("#btnbtn").show();
		}
	});
});	
</script>

//html drag and drop sorting order category wise

<div id="sorting_order_popup">
	<div><strong>Sorting Order</strong></div>
	<div style="">
		<div style=""><div style="float: left"><strong>Category Name: &nbsp;</strong></div><div id="head_list" name="head_list" style="padding-left: 3px"></div><br></div>
		<div style="">
			<div id="numb12" style="float:left;width:53px;">
				
			</div>
			<div style="float:left;">	
				<form id="form" name="form" method="post">
					<ul id="sortable">
					</ul><br>
					<div align="center" id="loader"><span id="loading">Please wait... <img src="<?=base_url()?>images/loader.gif" align="bottom"></span></div><br>
					<div id="btnbtn" align="center" ><input type="button" id="Save" style="padding:10px 20px;" value="Save">&nbsp;<input type="button" id="Cancel" style="padding:10px 20px;" value="Close"></div><br/>
				</form>
			</div>
		</div>	
	</div>
</div>


<?
//controller drag and drop sorting order category wise
function get_title_list()
{
	$result = $this->security_title_model->get_title_list();
	$str = '';
	$str1 = '';
	$count=1;
	foreach($result as $row){ 
		if(strlen($row->name) > 77){
			$short_name = substr($row->name,0,77)."...";
		}else{
			$short_name = $row->name;
		}
		$str .='<li class="ui-state-default" id="item_'.$row->id.'"><input type="hidden" name="doc_title[]" value="'.$row->id.'" />'.$short_name.'</li>';
		$str1 .='<div class="numbering"><div class="numb">'.$count.'</div></div>';
		$count++;
	}
	echo $str."*".$str1;
}
function sorting_order_update(){
	$data=$this->input->post('doc_title');
	$result = $this->security_title_model->sorting_order_update($data);
	echo $result;
}

//model drag and drop sorting order category wise
function get_title_list()
{
	$title_list = $this->user_model->get_parameter_data('par_docs_title','orders', 'sts = 1 AND docs_head_id='.$this->input->post('id'));
	
	return $title_list;
}

function sorting_order_update($data)
{
	for($i=0;$i<count($data);$i++){
		$z=$i+1;
		$arr=$data[$i];
		$sql=$this->db->query("UPDATE par_docs_title set orders = $z WHERE id = $arr");
	}
	//$this->db->update_batch('sys_link_group', $data, 'id'); 
	return $this->db->affected_rows();
}	

?>