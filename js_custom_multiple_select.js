/**
 * Custom Multiple Selects
 * Main Script
 * Version 1.0.1
 * @author Sifur
 */
//$.noConflict(); 
jQuery(function($){
	//When six Iitem will be chosen, rest of the items will be disabled
	function count_and_disable_currencies(){
		if($("#cfield_13").multipleSelect("getSelects").length == 6){
			 $("input[name='selectItemuserfield[field13][]']").each(function(e){
				   if(!$(this).is(':checked')){$(this).prop('disabled', true)}
			 });
		}else{
		$("input[name='selectItemuserfield[field13][]']").prop('disabled', false)
		}
	}

	//If item is selected less than six, than system will choose from the ascending unchecked items. (In Total Six)
	$("#usercp_updateoptions").on('submit',function(){
		if($("#cfield_13").multipleSelect("getSelects").length > 0 && $("#cfield_13").multipleSelect("getSelects").length < 6){
			var arr_new_select = [];
			number_selected = parseInt($("#cfield_13").multipleSelect("getSelects").length);
			var previous_values = $("#cfield_13").multipleSelect("getSelects",'value');
			arr_new_select = previous_values;
			count = 1;
			$("input[name='selectItemuserfield[field13][]']").each(function(e){
					if(!$(this).is(':checked')){
						number_selected++;
						arr_new_select.push(count);
					}
					count++;
					if(number_selected == 6) {
						$("#cfield_13").multipleSelect('setSelects', arr_new_select);
						return false;
					}
			 });
	    }
	    return true;
	});
	//On check and uncheck counting the items to enable and disable the items if six or less than six.
 	$("input[name='selectItemuserfield[field13][]']").bind('change',function (){			
            count_and_disable_currencies();
	});   
 	//After DOM load of field's, setting disable if item is six or not
	count_and_disable_currencies();
});