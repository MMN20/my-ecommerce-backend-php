<?php
include "../../connect.php";
// resend verification code

$token = filterRequest("token");
$userid = filterRequest("userid");

$data = array("users_token" => $token);

updateData("users",$data,"users_id  = $userid");


?>