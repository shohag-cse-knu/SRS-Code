//dropdown filter option fixed
jQuery("#current_rm_id").jqxComboBox({theme: theme,  width: 317, placeHolder: "Select Current RM", source: rm_id, height:21, searchMode:'containsignorecase', autoComplete:true});
jQuery("#rmid").jqxComboBox({theme: theme,  width: 317, placeHolder: "Select First RM", source: rm_id, height: 21, searchMode:'containsignorecase', autoComplete:true});
jQuery("#risk_manager_list").jqxComboBox({theme: theme,  width: 317, placeHolder: "Risk Manager List", source: risk_list, height: 21, searchMode:'containsignorecase', autoComplete:true});
jQuery("#dm_id").jqxComboBox({theme: theme,  width: 317,  autoOpen: false, autoDropDownHeight: false, placeHolder: "Select Document Manager", source: dm_id, height: 21, searchMode:'containsignorecase',autoComplete:true});
jQuery('#rmid,#current_rm_id,#dm_id,#risk_manager_list').on('select', function (event){
	jQuery(this).jqxComboBox({autoComplete: false});
});


//only in edit
jQuery('#rmid,#current_rm_id,#dm_id,#risk_manager_list').on('keypress', function (event){
	jQuery(this).jqxComboBox({autoComplete: true});
});
jQuery("#rmid").jqxComboBox({autoComplete: false});
jQuery("#current_rm_id").jqxComboBox({autoComplete: false});
jQuery("#dm_id").jqxComboBox({autoComplete: false});
jQuery("#risk_manager_list").jqxComboBox({autoComplete: false});