<?php
include "../../../connect.php";
$userid = filterRequest("userid");

$sql = "select * from ordersview where orders_usersid = ? and orders_statusid  = 5";

$stmt = $con->prepare($sql);

$stmt->execute(array($userid));

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