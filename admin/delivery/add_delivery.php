<?php
include "../../connect.php";
include "../upload_files.php";

$username = filterRequest("username");
$email = filterRequest("email");
$password = sha1(filterRequest("password"));
$active = filterRequest("active");  

// in JSON format
 
$insertData = array(
    "delivery_username" => $username,
    "delivery_email" => $email,
    "delivery_password" => $password,
    "delivery_active" => $active,
);

insertData("delivery",$insertData);
