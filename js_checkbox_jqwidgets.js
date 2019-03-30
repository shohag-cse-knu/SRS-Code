<script type="text/javascript">
jQuery("#co_utilize_toggle").jqxCheckBox({theme: theme, width: 25, height: 25});
jQuery("#co_utilize").val(0);
jQuery('#co_utilize_toggle').jqxCheckBox({ checked:true });

jQuery("#co_utilize_toggle").bind('change', function (event) {
	var checked = event.args.checked;
	if(checked==true)
	{
		jQuery("#co_utilize").val('1');
	}
	else
	{jQuery("#co_utilize").val('0');}

});	

</script>
<td><div id='co_utilize_toggle'></div><input type="hidden"  id="co_utilize" name="co_utilize" value=""></td>
							