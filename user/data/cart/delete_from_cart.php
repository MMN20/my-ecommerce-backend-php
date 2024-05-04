<?php
include "../../../connect.php";
$itemid = filterRequest("itemid");
$userid = filterRequest("userid");

// deleteData("cart","cart_itemid = $itemid and cart_userid = $userid and cart_orderid is null");

$stmt = $con->prepare("delete from cart where cart_itemid = $itemid and cart_userid = $userid and cart_orderid is null");
$stmt->execute();
if($stmt->rowCount() > 0)
{
    printSuccess();
}
else
{
    printFailure();
}

?>