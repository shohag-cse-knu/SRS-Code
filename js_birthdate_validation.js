<script>
//JQWIDGETS Birthdate validation
{ input: '#date_of_birth', message: 'invalid!', action: 'keyup,blur,change', rule: function(input,commit){
	if(input.val()==''){return true}
		else
		{
			var mydate = new Date();
			var year = mydate.getFullYear();
			year -= 18;
			var month = parseInt(mydate.getMonth())+1
			var dateStr = mydate.getDate()+'/'+month+'/' + year;
			return !validate(dateStr,input.val());
		}
	}
}
</script>
