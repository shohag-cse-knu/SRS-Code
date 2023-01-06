$("input[name='criteria']").click(function(){
	var $self = $(this);
	if ($self.attr('checkstate') == 'true')
	{
		$self.prop('checked', false);
		$self.each( function() {
			$self.attr('checkstate', 'false');
		})  
	}
	else
	{
		$self.prop('checked', true);
		$self.attr('checkstate', 'true');
		$("input[name='criteria']:not(:checked)").attr('checkstate', 'false');
	}
});