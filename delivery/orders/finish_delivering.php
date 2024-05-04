<?php
include "../../connect.php";
$orderid = filterRequest("orderid");
// the orders that are prepared and not taken by any deliverer

$data = array(
    "orders_statusid" => 5
);

updateData("orders", $data, "orders_id  = $orderid");
