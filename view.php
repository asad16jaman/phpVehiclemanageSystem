<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Details View</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <style>   
        @page {
            margin: none;
        }     
        .right-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 20px 0;
        }
        .left-content{
            float: right;
        }
        .label-title h4{
            font-weight: bold;
        }

        h4{
            text-transform: uppercase;
        }

        @media print {
            #printPageButton {
                display: none;
            }
        }
    </style>
</head>
<body>
    <?php
        session_start();

        // Set the current working directory
        $dir = getcwd().'/'.'images/sponsers-print/';
        
        // Initialize the counter variable to 0
        $i = 0; 
        
        if( $handle = opendir($dir) ) {
            
            while( ($file = readdir($handle)) !== false ) {
                if( !in_array($file, array('.', '..')) && !is_dir($dir.$file)) 
                    $i++;
            }
        }


        include_once("db.php");
             $settingSql = "SELECT * FROM `settings` WHERE id = 1";
            $settingQuery = mysqli_query($conn, $settingSql);
            $setting = mysqli_fetch_assoc($settingQuery);
  
        if(isset($_GET['id'])){
            $query = sprintf("SELECT * FROM vehicles WHERE id='".$_GET['id']."'");
            $query_run = mysqli_query($conn, $query);
            if(mysqli_num_rows($query_run) > 0){
                foreach($query_run as $row){
                    ?>
                        <div class="container py-5"> 
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="text-left">
                                        <img src="./images/view_logo.jpg" alt=""> 
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="text-right">
                                        <img src="./admin/assets/upload/<?php echo $setting['logo']; ?>" alt="" style="height: 150px; width: 150px; position: relative; top: -30px;"> 
                                    </div>
                                </div>
                            </div>
                            <div class="row align-items-center mt-4">
                                <div class="col-md-7">
                                    <div class="right-content">
                                        <div class="label-title">
                                            <h4>ID:</h4>
                                        </div>
                                        <div class="label-data">
                                            <h4><?php echo $_GET['id'] ?></h4>
                                        </div>
                                    </div>
                                    <div class="right-content">
                                        <div class="label-title">
                                            <h4>Make:</h4>
                                        </div>
                                        <div class="label-data">
                                            <h4><?php echo $row['vehicle_maker'] ?></h4>
                                        </div>
                                    </div>
                                    <div class="right-content">
                                        <div class="label-title">
                                            <h4>Model:</h4>
                                        </div>
                                        <div class="label-data">
                                            <h4><?php echo $row['vehicle_model'] ?></h4>
                                        </div>
                                    </div>
                                    <div class="right-content">
                                        <div class="label-title">
                                            <h4>Year:</h4>
                                        </div>
                                        <div class="label-data">
                                            <h4><?php echo $row['vehicle_year'] ?></h4>
                                        </div>
                                    </div>
                                    <div class="right-content">
                                        <div class="label-title">
                                            <h4>Owner:</h4>
                                        </div>
                                        <div class="label-data">
                                            <h4><?php echo $row['name'] ?></h4>
                                        </div>
                                    </div>
                                    <div class="right-content">
                                        <div class="label-title">
                                            <h4>City / State:</h4>
                                        </div>
                                        <div class="label-data">
                                            <h4><?php echo $row['address'] ?></h4>
                                        </div>
                                    </div>
                                    <div class="right-content">
                                        <div class="label-title">
                                            <h4>Class / Category:</h4>
                                        </div>
                                        <div class="label-data">
                                            <h4 style="color: red"><?php echo $row['category'] ?></h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="d-flex justify-content-center">
                                        <img src="images/<?php echo $row['qrcode'] ?>" alt="">
                                        
                                    </div>
                                    <p class="text-center">private</p>
                                    <!-- left-content -->
                                    <div class="d-flex justify-content-center">
                                        <img src="images/publicQr/<?php echo $row['fav_qr'] ?>" alt="">
                                       
                                    </div>
                                    <p class="text-center">public</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="container">
                           <div class="row">
                           <?php //for($n=1; $n<=$i; $n++){ ?>
                                <div class="col-sm-12 text-center">
                                    <img src="images/sponsers-print/<?php echo rand(1, $i); ?>.jpg" alt="" class="card-img-top" style="height: 250px; width: 250px; border-radius: 8px;">
                                </div> 
                            <?php //} ?>  
                            
                           </div>
                        </div>
                        <div class="text-center py-5">
                             
                            <a href="index.php" id="printPageButton" class="btn btn-dark">Go Home</a>
                            <a href="" onclick="window.print()" id="printPageButton" class="btn btn-info">Print</a>
                        </div>
                    <?php 
                }
            }
            
        }else{
            ?>
                <div class="text-center mt-5">
                    <p>NO DATA FOUND!!!!</p>
                    <a href="index.php" class="btn btn-info">Go To Home</a>
                </div>
            <?php
        }
        
    ?>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>