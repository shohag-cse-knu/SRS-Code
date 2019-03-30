function printpage()
{
    var pp = window.open();

    pp.document.writeln('<HTML><HEAD><title></title>')
    pp.document.writeln('<style type="text/css">@import url("<?=base_url()?>js/style.css");</style>')
    pp.document.writeln('<style type="text/css"  media="print"> #PRINT, #CLOSE, #mssgg {visibility:hidden;}</style><base target="_self"></HEAD>')

    pp.document.writeln('<body  style="font-family:Verdana;font-size:8pt;background-color:#FFFFFF" bottomMargin="10" leftMargin="10" topMargin="10" rightMargin="10"><div id="border_area" style="width:1123px;margin:0 auto;border:2px dotted #CCCCCC;position:relative;"><div id="print_close" style="width:140px;position:absolute;right:10px;"><div style="float:right;margin-top:11px;"><img ID="CLOSE" alt="CLOSE" src="<?=base_url()?>images/close.png" onclick="window.close();"></div>&nbsp;<div style="margin-top:6px;float:right;"><img ID="PRINT" alt="print-preview" src="<?=base_url()?>images/Print.png" onclick="javascript:location.reload(true);window.print();"></div><br><span id="print_portrait" style="float:right;color:green;">Print in Landscape Page</span></div>');

    pp.document.writeln('<table style="width:100%; text-align:center; font-weight:bold;font-size:9pt;"><tr><td><span style="font-size:10pt;font-weight:bold;">The City Bank Ltd.</span><br /><span style="font-size:8pt;font-weight:normal;">Credit Administration Division</span><br /><span style="font-size:8pt;font-weight:normal;"><u>Customer Information</u></span><br><span style="font-size:8pt;font-weight:normal;">Date:<? echo date('d M, Y') ?></span></td></tr><tr><td align=center><table style="width:98%;font-size:10pt;">');

    pp.document.writeln('<tr><td colspan="2" align="left"><strong>Customer Management</strong></td></tr>');
    pp.document.writeln(document.getElementById('previewTab1').innerHTML);
    
    <? $i=1; foreach($cust_odp_info as $odp_info){ ?>
		pp.document.writeln('<tr><td colspan="2" align="left"><br/><strong>Owner/Director/Partner <?=$i?></strong></td></tr>');
    	pp.document.writeln(document.getElementById('previewTab2<?=$i?>').innerHTML);
    <? $i++; } ?>

    pp.document.writeln('</table></td></tr>');
    pp.document.writeln('</table></div></body></HTML>');

  }