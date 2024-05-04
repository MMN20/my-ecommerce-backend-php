<?php
include "../../connect.php";
include "../upload_files.php";

// Promotion id
$id = filterRequest('id');
$title = filterRequest('title');
$body = filterRequest('body');


// if the admin uploaded a new file
if (isset($_FILES['image'])) {

    // delete the old file first
        
    $sql = "select promotions_imageUrl from Promotions where promotions_id = $id";
    $stmt = $con->prepare($sql);
    $stmt->execute();
    $oldFileName = $stmt->fetchColumn();
    unlink("../../upload/promotions/$oldFileName");


    $fileName = uploadAFile('image', "../../upload/promotions");

    $data = array(
        $title,
        $body,
        $fileName,
    );
    $sql = "update Promotions set promotions_title = ?, promotions_body = ?, promotions_imageUrl = ? where promotions_id = $id";
} else {
    $data = array(
        $title,
        $body,
    );
    $sql = "update Promotions set promotions_title = ?, promotions_body = ?  where promotions_id = $id";
}


$stmt = $con->prepare($sql);
$stmt->execute($data);

if ($stmt->rowCount() > 0) {
    if (isset($_FILES['image'])) {
        $data = array(
            "status" => "success",
            "imageUrl" => $fileName
        );
    } else {
        $data = array(
            "status" => "success"
        );
    }

    echo json_encode($data);
} else {
    echo json_encode(array(
        "status" => "failure",
    ));
}
