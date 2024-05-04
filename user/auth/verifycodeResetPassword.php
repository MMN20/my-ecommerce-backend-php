<?php
include "../../connect.php";
$email = filterRequest("email");
$approveCode = filterRequest("code");

$count = getData("users","users_email = '$email' and users_approvecode = $approveCode",false);

if($count > 0)
{
    $data = array(
        "users_approved" => 1
    );
    updateData("users",$data,"users_email = '$email'",false);
    printSuccess();
}
else
{
    printFailure();
}


?>