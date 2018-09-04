jQuery('#showFacilityBox .showTr:not(:first-child)').each(function(){ //:not(:last-child)
		if(!jQuery(this).is(":last-child")){
			if(this.cells[5].innerHTML == inner_outer)
			{	
				var amount_bdt = (this.cells[6].innerHTML).replace(/,/g, "");
				if(amount_bdt.charAt(0)=='(')
			    {
			        amount_bdt  = amount_bdt.slice(0, -1); 
			        amount_bdt = amount_bdt.substr(1);
			    }			
				total_bdt = parseFloat(total_bdt) + parseFloat(amount_bdt);

				var amount_usd = (this.cells[7].innerHTML).replace(/,/g, "");	
				if(amount_usd.charAt(0)=='(')
			    {
			        amount_usd  = amount_usd.slice(0, -1); 
			        amount_usd = amount_usd.substr(1);
			    }	

				total_usd = parseFloat(total_usd) + parseFloat(amount_usd);
			}
		}else{
				jQuery(this).find('td:eq(1)').html("<strong>"+total_bdt+"</strong>");
				jQuery(this).find('td:eq(2)').html("<strong>"+total_usd+"</strong>");
		}
});