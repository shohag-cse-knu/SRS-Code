<script>
//for add data

radioCheck(0);

----------------

//for edit data
 if(rowdata.other_comp_relation =='1')
      {
        jQuery("#other2").prop('checked', true);
      }
      else
      {
        jQuery("#other1").prop('checked', true);
        radioCheck(0);
      }
----------------------------------------------	  
	  
function radioCheck(val)
{
  if(val == 1){
    document.getElementById("own_other_name1").disabled = false;
    jQuery("#own_other_role_div1").jqxComboBox({ disabled: false });
    document.getElementById("own_other_address1").disabled = false;
    jQuery("#load_other1").show();

    counter = jQuery("#other_comp_count").val();
    for(i=2;i<=counter;i++){
      if(!jQuery("#own_other_tr"+i).hasClass("delete")){
        jQuery("#own_other_tr"+i).show();
      }
    }
    jQuery("#own_other_Table tfoot tr td .addmore").show();
  }else{
    document.getElementById("own_other_name1").disabled = true;
    jQuery("#own_other_role_div1").jqxComboBox({ disabled: true });
    document.getElementById("own_other_address1").disabled = true;
    jQuery("#load_other1").hide();

    counter = jQuery("#other_comp_count").val();
    for(i=2;i<=counter;i++){
      jQuery("#own_other_tr"+i).hide();
    }
    jQuery("#own_other_Table tfoot tr td .addmore").hide();
  }
}
</script>

//html on radiocheck
<th colspan="2"><input type="radio"  class="gender" name="other_comp_sts" value="0" id="other1" onclick="radioCheck(this.value)" checked>No <input type="radio" id="other2" class="gender" name="other_comp_sts" value="1" onclick="radioCheck(this.value)" >Yes</th>