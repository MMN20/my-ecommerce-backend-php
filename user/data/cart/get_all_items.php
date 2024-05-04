<?php
include "../../../connect.php";
$userid = filterRequest("userid");

getAlldata("itemsview inner join (select cart_itemid, cart_amount, cart_id from cart where cart_userid  = $userid and cart_orderid is null) as cart on items_id = cart.cart_itemid");

?>