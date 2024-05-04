<?php
include "../../connect.php";
$coupon = filterRequest("coupon");

$stmt = $con->prepare("select coupons_amount, coupons_id from coupons where coupons_name = '$coupon' and coupons_active = 1 and NOW() < expire_date");
$stmt->execute();

if($stmt->rowCount() > 0)
{
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    echo json_encode(array(
        "status" => "success",
        "amount" => $data['coupons_amount'],
        "id" => $data['coupons_id']
    )); 
}
else
{
    echo json_encode(array(
        "status" => "failure",
    )); 
}



?>