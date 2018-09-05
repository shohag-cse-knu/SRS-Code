//If mydiv id has any child of class 'carry_forwarded'
jQuery("#mydiv").has('.carry_forwarded').length < 1

jQuery("label").children('div').hide();
		jQuery( "div" ).focusin(function() {
		  jQuery(this).siblings( "label" ).children('div').show();
		});
		jQuery( "div" ).focusout(function() {
		  jQuery(this).siblings( "label" ).children('div').hide();
		});
		
jQuery(document).ready(function($) {
	jQuery("label").children('div').hide();
	jQuery( "div" ).focusin(function() {
	  jQuery(this).siblings( "label" ).children('div').show();
	});
	jQuery( ".form-group" ).focusout(function() {
	  jQuery(this).siblings( "label" ).children('div').hide();
	});
});

jQuery("small").children('span').addClass('disable');
	jQuery("div").focusin(function() {
	  jQuery(this).siblings("label").find('span').removeClass('disable');
	});

	jQuery(".form-group").focusout(function() {
    jQuery(this).find('span').addClass('disable');
});