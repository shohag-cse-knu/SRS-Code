function updateRowCount(){
     var table = document.getElementById("facilityRow");
     var rowcountAfterDelete = document.getElementById("facilityRow").rows.length;  
     $c= 1;
     for(var i=1;i<rowcountAfterDelete;i++){ 
     		if(table.rows[i].style.display == 'none'){
     		}else{
     			table.rows[i].cells[0].innerHTML = $c;
          		$c++;
     		}
      }
}