<?php
session_start();
require_once './config/config.php';
require_once 'includes/auth_validate.php';

//Get DB instance. function is defined in config.php

if ($_SERVER['REQUEST_METHOD'] == 'POST') 
{


    $username  = $_POST['user_name'];
    

	
	if(strlen($username)>=3){
		$data = getDbInstance();
		$data = $data->where('user_name',$username)->getOne('admin_accounts');
		if(!$data){
			$updatedata = getDbInstance();
			if($updatedata->where('id',$_SESSION['user_id'])->update('admin_accounts',['user_name' => $username])){
				$_SESSION['success'] = "successfully changed username";
				header("Location: profile.php");
			}
		}else if($data['id'] !== $_SESSION['user_id']){
			$_SESSION['info'] = "this username already have taken! choose another";
		}else{
			$_SESSION['success'] = "same username you save";
				header("Location: profile.php");
		}

	}else{
		$_SESSION['failure'] = "username letter must be gratter then 3";
	}
	






}




include_once('includes/header.php');
?>
<div id="page-wrapper">
	<div class="row">
		<div class="col-12">
			<h2 class="page-header">Change password</h2>
		</div>
		
	</div>
	 <?php 
    include_once('includes/flash_messages.php');
    ?>
	<form class="well form-horizontal" action=" " method="post"  id="contact_form" enctype="multipart/form-data">
		<?php include_once './forms/change_username_form.php'; ?>
	</form>
</div>
<!-- /#page-wrapper -->



<?php include_once('includes/footer.php'); ?>
