$arr = array("101","102","103","104","105","102");
$replace = "101,102,103";
$arr_replace = explode(",", $replace);
$replacement = array();
for($c=0; $c < count($arr_replace); $c++){
    $replacement[$arr_replace[$c]] = "301";
}
$add = array_map(function ($v) use ($replacement) {
    return isset($replacement[$v]) ? $replacement[$v] : $v;
}, $arr);
$add = array_unique($add);
$str_new = implode(",", $add);
echo $str_new;