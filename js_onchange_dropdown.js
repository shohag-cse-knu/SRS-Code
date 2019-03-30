jQuery("#facility_category").on('change',function (event) {
        	if (event.args) {
                var item1 = event.args.item;
                if (item1)
				{
					var fl_category = item1.value;
					var arr_fl_category = fl_category.split("_");
					var fl_category_id = arr_fl_category[0];
					jQuery.ajax({
					    type: "POST",
					    cache: false,
					    url: "<?=base_url()?>index.php/approval/filtering_product_facility/<?=$segid?>",
					    data : {f_category: fl_category_id},
					    datatype: "json",
					    async:false,
					    success: function(data){
					    	var json = jQuery.parseJSON(data);
							var data1 = json.data;
							jQuery("#facility_type").jqxComboBox({ source: data1 });
						}
					});
				}
			}
        });