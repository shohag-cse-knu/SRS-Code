//Reference eDoc CBL Documentation Category and Documentation Title
//Drag and Drop Sorting Order CSS
<style type="text/css">
.ui-sortable {
	width: 561px;
	/*margin: 0px auto;*/
	background-color: #ccc;
	-webkit-box-shadow:  0px 0px 10px 1px rgba(0, 0, 0, .1);
    box-shadow:  0px 0px 10px 1px rgba(0, 0, 0, .1);
    list-style-type: none; 
    padding: 0; 
}
.ui-sortable li.ui-state-default { 
	margin: 0; 
	height: 30px;
	line-height: 30px;
	font-size: 25px; 
	color: rgb(255, 255, 255);
	outline: 0;
	padding: 0;
	margin: 0;
	text-indent: 15px;
	background: #2b81b0;
	border-bottom: 1px solid rgba(0,0,0,.5);
	/*text-shadow: -1px -1px 0px rgba(0,0,0,.5);*/
	font-size: 12px;
	position: relative;
	cursor: move;
	}
.numbering {
	margin: 0; 
	padding: 0;
	height: 31px;
	position: relative; 
	border-bottom: 1px solid #000000;
}

.numb{
	font-size: 15px;
	position: absolute;
	right:25px;
	top:5px;
}
	
.ui-sortable li.ui-state-default:first-child {
	border-top: 0; 
} */
.ui-sortable li.ui-state-default:last-child {
	/*border-bottom: 0;*/
}

.ui-sortable-placeholder {
	border: 3px dashed #aaa;
	height: 30px;
	width: 617px;
	background: #ccc;
}
.ui-sortable li.ui-state-default:after {
	content: "\f0c9";
	display: inline-block;
	font-family: "FontAwesome";
	position: absolute;
	right: 18px;
	top: 4px;
	text-align: center;
	line-height: 30px;
	color: rgba(255,255,255);
	text-shadow: 0px 0px 0px rgba(0,0,0,0);
	cursor: move;
}	

</style>

//Drag and Drop Sorting Order Javascript
<script type="text/javascript">
jQuery(document).ready(function($) {
	jQuery('#sorting_order_popup').jqxWindow({width: 646, height:481, resizable: false,  isModal: true, autoOpen: false, cancelButton: $("#Cancel"), modalOpacity: 0.01});										
	jQuery('#add_sorting_button').click(function(event) {
		jQuery('#sorting_order_popup').jqxWindow('open');
	});
	jQuery("#Cancel").jqxButton({ theme: theme });
	jQuery("#Save").jqxButton({ theme: theme });
	
	var values;
	jQuery("#sortable").sortable({ 
		placeholder: "ui-sortable-placeholder"
		/*update: function(event,ui){
			var postData = jQuery(this).sortable('serialize');
			//console.log(postData);
			values = jQuery("input[name='menu[]']").map(function(){return jQuery(this).val();}).get();
		}*/
	});
	
	jQuery("#loader").hide();
	jQuery("#Save").click(function(){
		jQuery("#loader").show();	
		jQuery.ajax({
			type: "POST",
			url: "<?=base_url()?>index.php/security_cat/sorting_order_update/",
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
});
</script>

//Drag and Drop Sorting Order html

<div id="sorting_order_popup">
	<div><strong>Sorting Order</strong></div>
	<div style="">
		<div style="float:left;width:53px;">
			<?php
			$i=1;
			foreach($head_list as $row){
				echo '<div class="numbering"><div class="numb">'.$i.'</div></div>';
			$i++;
			}
			
			?>
		</div>
		<div style="float:right;">
			<form id="form" name="form" method="post">
				<ul id="sortable">
					<?php
					foreach($head_list as $row){
						echo '<li class="ui-state-default" id="item_'.$row->id.'"><input type="hidden" name="doc_cat[]" value="'.$row->id.'" />'.$row->name.'</li>';
					}
					?>
				</ul><br/>
				<div align="center" id="loader"><span id="loading">Please wait... <img src="<?=base_url()?>images/loader.gif" align="bottom"></span></div><br>
				<div align="center" ><input type="button" id="Save" style="padding:10px 20px;" value="Save">&nbsp;<input type="button" id="Cancel" style="padding:10px 20px;" value="Close"></div>
				<br/>
				
			</form>
		</div>
		
	</div>
</div>


<?

//Drag and Drop Sorting Order Controller

function sorting_order_update(){
	$data=$this->input->post('doc_cat');
	$result = $this->security_cat_model->sorting_order_update($data);
	echo $result;
}

//Drag and Drop Sorting Order Model

function sorting_order_update($data)
{
	for($i=0;$i<count($data);$i++){
		$z=$i+1;
		$arr=$data[$i];
		$sql=$this->db->query("UPDATE par_docs_head set orders = $z WHERE id = $arr");
	}
	return $this->db->affected_rows();	
}	

?>
