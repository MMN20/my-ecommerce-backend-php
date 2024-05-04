<?php
include "../../connect.php";
// resend verification code

$email = filterRequest("email");
$approveCode = rand(10000,99999);

updateData("users",array("users_approvecode" => $approveCode),"users_email = '$email'");

mail($email, "Approve code", "This is your approve code for myEcommerce app: $approveCode");

?>