<?php
include "../../connect.php";
// the orders that are prepared and not taken by any deliverer
$orderid = filterRequest("orderid");
$userid = filterRequest("userid");


$data = array(
    "orders_statusid" => 4
);

$count =  updateData("orders", $data, "orders_id = $orderid", false);

if ($count > 0) {


    $stmt = $con->prepare("select users_token from users where users_id = $userid");
    $stmt->execute();
    $token = $stmt->fetchColumn();

    sendFCM_usingToken("Order update", "Your order ($orderid) is on the way!", $token, array(
        "orderid" => $orderid
    ));
    printSuccess();
}
else
{
    printFailure();
}


