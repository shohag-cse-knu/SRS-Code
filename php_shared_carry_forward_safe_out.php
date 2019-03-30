<?php
if($datarow->ch_safe_out_sts < 2)
{												
	if($datarow->ch_shared_with !="" )
	{
		$str_tab_field.="<span style='color:red'>Shared With</span>";
	}
	else
	{
		if($datarow->ch_cf_with !=0)
		{
			$str_tab_field.="<span style='color:red'>Carry Forroward To</span>";
		}
		else
		{
			$str_tab_field.="<input type='button' class='del' onClick=deleteChild('".$counter."','".$child_counter."') />";
			if($datarow->ch_shared_from != 0)
			{
				$str_tab_field.="<br/>shared from";
			}
			elseif($datarow->ch_cf_from != 0)
			{
				$str_tab_field.="<br/>carry forwarded";
			}
		}

	}													
}
elseif($datarow->safe_out_sts == 2)
{
$str_tab_field.="<span style='color:red'>Temp. Safe Out</span>";
}
elseif($datarow->safe_out_sts == 3)
{
$str_tab_field.="<span style='color:red'>Permanently Safe Out</span>";
}
?>