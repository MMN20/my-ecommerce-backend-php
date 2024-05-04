<?php
include "../../connect.php";
include "../upload_files.php";

$catName = filterRequest("catName");
$catDesc = filterRequest("catDesc");


$fileName = uploadAFile("image","../../upload/categories");

if($fileName != false)
{
    $insertData = array(
        "cat_name" => $catName,
        "cat_desc" => $catDesc,
        "cat_imageUrl" => $fileName
    );

    insertData("categories",$insertData,false);

    $lastId = $con->lastInsertId();
    
    echo json_encode(
        array(
            "status" => "success",
            "image" => $fileName,
            "newID" => $lastId,
        )
    );
    
}
else
{
    printFailure("File error");

}



