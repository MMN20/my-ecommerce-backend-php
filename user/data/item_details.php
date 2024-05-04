<?php
include "../../connect.php";
$itemid = filterRequest("itemid");
$userid = filterRequest("userid");

$data = array();

$data['specs'] = getAlldata("specifications","item_id = $itemid",false)['data'];

$data['images'] = getAlldata("item_images","item_id = $itemid",false)['data'];

$data['reviews'] = getAlldata("reviews","item_id = $itemid and user_id != $userid limit 3",false)['data'];

$stmt = $con->prepare("select * from reviews where item_id = $itemid and user_id = $userid");
$stmt->execute();

if($stmt->rowCount() > 0)
{
 $data['userReview'] = $stmt->fetch(PDO::FETCH_ASSOC);
}
else
{
    $data['userReview'] = "none";
}

echo json_encode(array("status" => "success","data" => $data));

?>