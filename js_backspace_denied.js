//Backspace won't work in webpage without form fields
jQuery(document).on("keydown", function (event) {        
   if (event.keyCode === 8 && !jQuery(event.target).is("input, textarea")) {
	  event.preventDefault();
	}
});