flag = 0;
var arr_facility_id = {49: "50" , 211: "210#16", 53: "9", 207: "9"};
for (key in arr_facility_id){
	//console.log("foo["+ key +"]="+ arr_facility_id[key]);
	if(key == facilityType){
		flag = 1;
		facility_id = arr_facility_id[key];
		break;
	}
}
if(flag == 1){
	var arr_f_id = facility_id.split('#');
	for(i=0;i<arr_f_id.length;i++){
		c++;
		f_id = arr_f_id[i];
		jQuery.ajax({
			type: "POST",
			url: "<?=base_url()?>index.php/approval/add_facility_id_name",
			data : {id: f_id},
			async:false,
			datatype:'html',
			success: function(response) {
				fl_Name = response;
			}
		});

		jQuery('#facilityTab_'+custid+' #facilityRow').append('<tr class="headerrow" id="new_row_'+c+'"><td style="text-align:center;width:3%"><input type="button" title="Delete" onclick="facility_delete('+c+','+custid+',0)" class="del" /></td><td style="text-align:center;width:3%" ><input type="button" title="Edit" class="edit" onclick="facility_edit('+c+','+custid+')" /></td><td style="width:15%" class="fac_td_'+custid+'">'+fl_Name+ref_no_show+'</td><td style="width:10%">'+natureName+'</td><td style="width:9%">'+typname+'</td><td style="width:7%">'+lineName+'</td><td style="text-align:right;width:15%">'+showAmount+'</td><td style="width:10%">'+tenor+' '+str_tenor_type+'</td><td style="width:11%;font-size:10px">'+fl_shared_with+'</td><td style="width:11%"></td><td style="text-align:center;width:6%">new <input type="hidden" id="hidden_row_new_'+custid+'_'+c+'" class="hidden_row_'+custid+'" value="'+custid+','+arr_f_id[i]+','+facilityNature+','+lineType+','+amount+','+tenor+',0,'+fl_ref_no+','+innerid+','+typeid+','+branchid+','+str_fl_shared_with_id+','+tenor_type+',0,,'+facilityCategory+'" /></td></tr>');

		}
}
var rowID = 'new_row_'+c;