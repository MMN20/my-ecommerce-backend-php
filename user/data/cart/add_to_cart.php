<?php
include "../../../connect.php";
$itemid = filterRequest("itemid");
$userid = filterRequest("userid");
$amount = filterRequest("amount");

$result = getData("cart","cart_itemid = $itemid and cart_userid = $userid and cart_orderid is null",false);
if($result > 0)
{
    // the cart exists so just update the amount
    updateData("cart",array("cart_amount" => $amount),"cart_itemid = $itemid and cart_userid = $userid and cart_orderid is null");
}
else
{
    // the cart does not exist so add it
    $data = array(
        "cart_itemid" => $itemid,
        "cart_userid" => $userid,
        "cart_amount" => $amount,
        "cart_orderid" => null
    );
    insertData("cart",$data);
}

?>