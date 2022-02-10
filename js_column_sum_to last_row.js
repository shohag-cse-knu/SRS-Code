<script>
	arr_flag = [];
	(function($){
		columnCount = $('#referrel tbody tr:last td').length;
		for(var i = 0; i < columnCount-1; i++) arr_flag[i] = 0;
		$('#referrel tr:gt(1)').each(function(){
			for(var j = 1; j<columnCount;j++){
				arr_flag[j] = parseInt(arr_flag[j]) + parseInt(this.cells[j].innerHTML);
			}
		});
		var str = '<td>Total</td>';
		for(var k = 1; k < columnCount-1; k++)
			str += '<td>'+arr_flag[k]+'</td>';
		str = '<tr>'+ str +'</tr>';
		$('#referrel tbody').append(str);
	})(jQuery);
</script>