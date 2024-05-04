<?php
include "../../connect.php";
$orderid = filterRequest("orderid");
$userid = filterRequest("userid");
$orderType = filterRequest("orderType");

 
$updateData = array(
    // the order is being prepared for the deliverrer to come take it
    "orders_statusid" => 3
);

updateData("orders", $updateData, "orders_id = $orderid");

// if delivery
if($orderType == 1)
{

    
    $title = "Order $orderid";
    $body = "There is an order available for delivering!";
    
    
    // this topic will be listened by the deliverers on their on app
    sendFCM_usingTopic($title, $body, "preparingOrders",array("orderid" => $orderid));
    
}
// else receive
else
{

    $stmt = $con->prepare("select users_token from users where users_id = $userid");
    $stmt->execute();
    $token = $stmt->fetchColumn();

    $title = "Order $orderid";
    $body = "Your order is ready for receiving!";
    
    
    // this topic will be listened by the deliverers on their on app
    sendFCM_usingToken($title, $body, $token,array("orderid" => $orderid));
}