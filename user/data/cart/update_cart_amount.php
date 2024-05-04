<?php
include "../../../connect.php";
$cartid = filterRequest("cartid");
$amount = filterRequest("amount");

if($amount > 0)
{
    $data = array(
        "cart_amount" => $amount
    );
    
    updateData("cart",$data,"cart_id = $cartid");
}
else
{
    deleteData("cart","cart_id = $cartid");
}


?>