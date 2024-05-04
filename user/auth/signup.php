<?php
include "../../connect.php";
 
 if(isset($_POST['username']))
 {
$username = filterRequest("username");
 }
 
 if(isset($_POST["email"]))
 {
$email = filterRequest("email");
 }
 
$password = sha1(filterRequest("password"));
$date = date('Y-m-d H:i:s');
$approveCode = rand(10000, 99999);

$table = "users";

$data = array(
    "users_username" => $username,
    "users_email" => $email,
    "users_password" => $password,
    "users_approvecode" => $approveCode
);
 $countt = getData("users","users_email = '$email'",false);

if($countt > 0)
{
    printFailure("users_exists");
}
else
{

    $count =  insertData($table, $data, false);
    
    if ($count > 0) {
         $id =  $con->lastInsertId();
        mail($email, "Approve code", "This is your approve code for myEcommerce app: $approveCode");
       echo json_encode(array("status" => "success","id" => $id));
    } else {
        printFailure();
    }
    
}
?>