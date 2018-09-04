<?
$dt1 = strtotime(date("Y-m-d H:i:s"))*1000;
$file1 = "rep_".$query->temporary_application_tracking_number."_".$dt1.".txt";
$dir ="uploads/trademark/tm1/";
file_put_contents("$dir/$file1" , $query->nice_class_description);
?>