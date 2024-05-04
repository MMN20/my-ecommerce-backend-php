<?php
include "../../connect.php";
$deliveryid = filterRequest("deliveryid");
// the orders that are prepared and not taken by any deliverer

getAlldata("ordersview inner join addresses on orders_addressid = addresses.addresses_id","orders_deliveryid = $deliveryid and orders_statusid < 5");

?>

