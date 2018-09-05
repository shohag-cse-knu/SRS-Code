

var arr_payment_ref_no_unique = arr_payment_ref_no.filter(function(item, i, arr_payment_ref_no) {
	return i == arr_payment_ref_no.indexOf(item);
});