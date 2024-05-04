<?php
include "../../connect.php";
$orderid = filterRequest("orderid");
$userid = filterRequest("userid");

 
$updateData = array(
    "orders_statusid" => 2
);

$count =  updateData("orders", $updateData, "orders_id = $orderid",false);

if($count > 0)
{
    printSuccess();
    $title = "Order $orderid";
    $body = "The order was cancelled!";

    // this topic will be listened by the deliverers on their on app
    sendFCM_usingTopic($title, $body, "preparingOrders",array("orderid" => $orderid));
}
else
{
    printFailure();
}