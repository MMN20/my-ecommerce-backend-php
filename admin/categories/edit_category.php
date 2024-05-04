<?php
include "../../connect.php";
include "../upload_files.php";

$catID = filterRequest("catid");
$catName = filterRequest("catName");
$catDesc = filterRequest("catDesc");


$fileName = uploadAFile("image","../../upload/categories");


if($fileName != false)
{
    $stmt = $con->prepare("select cat_imageUrl from categories where cat_id = $catID");
    $stmt->execute();
    $oldFileName = $stmt->fetchColumn();
    

    $updateData = array(
        "cat_name" => $catName,
        "cat_desc" => $catDesc,
        "cat_imageUrl" => $fileName,
        
    );
}
else
{
    $updatData = array(
        "cat_name" => $catName,
        "cat_desc" => $catDesc,
    );
}

$count = updateData("categories",$updateData,"cat_id = $catID",false);

if($count > 0)
{
    if($fileName != false)
    {
        unlink("../../upload/$oldFileName");
        echo json_encode(
            array(
                "status" => "success",
                "image" => $fileName
            )
        );
    }
    else
    {
        echo json_encode(
            array(
                "status" => "success",
             )
        );
    }
}
else
{   
    printFailure();
}

