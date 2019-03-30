///----------- view------------------
jQuery.ajax({
		url:"<?=base_url()?>index.php/update_fl/pscoa_product_bill_code",
		data: {facility_id: facilitytypeid,flid: jQuery("#flid").val(),custid:custid},
		type: "POST",
		async: false,
		success: function(data){

			var json = jQuery.parseJSON(data);
			var pscoa_code = json.pscoa;
			jQuery("#pscoa_code").jqxComboBox({source: pscoa_code});

			var product_code = json.product;
			jQuery("#product_code").jqxComboBox({source: product_code});

			var bill_code = json.bill;
			jQuery("#bill_code").jqxComboBox({source: bill_code});
			
			var inner = json.inner;
			jQuery("#inner_line_id").html(inner);
			
			var eco = json.eco;
			if(eco != '' &&  eco != null)
			{
				jQuery("#economic_purpose_code").jqxComboBox({source: eco});
			}
		}
	});

///-----------------------------controller----------------------------

function pscoa_product_bill_code()
	{	
		$result = $this->user_model->get_parameter_data('ref_pscoa_code',' (code+0), SUBSTR(code FROM 1 FOR 1) ',"sts = '1' AND FIND_IN_SET(".$this->input->post('facility_id').",facility_type)");
		$pscoa = array();
		foreach($result as $value){
			$pscoa[]=array(
				'value'=>$value->id.'_'.$value->code,
				'label'=>$value->code.'='.$value->name
				);
		}
		$data = array(
			'pscoa' => $pscoa,
			'product' => $product,
			'bill' => $bill,
			'inner' => $inner,
			'eco' => $eco
		);
		echo json_encode($data);
	}
