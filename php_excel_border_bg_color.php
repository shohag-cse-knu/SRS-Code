
<?php
//bgcolor
$objPHPExcel->getActiveSheet()->getStyle('A'.$rowNumber.':AD'.$rowNumber)->getFill()
->applyFromArray(array('type' => PHPExcel_Style_Fill::FILL_SOLID,
'startcolor' => array('rgb' => 'FFC000')
));

//border
$styleArray = array(
			'borders' => array(
				'allborders' => array(
				'style' => PHPExcel_Style_Border::BORDER_THIN
				)
			)
 );
$objPHPExcel->getActiveSheet()->getStyle('A3:AD3')->applyFromArray($styleArray);

?>