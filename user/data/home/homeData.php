<?php
include "../../../connect.php";
$userid = filterRequest("userid");

// get Promotions, Top selling, Offers
$data = array();

// promotions
$stmt = $con->prepare("select * from Promotions");
$stmt-> execute();
$data['promotions'] = $stmt-> fetchAll(PDO::FETCH_ASSOC);

// categories
$stmt = $con->prepare("select * from categories");
$stmt-> execute();
$data['categories'] = $stmt-> fetchAll(PDO::FETCH_ASSOC);

// offers
$stmt = $con->prepare("select itemsview.*, if(favorite_itemid is not null,1,0) as favorite , if(cart.cart_amount is not null,cart.cart_amount,0) as cart_amount from itemsview 
left join (select * from favorite where favorite_userid = $userid) as favorite on itemsview.items_id = favorite.favorite_itemid
left join (select cart_itemid, cart_amount from cart where cart_userid = $userid and cart_orderid is null) as cart on cart_itemid = items_id 
where discount > 0 and itemsview.isActive = 1");
$stmt-> execute();
$data['offers'] = $stmt-> fetchAll(PDO::FETCH_ASSOC);

echo json_encode($data);

?>