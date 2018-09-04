function print_div(){
	var printContents = document.getElementById('printarea').innerHTML;
	 var originalContents = document.body.innerHTML;
	 document.body.innerHTML = printContents;
	 window.print();
	 document.body.innerHTML = originalContents;
}	
	
	