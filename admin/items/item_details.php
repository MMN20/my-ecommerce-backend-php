<?php
include "../../connect.php";
$itemid = filterRequest("itemid");

$data = array();

$data['specs'] = getAlldata("specifications","item_id = $itemid",false)['data'];

$data['images'] = getAlldata("item_images","item_id = $itemid",false)['data'];

$stmt = $con->prepare("select * from (select * from items where items_id = $itemid) as items 
inner join subcategories on items_subcat_id  = subcategories.subcat_id  
inner join categories on subcategories.cat_id = categories.cat_id ");

$stmt->execute();

$data['cat'] = $stmt->fetch(PDO::FETCH_ASSOC);
 
echo json_encode(array("status" => "success","data" => $data));

?>