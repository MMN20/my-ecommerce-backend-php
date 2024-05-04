<?php
include "../../connect.php";
// the orders that are prepared and not taken by any deliverer

getAlldata("ordersview inner join addresses on orders_addressid = addresses.addresses_id","orders_statusid = 3 and orders_addressid is not null and orders_deliveryid is null");
?>