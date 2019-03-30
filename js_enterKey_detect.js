//Form will be submitted when enter key press in those selectors
jQuery('#cust_id,#customer_name,#mortgage_deed_no,#title_deed_no,#sorting,#ordering').keypress(function(event){
	var keycode = (event.keyCode ? event.keyCode : event.which);
	if(keycode == '13'){
		submitonclick(0,2);clearCount(); 
	}
});

// Another way
//Form will be submitted when enter key press over a webpage
jQuery(document).keypress(function(e) {
	if(e.which == 13) {
		submitonclick(0,2);clearCount(); 
	}
});