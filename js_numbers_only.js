function owner_networth_unit_amount(val){
    //alert(val);
      var amount = jQuery("#amount"+val).val();
      var unit = jQuery("#unit"+val).jqxComboBox('getSelectedItem');
      var alphaExp = /^[0-9.]+$/;
	  if(amount!='')
	  {
			if(amount.match(alphaExp)){
		      if(unit != null)
		      {
		        var total_amount = amount*unit.value;
		        jQuery("#own_net_amount"+val).val(total_amount);
		      }
		      return true;
			}
			else
			{
				alert("Numbers only!!");
				setTimeout(function(){jQuery("#amount"+val).focus();}, 0);	
				jQuery("#amount"+val).val('');
				jQuery("#own_net_amount"+val).val('');
				return false;
			}
	 }
	 else { return true; }
}