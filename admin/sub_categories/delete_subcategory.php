<?php
include "../../connect.php";

$subcatid = filterRequest("subcatid");


deleteData("subcategories","subcat_id  = $subcatid");