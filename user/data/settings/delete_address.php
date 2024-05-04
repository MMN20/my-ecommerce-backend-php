<?php
include "../../../connect.php";
$id = filterRequest("id");
 try {
    deleteData("addresses","addresses_id = $id");
 } catch (\Throwable $th) {
    printFailure("order");
 }
?>