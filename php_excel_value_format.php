$objPHPExcel->getActiveSheet()->setCellValueExplicit('B'.$rowNumber, $row['cust_full_id'], PHPExcel_Cell_DataType::TYPE_STRING);

//showing actual value rather than scientific value					
$objPHPExcel->getActiveSheet()->getStyle('G'.$rowNumber)->getNumberFormat()->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_NUMBER);