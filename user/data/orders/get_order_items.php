<?php
include "../../../connect.php";
$orderid = filterRequest("orderid");
$userid = filterRequest("userid");

$sql = "SELECT itemsview.*, cart_id, cart_amount as ordered_amount, if(inCart is null, 0, inCart) as cart_amount FROM 
itemsview
inner join (select * from cart where cart_orderid = $orderid) as cart on cart_itemid = itemsview.items_id 
left join (select cart_itemid as cart2_itemid, cart_amount as inCart from cart where cart_userid = $userid and cart_orderid is null) as cart2 on cart2_itemid = cart_itemid";

$stmt = $con->prepare($sql);

$stmt->execute();

if($stmt->rowCount() > 0)
{
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    echo json_encode(
        array(
            "status" => "success",
            "data" => $data
        )
    );
}
else
{
    echo json_encode(
        array(
            "status" => "failure",
        )
    );
}



?>