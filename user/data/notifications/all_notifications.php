<?php
include "../../../connect.php";
$userid = filterRequest("userid");
$currentIndex = filterRequest("id");
 
$stmt = $con->prepare("select count(notifications_id) as count from notifications where notifications_userid = $userid");
$stmt->execute();
$maxNotifs = $stmt->fetchColumn();


$stmt = $con->prepare("select * from notifications where notifications_userid = $userid and notifications_id > $currentIndex order by notifications_id desc limit 10");
$stmt->execute();

if($stmt->rowCount() > 0)
{
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
   
    echo json_encode(
        array(
            "status" => 'success',
            'data' => $data,
            'maxCount' => $maxNotifs
        )
    );
}
else
{
    echo json_encode(
        array(
            "status" => 'failure',
        )
    );
}

?>