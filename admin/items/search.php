<?php
include "../../connect.php";
$word = filterRequest("word");
getAlldata("itemsview","items_name like '%$word%' ");



?>