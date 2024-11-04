<?php
session_start();
ob_start();
require_once 'config/config.php';
require_once BASE_PATH . '/includes/auth_validate.php';
include_once("../db.php");
include BASE_PATH . '/includes/header.php';

?>

<style>
    label{
        font-size: 16px !important;
    }
    p{
        font-size: 18px !important;
    }
    .flex-page-header{
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .colorshow{
        width: 30px;
        height: 30px;
        
        margin: 0 auto;
        border: 1px solid black;
        border-radius: 5px;
    }
</style>
<!-- Main container -->
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <div class="page-header flex-page-header">
                <h1>Categories</h1>
                <a href="categories_create.php" class="btn btn-primary">Create</a>
            </div>
        </div>
    </div>
    <?php include BASE_PATH . '/includes/flash_messages.php';?>

    <!-- Table -->
    <table class="table table-striped table-bordered table-condensed">
        <thead>
            <tr>
                <th width="13%">Name</th>
                <th width="5%" class="">Color</th>
                <th width="13%">Action</th>
            </tr>
        </thead>
        <tbody>
        <?php 
            include_once("../db.php");
            $select_query = "SELECT * FROM category";
            if($result = mysqli_query($conn, $select_query)){
                if(mysqli_num_rows($result) > 0){
                    while($row = mysqli_fetch_array($result)){
                    ?>
                        <tr>
                            <td><?php echo $row['name'] ?></td>
                            <td><div class="colorshow" style="background-color: <?php echo $row['color'] ?>;"></div></td>
                            <td>
                                <a href="show_category.php?cat=<?php echo $row['name']; ?>" class="btn btn-info">Show</a>
                                <a href="edit_category.php?id=<?php echo $row['id']; ?>" class="btn btn-primary">Edit</a>
                                <a href="delete_category.php?id=<?php echo $row['id']; ?>" class="btn btn-danger">Delete</a>
                            </td>
                        </tr>
                    <?php 
                    }
                }else{
                    ?>
                        <tr>
                            <td colspan="7" align="center">
                                No Data Found
                            </td>
                        </tr>
                    <?php
                }
            }
        ?>
        </tbody>
    </table>
    <!-- //Table -->
</div>
<!-- //Main container -->

<?php include BASE_PATH . '/includes/footer.php';?>
