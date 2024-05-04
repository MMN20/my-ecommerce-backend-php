<?php
include "../../../connect.php";
$userid = filterRequest("userid");
$name = filterRequest("name");
$desc = filterRequest("desc");
$lat = filterRequest("lat");
$long = filterRequest("long");

$data = array(
    "addresses_userid" => $userid,
    "addresses_name" => $name,
    "addresses_lat" => $lat,
    "addresses_long" => $long,
    "addresses_desc" => $desc,
);

insertData("addresses",$data,false);

$stmt = $con->prepare("select last_insert_id()");
$stmt->execute();

$newID = $stmt->fetchColumn();

$json = array(
    "status" => "success",
    "newID" => $newID
);

echo json_encode($json);

?>