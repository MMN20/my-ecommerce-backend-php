<?php
include "../../connect.php";
$userid = filterRequest("userid");

getAlldata("addresses","addresses_userid = $userid");


?>