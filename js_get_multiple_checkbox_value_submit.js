		jQuery("#multiple_cif_save").click(function(){
        	var count = jQuery("#count").val();
        	primary_custid = jQuery("#custid_0").val();
			var flag = 0;
			multiple_cif = [];
			multiple_cif.push(primary_custid);

			for(var i=1;i<=count;i++){
				check = jQuery("#cif_"+i).is(":checked");
				if(check == true){
					multiple_cif.push(jQuery("#custid_"+i).val());
				}
			}
			multiple_cif.sort(function(a, b){return a - b});
			str_multiple_cif = multiple_cif.toString();
			jQuery.ajax({
				type: "POST",
				cache: false,
				url: "<?=base_url()?>index.php/multiple_cif/multiple_cif_mapping_form_submit",
				data : {data : str_multiple_cif},
				datatype:'html',
				success: function(response){
					if(response == 1){
						alert("ok");
					}
				}
			});
        });