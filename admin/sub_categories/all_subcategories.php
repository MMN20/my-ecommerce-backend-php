<?php
include "../../connect.php";
$catid = filterRequest("catid");
getAlldata("subcategories","cat_id = $catid");