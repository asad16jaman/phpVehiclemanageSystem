<?php
session_start();
ob_start();
require_once 'config/config.php';
require_once BASE_PATH . '/includes/auth_validate.php';

$db = getDbInstance();

$vehicle_id = filter_input(INPUT_GET,'vehicle',FILTER_VALIDATE_INT);
if(!$vehicle_id){
    header("Location: /admin/customers.php");
    exit();
}

$actioy_type = filter_input(INPUT_GET,'inrease');


if($_SERVER['REQUEST_METHOD'] == 'POST'){

    $vcl = $db->where('id',$vehicle_id)->getOne('vehicles');
    if($actioy_type == 'true'){
        $up = (int) $vcl['vote_status'] +1;
        $success = $db->where('id',$vehicle_id)->update('vehicles',['vote_status' => $up]);
        if($success){
            echo json_encode(["success" => true, "vote" => $up]);
        }
    }else{
        $down = (int) $vcl['vote_status'] - 1;
        $success = $db->where('id',$vehicle_id)->update('vehicles',['vote_status' => $down]);
        if($success){
            echo json_encode(["success" => true, "vote" => $down]);
        }

    }
 
}









