<?php
include "../../../connect.php";
$userid = filterRequest("userid");
$addressid = filterRequest("addressid");
$orderTypeID = filterRequest("orderTypeID"); // delivery or receive
$deliveryPrice = filterRequest("deliveryPrice");
$couponID = filterRequest("couponID");
$paymentMethod = filterRequest("paymentMethod");


if ($couponID == 0) {
    $couponID = null; // if null then no used coupon
}

if($addressid == 0)
{
    $addressid = null;
}

$stmt = $con->prepare("
select sum(cartFullPrice) as fullPrice from
(
select (priceAfterDiscount * cart_amount) as cartFullPrice from (select * from cart where cart.cart_userid = $userid and cart_orderid is null) as cart inner join itemsview on itemsview.items_id = cart.cart_itemid
) as data
");

$stmt->execute();
$fullPrice = $stmt->fetchColumn();


$data = [
    "orders_usersid" => $userid,
    "orders_addressid" => $addressid,
    "orders_typeid" => $orderTypeID,
    "orders_deliveryprice" => $deliveryPrice,
    "orders_couponid" => $couponID,
    "orders_paymentmethodid" => $paymentMethod,
    "fullPrice" => $fullPrice
];


$count =  insertData("orders", $data, false);

if ($count > 0) {
    $stmt = $con->prepare("select last_insert_id()");
    $stmt->execute();

    $newID = $stmt->fetchColumn();
    
    $updateData = [
        "cart_orderid" => $newID
    ];
    updateData("cart", $updateData, "cart_userid  = $userid and cart_orderid is null");

    $sql = "update items set items_qty = items_qty - (select cart_amount from cart where cart_orderid = $newID and items.items_id = cart_itemid) where items.items_id in (select cart_itemid  from cart where cart_orderid = $newID)";
    $stmt = $con->prepare($sql);
    $stmt -> execute();


    // send a notification to the admin about the new order
    $title = "Order $newID";
    $body = "There is a new order";
    sendFCM_usingTopic($title, $body, "adminOrders",array("orderid" => $newID));
} else {
    printFailure();
}
