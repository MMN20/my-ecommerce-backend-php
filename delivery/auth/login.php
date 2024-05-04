<?php
include "../../connect.php";
$email = filterRequest("email");
$password = sha1(filterRequest("password"));

$sql = "select * from delivery where delivery_email = ? and delivery_password = ?";

$stmt = $con->prepare($sql);
$stmt->execute(array($email,$password));
$count = $stmt->rowCount();

if($count > 0)
{
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    if($data['delivery_active'] == 1)
    {
        echo json_encode(array(
            "status" => "success",
            "data" => $data
        ));
    }
    else
    {
        echo json_encode(array(
            "status" => "failure",
            "message" => "not active"
        ));
    }
}
else
{
    echo json_encode(array(
        "status" => "failure",
        "message" => "not exist"
    ));
}

?>