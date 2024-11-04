<?php
session_start();
require_once './config/config.php';
require_once 'includes/auth_validate.php';

//Only super admin is allowed to access this page
if ($_SESSION['admin_type'] !== 'admin') {
    // show permission denied message
    echo 'Permission Denied';
    exit();
}


if ($_SERVER['REQUEST_METHOD'] == 'POST') 
{
	$data_to_store = filter_input_array(INPUT_POST);
  


    $db = getDbInstance();
    //Check whether the user name already exists ; 
    $db->where('user_name',$data_to_store['user_name']);
    $db->get('admin_accounts');
    
    if($db->count >=1){
        $_SESSION['failure'] = "User name already exists";
        header('location: create_admin.php');
        exit();
    }

    if(strlen($data_to_store['password'])<7){
        $_SESSION['failure'] = "Password  must more then 7 character";
        header('location: create_admin.php');
        exit();
    }


    //Encrypt password
    $data_to_store['password'] = password_hash($data_to_store['password'],PASSWORD_DEFAULT);
    $data_to_store['admin_type'] = 'admin';
    

    
    //reset db instance
    $db = getDbInstance();
    $db->rawQuery ("INSERT INTO admin_accounts (user_name,password,admin_type) VALUES(?,?,?)",$data_to_store);
    

    $_SESSION['success'] = "Admin user added successfully!";
    header('location: admin_index.php');
    exit(); 
    
}

$edit = false;


require_once 'includes/header.php';
?>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">Add User</h2>
		</div>
	</div>
	 <?php 
    include_once('includes/flash_messages.php');
    ?>
	<form class="well form-horizontal" action=" " method="post"  id="contact_form" enctype="multipart/form-data">
		<?php include_once './forms/create_admin_form.php'; ?>
	</form>
</div>




<?php include_once 'includes/footer.php'; ?>