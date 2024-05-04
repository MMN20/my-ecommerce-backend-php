<?php
include "../../connect.php";
$orderid = filterRequest("orderid");
$userid = filterRequest("userid");

// get the user data to get the token

$stmt = $con->prepare("select users_token from users where users_id = $userid");
$stmt->execute();
$token = $stmt->fetchColumn();

$updateData = array(
    "orders_statusid" => 2
);

updateData("orders", $updateData, "orders_id = $orderid");


$title = "Order $orderid Update";
$body = "Your order has been accepted!";

$insertData = array(
    "notifications_title" => $title,
    "notifications_body" => $body,
    "notifications_userid" => $userid,
);
insertData("notifications", $insertData, false);

sendFCM_usingToken($title, $body, $token,array("orderid" => $orderid));
