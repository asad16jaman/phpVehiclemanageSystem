<?php
session_start();
require_once 'config/config.php';






//Get DB instance. i.e instance of MYSQLiDB Library
$db = getDbInstance();


// Get result of the query.
$rows = $db->where('YEAR(created_date)',date('Y'))->where('status',true);
if($rows->update('vehicles',['status' => false])){
    header("Location: customers.php");
}else{
    header("Location: customers.php");
}


include BASE_PATH . '/includes/header.php';
?>