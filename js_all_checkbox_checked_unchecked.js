function checkAll()
{
    var counter = parseInt(jQuery("#count").val());
    if(jQuery("#checkedall").is(":checked") == true)
    {
        for(var j=1;j<=counter;j++)
        {
            jQuery("#user_"+j).prop('checked', true);
        }
    }
    else if(jQuery("#checkedall").is(":checked") == false)
    {
        for(var j=1;j<=counter;j++)
        {
            jQuery("#user_"+j).prop('checked', false);
        }
    }
}

function checkUser(sl)
{
	if(jQuery("#user_"+sl).is(":checked") == false)
	{
		if(jQuery("#checkedall").is(":checked") == true)
	    {
	        jQuery("#checkedall").prop('checked', false);
	    }
	}
	else
	{
		var flag = 0;
		var counter = parseInt(jQuery("#count").val());
	    if(jQuery("#checkedall").is(":checked") == false)
	    {
	        for(var j=1;j<=counter;j++)
	        {
	            if(jQuery("#user_"+j).is(":checked") == false)
			    {
			        flag = 1;break;
			    }
	        }
	        if(flag ==0){jQuery("#checkedall").prop('checked', true);}
	    }
	}
}