<?php
include "../../connect.php";
$userid = filterRequest("userid");
$query = "select itemsview.*,if(favorite_itemid is not null,1,0) as favorite, if(cart.cart_amount is not null,cart.cart_amount,0) as cart_amount from itemsview inner join (select favorite_itemid from favorite where favorite_userid = $userid) as favorite on items_id = favorite_itemid
left join (select cart_itemid, cart_amount from cart where cart_userid = $userid and cart_orderid is null) as cart on cart_itemid = items_id where itemsview.isActive = 1
";
$stmt = $con->prepare($query);
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode(array("status" => "success","data" => $data));

?>