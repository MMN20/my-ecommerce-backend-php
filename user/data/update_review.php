<?php
include "../../connect.php";
$reviewid = filterRequest("reviewid");
$rating = filterRequest("rating");
$comment = filterRequest("comment");
$itemid = filterRequest("itemid");

$data = array(
    "reviews_rating" => $rating,
    "review_comment" => $comment
);

updateData("reviews",$data,"reviews_id = $reviewid",false);

$stmt = $con->prepare("select (sum(reviews_rating) / count(reviews_rating)) as newRating from reviews where item_id =  $itemid");
$stmt->execute();

$newRating =  $stmt->fetchColumn();
$newRating = (float)$newRating;

$json = array(
    "status" => "success",
    "newRating" => $newRating
);

echo json_encode($json);
?>