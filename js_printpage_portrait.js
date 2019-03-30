function printpage(printarea)
		{			
			var pp = window.open();
            var divElements = document.getElementById(printarea).innerHTML;

            pp.document.writeln('<!DOCTYPE html><html><head>');
            pp.document.writeln('<style type="text/css"  media="print">#border_area{border:none;} #border_close{visibility:hidden;} </style>
			<base target="_self">
			</head>
			<body>
				<div id="border_area" style="width:794px;margin:0 auto;border:2px dotted #CCCCCC;position:relative;">
					<div id="print_close" style="width:135px;position:absolute;right:10px;">
						<div style="float:right;margin-top:11px;">
							<img ID="CLOSE" alt="CLOSE" src="<?=base_url()?>images/close.png" onclick="window.close();">
						</div>&nbsp;
						<div style="margin-top:6px;float:right;">
							<img ID="PRINT" alt="print-preview" src="<?=base_url()?>images/Print.png" onclick="javascript:location.reload(true);window.print();">
						</div><br>
						<span id="print_portrait" style="float:right;color:green;">Print in Portrait Page</span>
					</div>
					<table style="width:100%; font-size:11pt;">
						<tr>
							<td style="text-align: center;">
								<span style="font-size:12pt;font-weight:bold;">The City Bank Ltd.</span><br />
								<span style="font-size:9pt;font-weight:normal;">Credit Administration Division</span><br>
								<span>Report Generation Date: <?=date("d M, Y");?></span>
							</td>
						</tr>
					<tr>
						<td>');
            pp.document.writeln(divElements);
            pp.document.writeln('</td></tr></div></body></html>');
			jQuery("#user_preview").jqxWindow('close');
		}	