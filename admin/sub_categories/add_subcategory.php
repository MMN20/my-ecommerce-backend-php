<?php
include "../../connect.php";
include "../upload_files.php";

$catid = filterRequest("catid");
$subcatName = filterRequest("subcatName");
$subcatDesc = filterRequest("subcatDesc");



$insertData = array(
    "subcat_name" => $subcatName,
    "subcat_desc" => $subcatDesc,
    "cat_id" => $catid
);

$count  = insertData("subcategories", $insertData, false);

if ($count > 0) {

    $lastId = $con->lastInsertId();

    echo json_encode(
        array(
            "status" => "success",
            "newID" => $lastId,
        )
    );
} else {
    printFailure();
}
