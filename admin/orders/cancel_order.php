<?php
include "../../connect.php";
$orderid = filterRequest("orderid");
$userid = filterRequest("userid");
$message = filterRequest("message");

// get the user data to get the token

$sql = "update items set items_qty = items_qty + (select cart_amount from cart where cart_orderid = $orderid and items.items_id = cart_itemid) where items.items_id in (select cart_itemid  from cart where cart_orderid = $orderid)";
$stmt = $con->prepare($sql);
$stmt -> execute();



$stmt = $con->prepare("select users_token from users where users_id = $userid");
$stmt->execute();
$token = $stmt->fetchColumn();

 
deleteData("orders", "orders_id = $orderid");


$title = "We are so sorry";
$body = "Your order has been canceled!";

$insertData = array(
    "notifications_title" => $title,
    "notifications_body" => $message,
    "notifications_userid" => $userid,
);

insertData("notifications", $insertData, false);
sendFCM_usingToken($title, $body, $token,array("orders_id" => $orderid));
