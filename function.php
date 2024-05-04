<?php

function filterRequest($requestname)
{
    return  htmlspecialchars(strip_tags($_POST[$requestname]));
}



function insertData($tableName, $data, $json = true)
{
    global $con;

    $cols = array();
    $values = array();
    $qs = array();

    foreach ($data as $col => $value) {
        $cols[] = $col;
        $values[] = $value;
        $qs[] = "?";
    }

    $qs = implode(",", $qs);
    $cols = implode(",", $cols);

    $sql = "INSERT INTO $tableName ($cols) VALUES ($qs)";
    $stmt = $con->prepare($sql);
    $stmt->execute($values);
    $count = $stmt->rowCount();

    if ($json) {
        if ($count > 0) {
            printSuccess();
        } else {
            printFailure();
        }
    } else {

        return $count;
    }
}



function updateData($tableName, $data, $where = null, $json = true)
{
    global $con;
    foreach ($data as $col => $val) {
        $cols[] = $col;
        $values[] =  $val;
        $qs[] = "$col =  ?";
    }
    $qs = implode(",", $qs);
    if ($where == null) {
        $sql  = "UPDATE $tableName SET $qs";
    } else {
        $sql  = "UPDATE $tableName SET $qs WHERE $where";
    }
    $stmt = $con->prepare($sql);
    $stmt->execute($values);
    $count = $stmt->rowCount();
    if ($json) {
        if ($count > 0) {
            printSuccess();
        } else {
            printFailure();
        }
    } else {
        return $count;
    }
}



function getAlldata($tableName, $where = false, $json = true)
{
    global $con;
    if ($where) {
        $sql = "SELECT * from $tableName where $where";
    } else {
        $sql = "SELECT * from $tableName";
    }

    $stmt = $con->prepare($sql);
    $stmt->execute();
    $count = $stmt->rowCount();

    if ($json) {
        if ($count > 0) {
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
            echo json_encode(array("status" => "success", "data" => $data));
        } else {
            printFailure();
        }
    } else {
        return array("data" => $stmt->fetchAll(PDO::FETCH_ASSOC), "count" => $count);
    }
}



function deleteData($tableName, $where = false, $json = true)
{
    global $con;
    if ($where) {
        $sql = "DELETE FROM $tableName where $where";
    } else {
        $sql = "DELETE FROM $tableName";
    }
    $stmt = $con->prepare($sql);
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json) {
        if ($count > 0) {

            printSuccess();
        } else {
            printFailure();
        }
    } else {
        return $count;
    }
}



function getData($tableName, $where = "1 = 1", $json = true)
{
    global $con;
    if ($where) {
        $sql = "SELECT * from $tableName where $where";
    } else {
        $sql = "SELECT * from $tableName";
    }

    $stmt = $con->prepare($sql);
    $stmt->execute();
    $count = $stmt->rowCount();

    if ($json) {
        if ($count > 0) {
            $data = $stmt->fetch(PDO::FETCH_ASSOC);
            echo json_encode(array("status" => "success", "data" => $data));
        } else {
            printFailure();
        }
    } else {
        return $count;
    }
}

function printSuccess($message = 'none')
{
    echo json_encode(array("status" => "success", "message" => $message));
}

function printFailure($message = 'none')
{
    echo json_encode(array("status" => "failure", "message" => $message));
}


function sendFCM_usingToken($mytitle, $mybody, $mytoken,$data)
{

    $url = "https://fcm.googleapis.com/fcm/send";
    $token = $mytoken;
    $serverKey = 'AAAAyT-gbPE:APA91bH_YCtREqA7wXZpZjGvCCenncCVzflo4NfBfnp6Jj4aZD9N31jNcMBpj_rjDhp97JGfZJ-5o3mOnWz_7hd1402xNg_6-Il38RgRmd7cilwk6a3Kpruw1EH4KJNiB_kwp7dI4a7Y';
    $title = $mytitle;
    $body = $mybody;
    $notification = array('title' => $title, 'body' => $body, 'sound' => 'default',  "click_action" => "FLUTTER_NOTIFICATION_CLICK",);
    $arrayToSend = array('to' => $token, 'notification' => $notification, 'priority' => 'high' ,'data' => $data);
    $json = json_encode($arrayToSend);
    $headers = array();
    $headers[] = 'Content-Type: application/json';
    $headers[] = 'Authorization: key=' . $serverKey;
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    //Send the request
    $response = curl_exec($ch);
    //Close request
    if ($response === FALSE) {
        die('FCM Send Error: ' . curl_error($ch));
    }
    curl_close($ch);
}


function sendFCM_usingTopic($mytitle, $mybody, $mytopic,$data)
{

    $url = "https://fcm.googleapis.com/fcm/send";
    $token = '/topics/'.$mytopic;
    $serverKey = 'AAAAyT-gbPE:APA91bH_YCtREqA7wXZpZjGvCCenncCVzflo4NfBfnp6Jj4aZD9N31jNcMBpj_rjDhp97JGfZJ-5o3mOnWz_7hd1402xNg_6-Il38RgRmd7cilwk6a3Kpruw1EH4KJNiB_kwp7dI4a7Y';
    $title = $mytitle;
    $body = $mybody;
    $notification = array('title' => $title, 'body' => $body, 'sound' => 'default',  "click_action" => "FLUTTER_NOTIFICATION_CLICK",);
    $arrayToSend = array('to' => $token, 'notification' => $notification, 'priority' => 'high','data' => $data);
    $json = json_encode($arrayToSend);
    $headers = array();
    $headers[] = 'Content-Type: application/json';
    $headers[] = 'Authorization: key=' . $serverKey;
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    //Send the request
    $response = curl_exec($ch);
    //Close request
    if ($response === FALSE) {
        die('FCM Send Error: ' . curl_error($ch));
    }
    curl_close($ch);
}







