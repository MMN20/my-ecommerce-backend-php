<?php

include "../../connect.php";
$orderid = filterRequest("orderid");

$sql = "SELECT itemsview.*, cart_id, cart_amount,cart.cart_orderid FROM 
itemsview
inner join (select * from cart where cart_orderid = $orderid) as cart on cart_itemid = itemsview.items_id";

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