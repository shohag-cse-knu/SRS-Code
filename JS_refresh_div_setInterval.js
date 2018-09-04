setInterval(function(){ 
	$.ajax({
		  url:"message.php",
		  type: "POST",
		  async: false,
		  datatype:"html",
		  success: function(data){
			  if(data != ''){
				arr_data = data.split('$$');
				$("#msg_reload").html(arr_data[0]);
				if(arr_data[1] !=0 ){
					$("#clear_msg").html(arr_data[1]);
				}
			  }
		  }
	});
 },10000);