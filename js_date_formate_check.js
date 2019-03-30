if (input.val()!='') {
	var date_regex = /^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$/ ;
	if(!(date_regex.test(input.val())))
	{
		return false;
	}else{
		return true;
	}
}else{
	return false;
}  