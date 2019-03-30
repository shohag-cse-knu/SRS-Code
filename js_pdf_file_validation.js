var fsize = jQuery('#cov_app_file<?=$i?>')[0].files[0].size;
var ftype = jQuery('#cov_app_file<?=$i?>')[0].files[0].type;
// alert(fsize+" "+ftype);
if(fsize>(1048576*3) || ftype != 'application/pdf') //do something if file size more than 1 mb (1048576)
{
  return false;
}else
{
	return true;
}