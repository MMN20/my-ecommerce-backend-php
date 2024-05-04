<?php

function getFileExtension($fileName) : string
{
    $arrOfName = explode(".",$fileName);
    $ext = end($arrOfName);
    $ext = strtolower($ext);
    return $ext;
}

function uploadAFile($fieldName,$savingDir)
{
    if(isset($_FILES[$fieldName]))
    {

        $allowedExts = ['png','jpg','jpeg','gif','svg'];
        $maxSize = 111111113123123520; // bytes (5 MB)
        
        $tmp = $_FILES[$fieldName]['tmp_name'];
        $fileName = $_FILES[$fieldName]['name'];
        $fileSize = $_FILES[$fieldName]['size'];
        $ext = getFileExtension($fileName);
        
        // change the fileName for preventing the overrite for another file with the same name
        $fileName = $fileName . uniqid();
        
        if(in_array($ext,$allowedExts) && $fileSize <= $maxSize)
        {
            if(move_uploaded_file($tmp,$savingDir . "/" . $fileName))
            {
                return $fileName;
            }
        }
    }
    return false;
}

function uploadFiles($savingDir)
{
    foreach ($_FILES as $key => $value) {
        uploadAFile($key,$savingDir);
    }
}


uploadFiles("../upload");



?>