<?php
include "../../../connect.php";
$itemid = filterRequest("itemid");

 
getAlldata("reviews","item_id = $itemid");


?>