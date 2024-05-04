<?php
include "../../connect.php";
$deliveryid = filterRequest("deliveryid");
$orderid = filterRequest("orderid");
// the orders that are prepared and not taken by any deliverer

$maxAcceptedOrders = 5;

$sql = "SELECT count(orders_id) as count FROM orders WHERE orders.orders_deliveryid = $deliveryid";

$stmt = $con->prepare($sql);
$stmt->execute();
$count = $stmt->fetchColumn();

if ($count >= $maxAcceptedOrders) {
    printFailure("5");
} else {
    $data = array(
        "orders_deliveryid" => $deliveryid
    );

    updateData("orders", $data, "orders_id  = $orderid");
}
