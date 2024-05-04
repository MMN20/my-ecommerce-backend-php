<?php
include "../../connect.php";
$email = filterRequest("email");
$password = sha1(filterRequest("password")) ;

$stmt = $con->prepare("SELECT * FROM users WHERE users_email = ? AND users_password = ?");
$stmt->execute(array($email, $password));
$count = $stmt->rowCount();


if ($count > 0) {
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    if($data['users_approved'] == 0)
    {
        $approveCode = rand(10000,99999);
        $id = $data['users_id'];
        updateData("users",array("users_approvecode" => $approveCode),"users_id = $id",false);
        mail($email, "Approve code", "This is your approve code for myEcommerce app: $approveCode");
    }
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    printFailure();
}
