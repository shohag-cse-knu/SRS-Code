jQuery.ajax({
        type: "POST",
        url: "<?=base_url()?>index.php/cust_rating/cust_rating_preview_data/",
        data : {id: rowid},
        async: false,
        datatype: 'json',
        success: function(response) {
    		var data = jQuery.parseJSON(response);
    		var str_tab_data = "";
    		jQuery.each( data, function( key, obj ) {
    		   str_tab_data += "<tr>";
			   str_tab_data += "<td style='border: 1px solid #727297;text-align: left;padding: 4px;'>"+obj.u_dt+"</td>";
			   str_tab_data += "<td style='border: 1px solid #727297;text-align: left;padding: 4px;'>"+obj.customer_name+"</td>";
			   str_tab_data += "<td style='border: 1px solid #727297;text-align: left;padding: 4px;'>"+obj.crg_score+"</td>";
			   str_tab_data += "<td style='border: 1px solid #727297;text-align: left;padding: 4px;'>"+obj.crg_entry_dt+"</td>";
			   str_tab_data += "<td style='border: 1px solid #727297;text-align: left;padding: 4px;'>"+obj.crg_expiry_dt+"</td>";
			   str_tab_data += "<td style='border: 1px solid #727297;text-align: left;padding: 4px;'>"+obj.env_rr_score+"</td>";
			   str_tab_data += "<td style='border: 1px solid #727297;text-align: left;padding: 4px;'>"+obj.envrr_entry_dt+"</td>";
			   str_tab_data += "<td style='border: 1px solid #727297;text-align: left;padding: 4px;'>"+obj.envrr_expiry_dt+"</td>";
			   str_tab_data += "<td style='border: 1px solid #727297;text-align: left;padding: 4px;'>"+obj.cr_rating_company+"</td>";
			   str_tab_data += "<td style='border: 1px solid #727297;text-align: left;padding: 4px;'>"+obj.cr_rating_entry_dt+"</td>";
			   str_tab_data += "<td style='border: 1px solid #727297;text-align: left;padding: 4px;'>"+obj.date_cr_rating_expiry+"</td>";
			   str_tab_data += "<td style='border: 1px solid #727297;text-align: left;padding: 4px;'>"+obj.lt_rating+"</td>";
			   str_tab_data += "<td style='border: 1px solid #727297;text-align: left;padding: 4px;'>"+obj.st_rating+"</td>";
			   str_tab_data += "<td style='border: 1px solid #727297;text-align: left;padding: 4px;'>"+obj.sme_rating+"</td>";
			   str_tab_data += "</tr>";
			});
			//alert(str_tab_data);
			jQuery("#tab_data").html(str_tab_data);
    	}
});