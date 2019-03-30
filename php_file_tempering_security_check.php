<?
/* File tempering check*/
$filename = $row->docs_file_name;
$uploaded_time = $row->e_dt;
$folder_name = $row->folder_name;

$file_path = getcwd().DIRECTORY_SEPARATOR.$folder_name.'/'.$filename;
//echo $file_path;
$Msg = "";
if (file_exists($file_path)) {
	$file_modification_time = date("Y-m-d H:i:s",filemtime("$file_path"));
	if(strtotime($file_modification_time) != strtotime($uploaded_time))
		{$Msg = "tempered";}
}else{
	$Msg = "File missing";
}
?>