 $link_style_array = [
  		'font'  => [
    	'color' => ['rgb' => 'cc0000'],
    	'underline' => 'single'
 		 ]
		];


$objPHPExcel->getActiveSheet()->getStyle("A8")->applyFromArray($link_style_array);