<?php
session_start();
require_once 'config/config.php';
require_once BASE_PATH . '/includes/auth_validate.php';

 
 


// Costumers class
// require_once BASE_PATH . '/lib/Costumers/Costumers.php';
// $costumers = new Costumers();

// Get Input data from query string
$search_string = filter_input(INPUT_GET, 'search_string');
$filter_col = filter_input(INPUT_GET, 'filter_col');
$order_by = filter_input(INPUT_GET, 'order_by');
$pageNo = filter_input(INPUT_GET,'page');
if(!$pageNo){
    $pageNo = 1;
}

// Per page limit for pagination.
$pagelimit = 15;

// Get current page.
$page = filter_input(INPUT_GET, 'page');
if (!$page) {
	$page = 1;
}

//Get DB instance. i.e instance of MYSQLiDB Library
$db = getDbInstance();
$select = array('id', 'name', 'address', 'phone', 'vehicle_maker','fav_vote','fav_qr', 'vehicle_model', 'vehicle_year', 'vote_status', 'category', 'qrcode', 'created_date');

//Start building query according to input parameters.
// If search string
if ($search_string) {
	$db->where('f_name', '%' . $search_string . '%', 'like');
	$db->orwhere('l_name', '%' . $search_string . '%', 'like');
}

//If order by option selected
if ($order_by) {
	$db->orderBy($filter_col, $order_by);
}

// $ll = $db->orderBy('id');

// Set pagination limit
$db->pageLimit = $pagelimit;


// Get result of the query.
$rows = $db->where('YEAR(created_date)',date('Y'))->where('status',true)->orderBy('id','desc')->arraybuilder()->paginate('vehicles', $page, $select);
$total_pages = $db->totalPages;

include BASE_PATH . '/includes/header.php';
?>
<style>
    label{
        font-size: 16px !important;
    }
    p{
        font-size: 18px !important;
    }
</style>
<!-- Main container -->
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-6">
            <h1 class="page-header">Vehicles</h1>
        </div>
    </div>
    <?php include BASE_PATH . '/includes/flash_messages.php';?>


    <div id="export-section">
        <a href="export_customers.php"><button class="btn btn-sm btn-primary">Export to CSV <i class="glyphicon glyphicon-export"></i></button></a>
    </div>

    <!-- Table -->
    <table class="table table-striped table-bordered table-condensed">
        <thead>
            <tr>
                <th width="3%">ID</th>
                <th width="11%">Name</th>
                <th width="10%">Address</th>
                <th width="10%">Phone</th>
                <th width="10%">Vehicle Make</th>
                <th width="6%">Fav Count</th>
                <th width="8%">Fav QR</th>
                <th width="7%">Vote Count</th>
                <th width="10%">Category</th>
                <th width="7%">QR</th>
                <th width="10%">Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($rows as $key => $row): ?>
            <tr>
                <td><?php echo (($pageNo-1) * 15) + ($key +1) ; ?></td>
                <td><?php echo xss_clean($row['name']); ?></td>
                <td><?php echo xss_clean($row['address']); ?></td>
                <td><?php echo xss_clean($row['phone']); ?></td>
                <td><?php echo xss_clean($row['vehicle_maker']); ?></td>
                <td><?php echo xss_clean($row['fav_vote']); ?></td>
                <td><img src="./../images/publicQr/<?php echo $row['qrcode'] ?>" width="60"></td>
                <td><?php echo xss_clean($row['vote_status']); ?></td>
                <td><?php echo xss_clean($row['category']); ?></td>
                <td>
                    <img src="./../images/<?php echo $row['qrcode'] ?>" width="60">
                </td>
                <td>
                    <a href="edit_vehicle.php?id=<?php echo $row['id']; ?>" class="btn btn-info"><i class="glyphicon glyphicon-edit"></i></a>
                    <a href="https://www.thelittlebigshow.com/app/view.php?id=<?php echo $row['id']; ?>" class="btn btn-info"><i class="glyphicon glyphicon-print"></i></a>
                    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#view-<?php echo $row['id']; ?>"><i class="glyphicon glyphicon-fullscreen"></i></a>
                    <a href="#" class="btn btn-danger delete_btn" data-toggle="modal" data-target="#confirm-delete-<?php echo $row['id']; ?>"><i class="glyphicon glyphicon-trash"></i></a>
                </td>
            </tr>
            <!-- View Modal -->
            <div class="modal fade" id="view-<?php echo $row['id']; ?>" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">User Details</h4>
                        </div>
                        <div class="modal-body text-center">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="">Name</label>
                                    <p><?php echo xss_clean($row['name']); ?></p>
                                </div>
                                <div class="col-md-6">
                                    <label for="">Address</label>
                                    <p><?php echo xss_clean($row['address']); ?></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="">Phone Number</label>
                                    <p><?php echo xss_clean($row['phone']); ?></p>
                                </div>
                                <div class="col-md-6">
                                    <label for="">Vehicle Maker</label>
                                    <p><?php echo xss_clean($row['vehicle_maker']); ?></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="">Vehicle Year</label>
                                    <p><?php echo xss_clean($row['vehicle_year']); ?></p>
                                </div>
                                <div class="col-md-6">
                                    <label for="">Vehicle Model</label>
                                    <p><?php echo xss_clean($row['vehicle_model']); ?></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-8">
                                    <label for="">QR Code</label>
                                    <p>
                                        <img src="../images/<?php echo $row['qrcode'] ?>" width="100%" class="card-img-top">
                                    </p>
                                </div>
                                <div class="col-md-2"></div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //View Modal -->


            <!-- Delete Confirmation Modal -->
            <div class="modal fade" id="confirm-delete-<?php echo $row['id']; ?>" role="dialog">
                <div class="modal-dialog">
                    <form action="delete_customer.php" method="POST">
                        <!-- Modal content -->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Confirm</h4>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="del_id" id="del_id" value="<?php echo $row['id']; ?>">
                                <p>Are you sure you want to delete this row?</p>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-default pull-left">Yes</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- //Delete Confirmation Modal -->
            <?php endforeach;?>
        </tbody>
    </table>
    <!-- //Table -->

    <!-- Pagination -->
    <div class="text-center">
    <?php echo paginationLinks($page, $total_pages, 'customers.php'); ?>
    </div>
    <!-- //Pagination -->
</div>
<!-- //Main container -->
<?php include BASE_PATH . '/includes/footer.php';?>
