<?php
$source = array( 
    array("1" => 5), 
    array("2" => 1525),
    array("2" => 12365), 
    array("2" => 34234), 
    array("3" => 324234)
);
$result = array();
foreach($source as $item) {
    $artist = key($item);
    echo $artist;echo "<br>";
    $album = current($item);
    echo $album;echo "<br>";echo "<br>";
    if(!isset($result[$artist])) {
        $result[$artist] = array();
    }
    $result[$artist][] = $album;
}
echo "<pre>";
print_r($result);
?>