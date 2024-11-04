<?php
session_start();
require_once './config/config.php';
require_once 'includes/auth_validate.php';

//Get DB instance. function is defined in config.php

if ($_SERVER['REQUEST_METHOD'] == 'POST') 
{


    $current  = $_POST['current'];
    $new  = $_POST['password'];
    $c_new  = $_POST['c_password'];

	$data = getDbInstance();
	$data = $data->where('id',$_SESSION['user_id'])->getOne('admin_accounts');

	if(password_verify($current,$data['password'])){
		if($new === $c_new){
			$change = getDbInstance()->where('id',$_SESSION['user_id']);
			if($change->update('admin_accounts',['password'=>password_hash($new,PASSWORD_DEFAULT)])){
				$_SESSION['success'] = 'Successfully changed your password';
			}else{
				$_SESSION['failure'] = 'there is some problam';
			}
			
		}else{
			$_SESSION['info'] = 'Two password must be same';
		}
	}else{
		$_SESSION['failure'] = 'You provide wrong password';
	}







}




include_once('includes/header.php');
?>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">Change password</h2>
		</div>
	</div>
	 <?php 
    include_once('includes/flash_messages.php');
    ?>
	<form class="well form-horizontal" action=" " method="post"  id="contact_form" enctype="multipart/form-data">
		<?php include_once './forms/password_change_form.php'; ?>
	</form>
</div>
<!-- /#page-wrapper -->



<?php include_once('includes/footer.php'); ?>
