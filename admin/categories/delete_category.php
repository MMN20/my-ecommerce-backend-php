<?php
include "../../connect.php";

$catid = filterRequest("catid");


$stmt = $con->prepare("select cat_imageUrl from categories where cat_id = $catid");
$stmt->execute();
$imageName = $stmt->fetchColumn();

unlink("../../upload/$imageName");

deleteData("categories","cat_id = $catid");