<?php
include "../../connect.php";
include "../upload_files.php";

$data = json_decode($_POST['data'],true);

$name = $data["name"];
$desc = $data["desc"] ;
$price = $data["price"] ;
$qty = $data["qty"];
$isActive = $data["isActive"];
$discount = $data["discount"];
$subcatid = $data["subcatid"];


// in JSON format
 
$insertData = array(
    "items_name" => $name,
    "items_desc" => $desc,
    "items_price" => $price,
    "items_qty" => $qty,
    "isActive" => $isActive,
    "discount" => $discount,
    "items_subcat_id " => $subcatid,
);

insertData("items",$insertData,false);

$itemId = $con->lastInsertId();

 
    $sql = "";
    
    foreach($data['specs'] as $key => $spec)
    {
        $name = $spec['name'];
        $value = $spec['value'];
        $sql  = $sql . "insert into specifications (specifications_name,specifications_value,item_id) values ('$name','$value',$itemId); ";
    }
        
    if($sql != "")
    {
        $stmt = $con->prepare($sql);
        $stmt->execute();
    }
        
$sql = "";
 
foreach($_FILES as $key => $value)
{
    $name = uploadAFile($key,"../../upload/items");
    $sql  = $sql . "insert into item_images (imageUrl,item_id) values ('$name',$itemId); ";
}

if($sql != "")
{
    $stmt = $con->prepare($sql);
    $stmt->execute();
}

printSuccess();

