/**
 * Unstructured Data Processing (Copy && Remove Subsections)
 * Main Script
 * Version 1.0.1
 * @author Sifur
 */
$(function() {
	//document.getElementById('copy_sections').addEventListener('contextmenu', event => event.preventDefault());
	//Copy Section Modal
	$("#dialog-6" ).dialog({
		autoOpen: false, 
		modal: true,
		width: 600,
		height: 450
	});
	//Remove Section Modal
	$("#dialog-7" ).dialog({
		autoOpen: false, 
		modal: true,
		width: 600,
		height: 450
	});

	if($('#parent_link_section').html() != '' && $('#forum_link_choice').html() != ''){
		$('#forum_link_choice').html($('#parent_link_section').html());
		$('#parent_link_section').html('');
	}

	//Event Handling
	/*Start:- Menu Copy Subsections to Sections*/
	$("#copy_sections").click(function(e) {
		e.preventDefault();
		$(this).closest('.popupbody').hide();
		$("#dialog-6").show();
		$('#sectionname').val('');
		$('#description').val();
		$('#notification').html('');
		$('#notification').hide();
		$('.link_section').prop('checked',true);
		$("#dialog-6").dialog("open");
	});
	/*End:- Menu Copy Subsections to Sections*/

	/*Start:- Copy Submit Buttons*/
	$('#update_section').click(function(e){
		e.preventDefault();
		if(sessionStorage.description !='EMPTY') $('#previous_description').html(sessionStorage.description);
		count = 0;
		var ArrNodeValue = [];
		var ArrNodeFlag = [];
		var link_flag = -1;
		/* Start:- Clustering the description according to link or contents which come by forum ID searching*/
		if(sessionStorage.description !='EMPTY'){
			$('#previous_description').contents().each(function(){
				if(this.nodeType == 3 && this.data != ''){
			    	dat = this.data;
			    	text = $.trim(dat);
			    	ArrNodeValue[count] = text;
			    	if(text != ''){
				    	if(text == '|') ArrNodeFlag[count] = 1;
				    	else ArrNodeFlag[count] = 0;
				    	count++;
			    	}
			    }else{
			    	if(this.innerHTML !=''){
			    		outer = this.outerHTML;
			    		outer = $.trim(outer);
			    		ArrNodeValue[count] = outer;
			    		if($(outer).filter('a').length < 1) ArrNodeFlag[count] = 0;
			    		else {ArrNodeFlag[count] = 1; link_flag = count;}
			    		count++;
			    	}	
			    }
			});
		}
		/* End:- Clustering the description according to link or contents which come by forum ID searching*/

		/* Start:- Getting the checked subsections for copy */
		var arr=[];
	    $('input:checked[name=link_section]').each(function(){
	    	anchor = $(this).val();
	    	var dom = $(anchor);
	    	var str = '<b>'+dom.html()+'</b>';
	    	dom.html(str);
	        arr.push(dom[0].outerHTML);
	    });
	    var description = arr.join(' | ');
	    /* End:- Getting the checked subsections for copy */

	    if(sessionStorage.description != 'EMPTY'){
		    if(link_flag != -1){
		    	ArrNodeValue[link_flag] = ArrNodeValue[link_flag]+' | '+description;
		    }else{
		    	ArrNodeValue[count-1] = description+'<br>'+ArrNodeValue[count-1];
		    }
		    slashp = 0;
			if(ArrNodeFlag[0] == 0) {ArrNodeValue[0] = ArrNodeValue[0] + '</p>'; slashp = 1}

		    for (var i = 1; i < ArrNodeValue.length; i++) {
		    	if((ArrNodeFlag[i-1] - ArrNodeFlag[i]) != 0 || link_flag == -1){
		    		if (slashp == 1 && i==1 ) continue;
		    		ArrNodeValue[i] = '<br>' + ArrNodeValue[i];
		    	}
		    }
		    description = ArrNodeValue.join('');
		}
	    
	    $('#description').val(description);
	    if($('#sectionname').val() =='' || description ==''){
	    	$('#notification').css('color','red');
	    	$('#notification').html('<b>'+$('#section_name_and_subsections_are_required').text()+'</b>');
			$('#notification').show();
	    	return false;
	    }else{
	    	$('#notification').html('<b>Please wait ...<b>');
			$('#notification').css('color','black');
			$('#notification').show();
	    	var postdata = $('#copy_sections_form').serialize();
		    var doo = 'copysections';
		    var url = "../ajax.php?"+SESSIONURL+"securitytoken="+SECURITYTOKEN+"&do="+doo;
			$.ajax({
				type: "POST",
				cache: false,
				url: url,
				data : postdata,
		        async: false,
		        dataType: 'xml',
				success: function(response){	
					var message = $(response).find('message').first().text();
					$('#notification').html('<b>'+message+'</b>');
					$('#notification').css('color','green');
					$('#notification').show();
					sessionStorage.description = description;
				},
                error: function(ex){
                    $('#notification').html('<b>Server Error.</b>');
					$('#notification').css('color','red');
					$('#notification').show();
                }
			});
			//$('#update_section').show();
	    }
	});
	/*End:- Copy Submit Buttons*/

	/*Remove Sections*/

	/*Start:- Menu Remove Subsection From Section */
	$("#remove_sections").click(function(e) {
		e.preventDefault();
		$(this).closest('.popupbody').hide();
		$("#dialog-7").show();
		var str = $('#remove_description').html();
		var dom = str.split('|').join('');
		$('#remove_description').html(dom);
		var check = [];
		var checkbox = '';

		$('#remove_description').contents().each(function(){
		    if(this.nodeType == 3){
		    	dat = this.data;
		    	text = $.trim(dat);
		        if( text !=''){
		        	checkbox += "<h2 style='display: none'><input type='checkbox' class='remove_link_section' name='remove_link_section' value='"+text+"' disabled><input type='hidden' class='remove_link_section_hidden' name='remove_link_section_hidden' value='0'><label for='remove_link_section'>"+text+"</label></h2>";
		        }
		    }else{
		    	if(this.innerHTML !=''){
		    		outer = this.outerHTML;
		    		outer = $.trim(outer);
		    		if($(outer).filter('a').length > 0) display_none = ''; else display_none ='display:none';
		    		checkbox += "<h2 style='"+display_none+"'><input type='checkbox' class='remove_link_section' name='remove_link_section' value='"+outer+"'><input type='hidden' class='remove_link_section_hidden' name='remove_link_section_hidden' value='1'><label for='remove_link_section'>"+outer+"</label></h2>";
		    	}	
		    }
		});
		$('#remove_section').show();
		$('#remove_forum_link_choice').html(checkbox);
		$('#remove_notification').html('');
		if(checkbox == ''){
			$('#remove_notification').html('<b>There is no section to remove.</b>');
			$('#remove_notification').css('color','red');
			$('#remove_notification').show();
			$('#remove_section').hide();
		}
		checkbox_check();
		$("#dialog-7").dialog("open");

	});
	/*End:- Menu Remove Subsection From Section */

	/*Start:- Remove Section Submit */
	$('#remove_section').click(function(e){
		e.preventDefault();
		var any_checked = false;
		$('input:checked[name=remove_link_section]').each(function(){
			any_checked = true;
	    });
	    if(any_checked){
			var arr=[];
			anchor = '';
			var ch = ' | ';
			var nw = '<br>';
			var ending_p = '</p>';
			remove_counter = 0;
			new_add = ''; 
			flag = 0;
			booll = 0;
		    $('input[name=remove_link_section]:not(:checked)').each(function(){
			    var content = $(this).val();
			    content = content.toString();
			    //alert(content);
			    //alert($(content).filter('a').length);
			    if(isAnchor(content)) booll = 2;
			    else booll = 1;
			    if((flag == 1 || booll == 1) && flag != 0) new_add = nw;
			    if(flag == 2 && booll == 2) new_add = ch;
			    if(remove_counter == 0 && booll == 1) new_add = ending_p;
			    anchor += new_add+content;
			    flag = booll;
			    remove_counter++;
		    });
		    //return false;
		    $('#remove_description_field').val(anchor);
	    	$('#remove_notification').html('<b>Please wait ...<b>');
			$('#remove_notification').css('color','black');
			$('#remove_notification').show();
	    	var postdata = $('#remove_sections_form').serialize();
		    var doo = 'removesections';
		    var url = "../ajax.php?"+SESSIONURL+"securitytoken="+SECURITYTOKEN+"&do="+doo;
			$.ajax({
				type: "POST",
				cache: false,
				url: url,
				data : postdata,
		        async: false,
		        dataType: 'xml',
				success: function(response){	
					var message = $(response).find('message').first().text();
					$('#remove_notification').html('<b>'+message+'</b>');
					$('#remove_notification').css('color','green');
					$('#remove_notification').show();
					$('#remove_description').html(anchor);
					var head = $('#pagetitle').children('h1')[0].outerHTML;
					$('#pagetitle').html(head+'<p class="description">'+anchor+'</p>');
					$('input:checked[name=remove_link_section]').each(function(){
						$(this).closest('h2').empty();
				    });
				},
	            error: function(ex){
	                $('#remove_notification').html('<b>Server Error.</b>');
					$('#remove_notification').css('color','red');
					$('#remove_notification').show();
	            }
			});
			//$('#update_section').show();
		}else{
			$('#remove_notification').html("<b>"+$('#please_check_at_least_one_subsection_to_remove').text()+"</b>");
			$('#remove_notification').css('color','red');
			$('#remove_notification').show();
		}
	});
	/*End:- Remove Section Submit */
});

// A string is anchor or not
function isAnchor(str){
    return /^\<a.*\>.*\<\/a\>/i.test(str);
}

function checkbox_check(){
	$('.remove_link_section').click(function(){
		if($(this).is(':checked') && $(this).next().val() == 0){ // If text contents, It should not be deleted
			$(this).prop('checked', false);
			$(this).prop('disabled', true);
		}
	});
}

function getData(search_param,search_value,callback)
{
	sessionStorage.description = '';
	var doo ='';
	var column_name = '';
	doo = 'forumsearch';
	var xmlhttp = new XMLHttpRequest();
	var url = "../ajax.php?"+SESSIONURL+"securitytoken="+SECURITYTOKEN+"&do="+doo+"&search_value="+search_value;
	xmlhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			//var myArr = JSON.parse(this.response);
			parser = new DOMParser();
			xmlDoc = parser.parseFromString(this.response,"text/xml");
			vall = '';
			if(xmlDoc.getElementsByTagName("description")[0].innerHTML !='')
				{sessionStorage.description = xmlDoc.getElementsByTagName("description")[0].childNodes[0].nodeValue;}
			if(xmlDoc.getElementsByTagName("message")[0].innerHTML !='')
				{vall = xmlDoc.getElementsByTagName("message")[0].childNodes[0].nodeValue;}
			callback(vall);
		}
	};
	xmlhttp.open("GET", url, false);
	xmlhttp.send();
}

function autocomplete(inp,id) {
	var currentFocus;
	var arr = [];
	//['input', 'click'].forEach(event =>
	inp.addEventListener('input', function(e) {
		//if(inp.value.length > 1){
		getData(id,inp.value,function(arr1){
			arr[0] = arr1;
		});
		var a, b, i, val = this.value;
		closeAllLists();
		if (!val) { return false;}
		currentFocus = -1;
		a = document.createElement("DIV");
		a.setAttribute("id", this.id + "autocomplete-list");
		a.setAttribute("class", "autocomplete-items");
		this.parentNode.appendChild(a);
		for (i = 0; i < arr.length; i++) {
			if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
				b = document.createElement("DIV");
				b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
				b.innerHTML += arr[i].substr(val.length);
				b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
				b.addEventListener("click", function(e) {
				  inp.value = this.getElementsByTagName("input")[0].value;
				  closeAllLists();
				});
				a.appendChild(b);
			}
		}//}
	}); //)
	inp.addEventListener("keydown", function(e) {
		var x = document.getElementById(this.id + "autocomplete-list");
		if (x) x = x.getElementsByTagName("div");
		if (e.keyCode == 40) {
		currentFocus++;
		addActive(x);
		} else if (e.keyCode == 38) { //up
		currentFocus--;
		addActive(x);
		} else if (e.keyCode == 13) {
			e.preventDefault();
			if (currentFocus > -1) {
			  if (x) x[currentFocus].click();
			}
		}
	});
	function addActive(x) {
		if (!x) return false;
		removeActive(x);
		if (currentFocus >= x.length) currentFocus = 0;
		if (currentFocus < 0) currentFocus = (x.length - 1);
		x[currentFocus].classList.add("autocomplete-active");
	}
	function removeActive(x) {
		for (var i = 0; i < x.length; i++) {
			x[i].classList.remove("autocomplete-active");
		}
	}
	function closeAllLists(elmnt) {
		var x = document.getElementsByClassName("autocomplete-items");
		for (var i = 0; i < x.length; i++) {
			if (elmnt != x[i] && elmnt != inp) {
				x[i].parentNode.removeChild(x[i]);
			}
		}
	}
	document.addEventListener("click", function (e) {
		closeAllLists(e.target);
	});
}
autocomplete(document.getElementById("sectionname"),"sectionname");
