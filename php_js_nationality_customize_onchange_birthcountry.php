<script>
jQuery('#birth_country').on('change', function (event){
	var item = jQuery("#birth_country").jqxComboBox('getSelectedItem');
	if(item != null)
	{
		jQuery("#nationality").val(item.value);
		jQuery.ajax({
			url:"<?=base_url()?>index.php/customer/customize_by_country",
			data: {country_id: item.value},
			type: "POST",
			async: false,
			success: function(data){
				var json = jQuery.parseJSON(data);
				var data1 = json.data;
				jQuery("#birth_place").jqxComboBox({source: data1});
			}
		});
	}
});
</script>

<?
// Controller 
function customize_by_country()
{
	$country_id=$this->input->post("country_id");
	$result = $this->user_model->get_parameter_data('ref_cities','name',"sts = '1' AND country_id = '$country_id' ");
	$cities = array();
	foreach($result as $value)
	{
		$cities[]=array(
			'value'=>$value->name,
			'label'=>$value->name
			);
	}
	$data1 = array(
		'data'=> $cities
	);
	echo json_encode($data1);
}
?>
