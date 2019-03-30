
//Section-1: Right Click Disable with F12 key (within document ready function)
jQuery(document).bind("contextmenu",function(e) {
	e.preventDefault();
});
jQuery(document).keydown(function(e){
	if(e.which === 123){
	   return false;
	}
});

window.oncontextmenu = function () {
    return false;
}
//End Section-1

//Section-2: Disable Right Click and Disable the Default Behaviors or F12, Ctrl+Shift+I, and Ctrl+Shift+J keys
//within script tag
jQuery(document).keydown(function (event) {
	if (event.keyCode == 123) {
		return false;
	}
	else if ((event.ctrlKey && event.shiftKey && event.keyCode == 73) || (event.ctrlKey && event.shiftKey && event.keyCode == 74)) {
		return false;
	}
});
}
//End Section-1