<?php
include "../../connect.php";
$userid = filterRequest("userid");
$itemid = filterRequest("itemid");

$count =  getData("favorite","favorite_userid = $userid and favorite_itemid = $itemid",false);

if($count > 0)
{
    deleteData("favorite","favorite_itemid = $itemid and favorite_userid = $userid");
}
else
{
    insertData("favorite",array("favorite_userid" => $userid,"favorite_itemid" => $itemid));
}

?>