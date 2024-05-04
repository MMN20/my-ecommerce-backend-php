<?php
include "function.php";

// Add the database info here
$dsn = "mysql:host=localhost;dbname=DB_NAME_HERE";


$user = "USER_NAME_HERE";
$pass = "PASSWORD_HERE";
$option = array(
   PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8"
);
$countrowinpage = 9;
try {
   $con = new PDO($dsn, $user, $pass, $option);
   $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
   header("Access-Control-Allow-Origin: *");
   header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With, Access-Control-Allow-Origin");
   header("Access-Control-Allow-Methods: POST, OPTIONS , GET");
   
 
   
} catch (PDOException $e) {
   echo $e->getMessage();
}
?>