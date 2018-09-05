
<script>

	//to know the parent td index. Such as 4th number column
	cellIndex = jQuery("#searchFiled").parent().index();

	//To get the heading from first row 4th number column
	column_name = jQuery("#childtable"+i+" tbody tr:first").find('td:eq('+cellIndex+')').text();

	//select table object
	var object = document.getElementById("facilityRow");

	//how many rows of selected table	 
	var rowcountAfterDelete = document.getElementById("facilityRow").rows.length; 

	//traversing table rows
	for(var i=1;i<rowcountAfterDelete;i++){ 
		//either tr is hide or show
		if(object.rows[i].style.display == 'none'){
		}else{
			object.rows[i].cells[0].innerHTML = "String";
		}
	}
	// Set String or value to 2nd row 4th column of selected table. 
	// var object = document.getElementById("tableId");
	object.rows[2].cells[4].innerHTML = "String";

</script>