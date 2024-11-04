<?php
session_start();
require_once './config/config.php';
require_once 'includes/auth_validate.php';

//Get DB instance. function is defined in config.php
$data = getDbInstance();
$data = $data->where('id',$_SESSION['user_id'])->getOne('admin_accounts');



include_once('includes/header.php');
?>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">Profile</h2>
		</div>
	</div>
    <?php 
    include_once('includes/flash_messages.php');
    ?>
	<div class="well">
        <h3>Wellcome to profile page</h3>
        <p>Your user name : <?php echo $data['user_name'] ?></p>
        <p>Your user type : <?php echo $data['admin_type'] ?></p>
        <div class="d-flex justify-content-end">
           
            <a href="change_admin_password.php" class="btn btn-primary">Change Password</a>
            <a href="change_admin_username.php" class="btn btn-primary">Change user name</a>
            
        </div>
    </div>
</div>
<!-- /#page-wrapper -->



<?php include_once('includes/footer.php'); ?>
