<?php
if(isset($_GET['tag'])){
 $id = $_GET['tag'];
  include_once "connect_to_mysql.php";
  $sql = mysql_query("SELECT * FROM document WHERE id=$id LIMIT 1");
  if(mysql_num_rows($sql) > 0){
    while($row=mysql_fetch_assoc($sql)){
     $filename = $row['document_name'];
     break;
   }
  $pieces = explode(".",$filename);
  $filename1 = $pieces[0];
  $format = $pieces[1]; 
  $file = "uploaded/document/".$filename ;
  if($pieces[1] == "pdf"){
  header('Content-type: application/pdf');
}else if($pieces[1] == "docx"){
  header('Content-type: application/msword');
}
  header('Content-Disposition: inline; filename="' . $file . '"');
  header('Content-Transfer-Encoding: binary');
  header("Content-Length: " . filesize($file));
  @readfile($file);
}
// Second Step used in eDoc OBL safe_out_model
$UploadDirectory	= './uploads/';
$FileInput = 'temp_safe_out_app_file';
$temp_safe_out_app_file = '';
if(!empty($_FILES) && $_FILES[$FileInput]['name'] !="")
{
	$File_Name          = strtolower($_FILES[$FileInput]['name']);
	$Only_File_Name		= explode(".", $File_Name);
	$File_Ext           = substr($File_Name, strrpos($File_Name, '.')); //get file extention
	$NewFileName 		= "t_safe_".$cust_id."_".$seg_id."_".time().$File_Ext; //new file name	
	if(move_uploaded_file($_FILES[$FileInput]['tmp_name'], $UploadDirectory.$NewFileName))
	{
		$temp_safe_out_app_file = $NewFileName;
	}
}
}
?>