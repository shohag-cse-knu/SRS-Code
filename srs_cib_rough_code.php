<? if(!empty($owner_info) && $customer_info->customer_type!='Individual')
				{
                    $i=0; ?>

                <tr>
                    <td>
                      <p style="font-weight: bold;font-size: 13pt;margin: 10px 0 10px 0;">Owner/Director/Partner CIB</p>
                        <table class="innerTable" border="1" cellpadding="5" cellspacing="0" style="width:99% !important; border-collapse:collapse;">
                              <tr class="headrow">
                                  <td width="30%">Name</td>
                                  <td width="30%">Current CIB Status</td>
                                  <td width="40%">Update CIB Status</td>
                              </tr>
                            <tbody>
                          <?    foreach ($owner_info as $owner) { $i++; ?>
                          <tr>
                                <td><?=$owner->odp_name?><input type="hidden" name="owner_id<?=$i?>" id="owner_id<?=$i?>" value="<?=$owner->id?>"></td>
                                <td><? if($owner->cibname ==''){ echo 'no current CIB';}
								  else { echo $owner->cibname.' Dated '.$owner->cibdt; } ?></td>
                                <td>
									<table>
                                    	<tr>
                                    	<td id="owner_cib_id_td<?=$i?>">
                                    	<select id="owner_cib_id<?=$i?>" name="owner_cib_id<?=$i?>[]" multiple="multiple" style="padding-left: 3px">
							<? 
								foreach($cib as $row)
								{ echo '<option value="'.$row->id.'"'; if(isset($owner->cib_sts)){
								$arr_seg_owner = explode(',',$owner->cib_sts);
									if(
									in_array($row->id,$arr_seg_owner)) {echo ' selected="selected"';}}
									echo '>'.$row->name.'</option>';
								}
							?>
						</select><script>jQuery("#owner_cib_id<?=$i?>").multipleSelect({ placeholder: "Select Status" });</script>

                                    	
										</td>

                                      		<td><strong>as of </strong><input class="text-input text-input-small" type="text"  id="owner_cib_dt<?=$i?>" name="owner_cib_dt<?=$i?>" placeholder="dd/mm/yyyy" style="width:90px" /><script>datePicker("owner_cib_dt<?=$i?>");</script>
											</td>
										</tr>
										<tr>
											<td colspan="2"><input type="file" name="owner_cib_file<?=$i?>" id="owner_cib_file<?=$i?>" /><input type="hidden" name="owner_existing_cib_file<?=$i?>" id="owner_existing_cib_file<?=$i?>" /><span id="owner_ex_file<?=$i?>"></span></td>
										</tr>
                                  </table>
                                </td>
							</tr>
                          <? } ?>
                          </tbody>
                      </table>
                      <input type="hidden" name="owner_counter" id="owner_counter" value="<?=$i?>">
                  </td></tr>
                <? } ?>
                <? if(!empty($guarantor_info))
				{
                    $i=0; ?>

                <tr>
                    <td>
                      <p style="font-weight: bold;font-size: 13pt;margin: 10px 0 10px 0;">Guarantor CIB</p>
                        <table class="innerTable" border="1" cellpadding="5" cellspacing="0" style="width:99% !important; border-collapse:collapse;">
                              <tr class="headrow">
                                  <td width="30%">Name</td>
                                  <td width="30%">Current CIB Status</td>
                                  <td width="40%">Update CIB Status</td>
                              </tr>
                            <tbody>
                          <?    foreach ($guarantor_info as $guarantor) { $i++; ?>
                          <tr>
                                <td><?=$guarantor->guarantor_name?><input type="hidden" name="guarantor_id<?=$i?>" id="guarantor_id<?=$i?>" value="<?=$guarantor->id?>"></td>
                                <td><? if($guarantor->cibname ==''){ echo 'no current CIB';}
								  else { echo $guarantor->cibname.' Dated '.$guarantor->cibdt; } ?></td>
                                <td>
									<table>
                                    	<tr>
										<td id="guarantor_cib_id_td<?=$i?>">
                                    	<select id="guarantor_cib_id<?=$i?>" name="guarantor_cib_id<?=$i?>[]" multiple="multiple" style="padding-left: 3px">
							<? 
								foreach($cib as $row)
								{ echo '<option value="'.$row->id.'"'; if(isset($guarantor->cib_sts)){
									$arr_seg_guarantor= explode(',',$guarantor->cib_sts);
									if(in_array($row->id,$arr_seg_guarantor)) {echo ' selected="selected"';}}
									echo '>'.$row->name.'</option>';
								}
							?>
						</select><script>jQuery("#guarantor_cib_id<?=$i?>").multipleSelect({ placeholder: "Select Status" });</script>

                                    	
										</td>
                                      		<td><strong>as of </strong><input class="text-input text-input-small" type="text"  id="guarantor_cib_dt<?=$i?>" name="guarantor_cib_dt<?=$i?>" placeholder="dd/mm/yyyy" style="width:90px"><script type="text/javascript" charset="utf-8">datePicker("guarantor_cib_dt<?=$i?>");</script>
											</td>
                                    	</tr>
                                      	<tr>
											<td colspan="2"><input type="file" name="guarantor_cib_file<?=$i?>" id="guarantor_cib_file<?=$i?>" /> <input type="hidden" name="guarantor_existing_cib_file<?=$i?>" id="guarantor_existing_cib_file<?=$i?>" /><span id="guarantor_ex_file<?=$i?>"></span></td>
										</tr>
									</table>
								 </td>
							</tr>
                          <? } ?>
                        </tbody>
                      </table>
                      <input type="hidden" name="guarantor_counter" id="guarantor_counter" value="<?=$i?>">
                  </td></tr>
              <?  } ?>
 					<tr >
              	
              	<td >Additional Email:  <br/>
					<textarea name="additional_email" id="additional_email" value=""  rows="4" cols="50"></textarea><span Style="color:#4286f4">(Example: abc@gmail.com,efg@yahoo.com,etc)</span>
              	</td>



                     <? if(!empty($owner_info) && $customer_info->customer_type!='Individual')
     {
      $i=0;
      foreach ($owner_info as $owner) 
      { $i++; ?>
      ,
       { input: '#owner_cib_id_td<?=$i?> .ms-parent', message: 'required!', action: 'blur,change', rule: function(input,commit){
                        if(jQuery("#owner_cib_id<?=$i?>").val() == "" || jQuery("#owner_cib_id<?=$i?>").val() == null) {return false;}
                        return true;
            }
                },
      { input: '#owner_cib_dt<?=$i?>', message: 'required!', action: 'keyup, blur,change', rule: function(input){
         if(input.val()==''){return false} else { return true; } } 
      },            
      { input: '#owner_cib_file<?=$i?>', message: 'File is required!', action: 'blur,change', rule: function(input){ 
          if(input.val()=='' && jQuery('#owner_existing_cib_file<?=$i?>').val()=='')
          {return false} else { return true; }
          }
      },
      { input: '#owner_cib_file<?=$i?>', message: 'File size must not be greater than 3 MB!', action: 'blur,change', rule: function(input){ 
          if(input.val() !='')
          {
            if((owner_cib_file<?=$i?>.files[0].size/1024/1024) > 3)
            {
              return false
            }
            return true;
          } 
          else { return true; }
          }
      }
      <? }
      } ?>
      <? if(!empty($guarantor_info))
      {
      $j=0;
      foreach ($guarantor_info as $guarantor) 
      { $j++;?>
      ,
      { input: '#guarantor_cib_id_td<?=$j?> .ms-parent', message: 'required!', action: 'blur,change', rule: function(input,commit){
                        if(jQuery("#guarantor_cib_id<?=$j?>").val() == "" || jQuery("#guarantor_cib_id<?=$j?>").val() == null) {return false;}
                        return true;
            }
                },
      
      { input: '#guarantor_cib_dt<?=$j?>', message: 'required!', action: 'keyup, blur,change', rule: function(input){
        if(input.val()==''){return false} else { return true; }
        } 
      },
      { input: '#guarantor_cib_file<?=$j?>', message: 'File is required!', action: 'blur,change', rule: function(input){
        if(input.val()=='' && jQuery('#guarantor_existing_cib_file<?=$j?>').val()=='')
        {return false} else { return true; }
        } 
      }
      ,
      { input: '#guarantor_cib_file<?=$j?>', message: 'File size must not be greater than 3 MB!', action: 'blur,change', rule: function(input){ 
          if(input.val() !='')
          {
            if((guarantor_cib_file<?=$j?>.files[0].size/1024/1024) > 3)
            {
              return false
            }
            return true;
          } 
          else { return true; }
          }
      }
      <? }
      } ?>


<? if(!empty($owner_info) && $customer_info->customer_type!='Individual'){
    $i=0;
    foreach ($owner_info as $owner) { $i++; ?>             
      jQuery("#owner_cib_file<?=$i?>").change(function(e){
         jQuery("#owner_existing_cib_file<?=$i?>").val('');
         jQuery("#owner_ex_file<?=$i?>").html('');
      });
    <? }
    } ?>

    <? if(!empty($guarantor_info)){
    $i=0;
    foreach ($guarantor_info as $guarantor) { $i++;?>              
      jQuery("#guarantor_cib_file<?=$i?>").change(function(e){
           jQuery("#guarantor_existing_cib_file<?=$i?>").val('');
           jQuery("#owner_existing_cib_file<?=$i?>").val('');
           jQuery("#guarantor_ex_file<?=$i?>").html('');
        });
    <? }
    } ?>

        <? if(!empty($owner_info) && $customer_info->customer_type!='Individual'){
        $i=0;
        foreach ($owner_info as $owner) { $i++; ?>
        //if(emptyCheckCombo('owner_cib_id<?=$i?>')){count++;}
        <? }
        } ?>
      <? if(!empty($guarantor_info)){
        $i=0;
        foreach ($guarantor_info as $guarantor) { $i++;?>
        //if(emptyCheckCombo('guarantor_cib_id<?=$i?>')){count++;}
  
         <? }
        } ?>


        <? if(!empty($owner_info) && $customer_info->customer_type!='Individual'){
      $i=0;
      foreach ($owner_info as $owner) { $i++; ?>
       // jQuery("#owner_cib_id<?=$i?>").jqxComboBox({theme: theme, promptText: "Select CIB", source: cib_id, width: 180, height: 21});
        <? if($lock_sts == 2){ ?>
          //jQuery("#owner_cib_id<?=$i?>").jqxComboBox('val', '<?=$owner->cib_sts?>');
          jQuery("#owner_cib_dt<?=$i?>").val('<?=$owner->cibdt?>');
          jQuery("#owner_existing_cib_file<?=$i?>").val('<?=$owner->cib_file?>');
          <?
            $file_name = $owner->cib_file;
            $org_name = explode('=', $file_name);
          ?>
          jQuery("#owner_ex_file<?=$i?>").html('<a download="<?=str_replace("+", " ", $org_name[1])?>.pdf" href="<?=base_url()?>cib_files/<?=$owner->cib_file?>" target="_blank" title="<?=$owner->cib_file_caption?>"><img height="16" width="16" src="<?=base_url()?>images/pdf_icon.gif" style="vertical-align: top; margin-left:5%" /></a>');
        <? } ?>
    <? }
    } ?>
     <? if(!empty($guarantor_info)){
      $i=0;
      foreach ($guarantor_info as $guarantor) { $i++; ?>
        //jQuery("#guarantor_cib_id<?=$i?>").jqxComboBox({theme: theme, promptText: "Select CIB", source: cib_id, width: 180, height: 21});
        <? if($lock_sts == 2){ ?>
         // jQuery("#guarantor_cib_id<?=$i?>").jqxComboBox('val', '<?=$guarantor->cib_sts?>');
          jQuery("#guarantor_cib_dt<?=$i?>").val('<?=$guarantor->cibdt?>');
          jQuery("#guarantor_existing_cib_file<?=$i?>").val('<?=$guarantor->cib_file?>');
          <?
            $file_name = $guarantor->cib_file;
            $org_name = explode('=', $file_name);
          ?>
          jQuery("#guarantor_ex_file<?=$i?>").html('<a download="<?=str_replace("+", " ", $org_name[1])?>.pdf" href="<?=base_url()?>cib_files/<?=$guarantor->cib_file?>" target="_blank" title="<?=$guarantor->cib_file_caption?>"><img height="16" width="16" src="<?=base_url()?>images/pdf_icon.gif" style="vertical-align: top; margin-left:5%" /></a>');
        <? } ?>
    <? }
    } ?>

  //preview
  
  <? if(!empty($owner_info) && $customer_info->customer_type!='Individual'){
                    $i=0; ?>

                <tr>
                    <td>
                      <p style="font-weight: bold;font-size: 13pt;margin: 10px 0 10px 0;">Owner/Director/Partner CIB</p>
                        <table class="innerTable" border="1" cellpadding="5" cellspacing="0" style="width:99% !important; border-collapse:collapse;">
              <tr class="headrow">
                <td width="35%">Name</td>
                <td width="30%">CIB Status</td>
                <td width="10%">CIB Date</td>
                <? if($view == 1){?>
                <td width="10%">Uploaded File</td>
                <? } ?>
              </tr>
                            <tbody>
                          <?    foreach ($owner_info as $owner) { $i++; ?>
                            <tr>
                                <td><?=$owner->odp_name?><input type="hidden" name="owner_id<?=$i?>" id="owner_id<?=$i?>" value="<?=$owner->id?>">
                </td>
                <td><? if($owner->cibname ==''){ echo 'no current CIB';}
                  else { echo $owner->cibname;} ?>
                </td>
                <td><? if($owner->cibname ==''){ echo 'no current CIB';}
                  else { echo $owner->cibdt;} ?>
                </td>
                <? if($view == 1){ ?>
                                <td align="center">
                <? 
                  if($owner->cib_file != '')
                  {
                    $file_name = $owner->cib_file;
                    $org_name = explode('=', $file_name);
                    echo '<a download="'.str_replace('+', ' ', $org_name[1]).'.pdf" href="'.base_url().'cib_files/'.$owner->cib_file.'" target="_blank" title="'.$owner->cib_file_caption.'"><img height="16" width="16" src="'.base_url().'images/pdf_icon.gif" style="vertical-align: top; margin-left:1%" /></a>';
                  }
                ?>
                </td>
                <? } ?>
                          </tr>
                          <? } ?>
                          </tbody>
                      </table>
                  </td></tr>
                <? } ?>
                <? if(!empty($guarantor_info)){
                    $i=0; ?>

                <tr>
                    <td>
                      <p style="font-weight: bold;font-size: 13pt;margin: 10px 0 10px 0;">Guarantor CIB</p>
                        <table class="innerTable" border="1" cellpadding="5" cellspacing="0" style="width:99% !important; border-collapse:collapse;">
                            <tr class="headrow">
                <td width="35%">Name</td>
                <td width="30%">CIB Status</td>
                <td width="10%">CIB Date</td>
                <? if($view == 1){?>
                <td width="10%" >Uploaded File</td>
                <? } ?>
              </tr>
                            <tbody>
                          <?    foreach ($guarantor_info as $guarantor) { $i++; ?>
              <tr>
                 <td><?=$guarantor->guarantor_name?><input type="hidden" name="guarantor_id<?=$i?>" id="guarantor_id<?=$i?>" value="<?=$guarantor->id?>">
                </td>
                <td><? if($guarantor->cibname ==''){ echo 'no current CIB';}
                  else { echo $guarantor->cibname;} ?>
                </td>
                <td><? if($guarantor->cibname ==''){ echo 'no current CIB';}
                  else { echo $guarantor->cibdt;} ?>
                </td>
                <? if($view == 1){ ?>
                                <td align="center">
                <? 
                  if($guarantor->cib_file != '')
                  {
                    $file_name = $guarantor->cib_file;
                    $org_name = explode('=', $file_name);
                    echo '<a download="'.str_replace('+', ' ', $org_name[1]).'.pdf" href="'.base_url().'cib_files/'.$guarantor->cib_file.'" target="_blank" title="'.$guarantor->cib_file_caption.'"><img height="16" width="16" src="'.base_url().'images/pdf_icon.gif" style="vertical-align: top; margin-left:1%" /></a>';
                  }
                ?>
                </td>
                <? } ?>
              </tr>
                          <? } ?>
                        </tbody>
                      </table>
                  </td></tr>
              <?  } ?>  