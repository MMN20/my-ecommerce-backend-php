<?php
include "../../connect.php";
$currentIndex = filterRequest("currentIndex");


$sql = "select count(orders_id) as ordersCount from orders where orders_statusid in (3,4,5,6)";
$stmt = $con->prepare($sql);
$stmt->execute();

$ordersCount = $stmt->fetchColumn();


$sql = "select ordersview.*,addresses.addresses_lat,addresses.addresses_long,addresses.addresses_desc,coupons.coupons_name from ordersview left join addresses on ordersview.orders_addressid = addresses.addresses_id
left join coupons on ordersview.orders_couponid = coupons.coupons_id where orders_statusid in (3,4,5,6) and orders_id > $currentIndex order by orders_id asc limit 3";
$stmt = $con->prepare($sql);
$stmt->execute();

if ($stmt->rowCount() > 0) {
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode(
        array(
            "status" => "success",
            "data" => $data,
            "maxOrders" => $ordersCount
        )
    );
} else {
    echo json_encode(
        array("status" => "failure")
    );
}
