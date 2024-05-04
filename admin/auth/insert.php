<?php
include "../../connect.php";
$email = filterRequest("email");
$username = filterRequest("username");
$password = sha1(filterRequest("password"));

$insertData = ["admins_username" => $username,"admins_email" => $email,"admins_password" => $password];

insertData("admins",$insertData);