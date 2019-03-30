 jQuery("#fl_limit_unit").jqxComboBox({theme: dropdowntheme,  width: 100, autoDropDownHeight: true, placeHolder: "Unit", source: shared_name, height: 21});

 jQuery("#fl_limit_unit").bind('change',function (){			
			var fl_limit = jQuery("#fl_limit").val();
			var fl_limit_unit = jQuery("#fl_limit_unit").jqxComboBox('getSelectedItem');
			if(fl_limit_unit != null)
			{
				var total_amount = fl_limit*fl_limit_unit.value;
				jQuery("#Amount_Span").val(total_amount);
			}
});