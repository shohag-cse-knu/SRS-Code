function cif_check(cif_id,checkbox){
	var count = jQuery("#count").val();
	var flag = 0;
	for(var i=1;i<=count;i++){
		check = jQuery("#cif_"+i).is(":checked");
		if(check == true){
			flag = 1;
			break;
		}
	}
	if(flag == 1){
		jQuery("#multiple_cif_save").css("display","block");
	}else{
		jQuery("#multiple_cif_save").css("display","none");
	}
}
// send id through onclick event of checkbox 