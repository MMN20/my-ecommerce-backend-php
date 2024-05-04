<?php
include "../../connect.php";
include "../upload_files.php";

// Promotion id
$id = filterRequest('id');

$sql = "select promotions_imageUrl from Promotions where promotions_id = $id";
$stmt = $con->prepare($sql);
$stmt->execute();
$oldFileName = $stmt->fetchColumn();
unlink("../../upload/promotions/$oldFileName");
 
 
deleteData("Promotions","promotions_id = $id");