<?php
session_start();
require_once 'config/config.php';
require_once BASE_PATH . '/includes/auth_validate.php';

// Costumers class
require_once BASE_PATH . '/lib/Costumers/Costumers.php';

//Get DB instance. i.e instance of MYSQLiDB Library
$db = getDbInstance();

//year
$get_year = $_GET['year'];
// 'YEAR(created_date)',$get_year

// Get result of the query.
$all_catagories = [];
$all_catagories = $db->rawQuery("SELECT count(*) as num_of_vehicle,category  FROM vehicles where year(created_date) = $get_year GROUP BY category order by category");

$total_vichele = 0;
foreach ($all_catagories as $row) {
    $total_vichele += $row['num_of_vehicle'];
}

include BASE_PATH . '/includes/header.php';
?>
<style>
    label {
        font-size: 16px !important;
    }

    p {
        font-size: 18px !important;
    }

    .lighter {
        font-size: 20px;
        background: #ff8300a3;
        padding: 10px;
        text-align: center;
        color: #fff;
        border-radius: 10px 10px 0px 0px;
    }
</style>
<!-- Main container -->
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-6">
            <h1 class="page-header">Vehicles</h1>
        </div>
    </div>
    <?php include BASE_PATH . '/includes/flash_messages.php'; ?>

    <?php
    if ($total_vichele > 0) {
        ?>
        <div id="export-section " class="lighter">
            Total number of vehicle for <?php echo $get_year . ' is ' . $total_vichele; ?>
        </div>
        <?php
    }
    ?>

    <!-- Table -->
    <table class="table table-striped table-bordered table-condensed">
        <thead>
            <tr>
                <th width="13%">Category</th>
                <th width="5%" class="">Number of Vehcile</th>

            </tr>
        </thead>
        <tbody>

            <?php
            foreach ($all_catagories as $catagory) {
                ?>
                <tr>
                    <td><?php echo $catagory['category'] ?></td>
                    <td><?php echo $catagory['num_of_vehicle'] ?></td>

                </tr>

                <?php
            }
            ?>

        </tbody>
    </table>
    <!-- //Table -->

</div>
<!-- //Main container -->
<?php include BASE_PATH . '/includes/footer.php'; ?>