<?php
include "../../connect.php";

$subcatid = filterRequest("subcatid");
$subcatName = filterRequest("subcatName");
$subcatDesc = filterRequest("subcatDesc");


$updateData = array(
    "subcat_name" => $subcatName,
    "subcat_desc" => $subcatDesc,
);

updateData("subcategories", $updateData, "subcat_id  = $subcatid");
