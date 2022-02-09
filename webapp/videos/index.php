<?php

function is_blocklisted($text)
{
    // 
    $block_items = array("php://input", "phar://", "zip://", "ftp://", "file://", "http://", "data://", "expect://", "https://", "../", "./");
    foreach ($block_items as $item) {
        return strpos($text, $item);
}

// url?file=/etc/passwd
if (isset($_GET['file'])) {
    if (is_blocklisted($_GET['file'])) {
        include($_GET['file']);
    } else {
        echo "no video selected";
    }
}
?>

/*
) {
            return true;
        }
    }
    return false;

*/