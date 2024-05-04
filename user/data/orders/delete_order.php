<?php
include "../../../connect.php";
$orderid = filterRequest("orderid");

$sql = "update items set items_qty = items_qty + (select cart_amount from cart where cart_orderid = $orderid and items.items_id = cart_itemid) where items.items_id in (select cart_itemid  from cart where cart_orderid = $orderid)";
$stmt = $con->prepare($sql);
$stmt -> execute();


deleteData("orders","orders_id = $orderid and orders_statusid = 1");
