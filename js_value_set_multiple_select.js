
<script>
//Validation of multiple select fields by ms-parent
{ input: '#flty_id .ms-parent', message: 'Required!', action: 'change, blur', rule: function(input){
		if(jQuery("#facility_type").val() == '' || jQuery("#facility_type").val() == null)
		{return false; }
		return true;
	}
},
//Multiple selects label
var facilityName = jQuery("#facility_type").multipleSelect("getSelects", "text");

// JS value set to multiple select box
var arr_f_agent_ids = json.f_agent_ids.split(',');//String to array
jQuery("#f_agent_ids").multipleSelect('setSelects', arr_f_agent_ids); //value set to multiple select box

// Multiple Select disable only field by name and value
jQuery("input[name='selectItemsegment[]'][value='"+segId+"']").prop("disabled", 'disabled');
</script>

<td>

<select id="f_agent_ids" name="f_agent_ids[]" multiple="multiple">
	<? 
		foreach($bank_list as $row)
		{ 
			echo '<option value="'.$row->id.'"'; 
			//if(isset($result->segments_id)){if(in_array($row->id,$arr_seg)) {echo ' selected="selected"';}}
			echo '>'.$row->name.'</option>';
		}
	?>
</select>
<script>
	jQuery('#f_agent_ids').multipleSelect({ 
		placeholder: "Select Facility Agents", 
		selectAll: true, width: 322,
		multiple: true, multipleWidth: 120
	});
</script>

</td>