<?php
include "../../connect.php";

$data = json_decode($_POST['data'],true);

$id = $data['id'];
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

 updateData("items",$insertData,"items_id = $id",false);

deleteData("specifications","item_id = $id",false);

$sql = "";

foreach($data['specs'] as $key => $spec)
{
    $name = $spec['name'];
    $value = $spec['value'];
    $sql  = $sql . "insert into specifications (specifications_name,specifications_value,item_id) values ('$name','$value',$id); ";
}

 
$stmt = $con->prepare($sql);
$stmt->execute();
 

printSuccess();

