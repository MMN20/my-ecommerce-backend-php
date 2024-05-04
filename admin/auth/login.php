<?php
include "../../connect.php";
$email = filterRequest("email");
$password = sha1(filterRequest("password"));

// getData("admins");
 
    $sql = "select admins_id, admins_email, admins_username from admins where admins_email = '$email' and admins_password = '$password'";
    $stmt = $con->prepare($sql);
    $stmt->execute();
 


if ($stmt->rowCount()) {
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    echo json_encode(
        array("status" => "success", "data" => $data)
    );
} else {
    echo json_encode(
        array("status" => "failure")
    );
}
