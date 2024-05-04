<?php
include "../../connect.php";
include "../upload_files.php";
$title = filterRequest('title');
$body = filterRequest('body');

$fileName = uploadAFile('image', "../../upload/promotions");

$data = array(
    "promotions_title" => $title,
    "promotions_body" => $body,
    "promotions_imageUrl" => $fileName,
);

$sql = "insert into Promotions (promotions_title,promotions_body,promotions_imageUrl) values (?,?,?)";

$stmt = $con->prepare($sql);
$stmt->execute(array($title, $body, $fileName));
$lastId = $con->lastInsertId();

if ($stmt->rowCount() > 0) {
    echo json_encode(array(
        "status" => "success",
        "newID" => $lastId,
        "imageUrl" => $fileName
    ));
} else {
    echo json_encode(array(
        "status" => "failure",
    ));
}

?>