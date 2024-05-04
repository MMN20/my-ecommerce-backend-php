<?php
include "../../../connect.php";
$itemid = filterRequest("itemid");
$userid = filterRequest("userid");
$rating = filterRequest("rating");
$comment = filterRequest("comment");

$data = array(
    "reviews_rating" => $rating,
    "user_id" => $userid,
    "item_id" => $itemid,
    "review_comment" => $comment
);

insertData("reviews",$data,false);

$stmt = $con->prepare("select (sum(reviews_rating) / count(reviews_rating)) as newRating from reviews where item_id = $itemid");
$stmt->execute();

$newRating =  $stmt->fetchColumn();
$newRating = (float)$newRating;

$stmt = $con->prepare("select last_insert_id()");
$stmt->execute();

$newID = $stmt->fetchColumn();

$json = array(
    "status" => "success",
    "newRating" => $newRating,
    "newID" => $newID
);

echo json_encode($json);


?>