<?php
// this is for the ItemsPage


include "../../connect.php";
$catid = filterRequest("catid");
$subcats = filterRequest("subcats");
$userid = filterRequest("userid");

$data = array();
// first we get all the categories that are assciated with the current category


$query = "select * from subcategories where cat_id = $catid";

$stmt = $con->prepare($query);
$stmt->execute();
$data['subCategories'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

// then we get all the items that are associated with the current category
if ($subcats == 'all') {
    $query = "select itemsview.*, if(favorite_itemid is not null,1,0) as favorite, if(cart.cart_amount is not null,cart.cart_amount,0) as cart_amount from itemsview 
    left join (select favorite_itemid from favorite where favorite_userid = $userid) as fav on favorite_itemid = itemsview.items_id
    left join (select cart_itemid, cart_amount from cart where cart_userid = $userid and cart_orderid is null) as cart on cart_itemid = items_id 
    where items_subcat_id in (select subcat_id from subcategories where cat_id = $catid) and isActive = 1";
} else {
    // if the user needed a certain subcategories only
    $query = "select itemsview.*, if(favorite_itemid is not null,1,0) as favorite, if(cart.cart_amount is not null,cart.cart_amount,0) as cart_amount from itemsview
    left join (select favorite_itemid from favorite where favorite_userid = $userid) as fav on favorite_itemid = itemsview.items_id 
    left join (select cart_itemid, cart_amount from cart where cart_userid = $userid and cart_orderid is null) as cart on cart_itemid = items_id 
    where items_subcat_id in ($subcats) and isActive = 1";
}

$stmt = $con->prepare($query);
$stmt->execute();
$data['items'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode(array(
    "status" => "success",
    "data" => $data
));

// create the favorite for every item for the current user