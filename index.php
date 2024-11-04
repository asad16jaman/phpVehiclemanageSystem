<?php 
    session_start();
    include_once("db.php");
    // Setting Query 
    $settingSql = "SELECT * FROM `settings` WHERE id = 1";
    $settingQuery = mysqli_query($conn, $settingSql);
    $setting = mysqli_fetch_assoc($settingQuery);


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
     
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>The Little Big Show - Home</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
        <style>
            @charset 'UTF-8';
/* Slider */

.slider {
  width: 100%;
  margin: auto;
  overflow: hidden;
  background-color: #2e0f55; /* Added background color */
}

.slide-track {
  display: flex;
  padding: 15px;
  gap: 20px; /* Adjust the space between images */
  animation: slide infinite linear;
  will-change: transform;
}

.slide {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 20px; /* Adjust the space between images */
  flex-shrink: 0;
}

.slide img {
    display: block; 
  width: 80px; /* Set each image width to 60px */
  height: auto; /* Maintain aspect ratio */
  transition: transform 0.5s ease;
}

@media screen and (min-width: 768px) {
.slide img {
    max-width: 200px; /* Larger size on bigger screens */
  }
}

@media screen and (min-width: 1024px) {
.slide  img {
    max-width: 240px; /* Even larger size on large screens */
  }
}

.slick-loading .slick-list
{
    background: #fff url('./ajax-loader.gif') center center no-repeat;
}

/* Icons */
@font-face
{
    font-family: 'slick';
    font-weight: normal;
    font-style: normal;

    src: url('./fonts/slick.eot');
    src: url('./fonts/slick.eot?#iefix') format('embedded-opentype'), url('./fonts/slick.woff') format('woff'), url('./fonts/slick.ttf') format('truetype'), url('./fonts/slick.svg#slick') format('svg');
}
/* Arrows */
.slick-prev,
.slick-next
{
    font-size: 0;
    line-height: 0;

    position: absolute;
    top: 50%;

    display: block;

    width: 20px;
    height: 20px;
    padding: 0;
    -webkit-transform: translate(0, -50%);
    -ms-transform: translate(0, -50%);
    transform: translate(0, -50%);

    cursor: pointer;

    color: transparent;
    border: none;
    outline: none;
    background: transparent;
}
.slick-prev:hover,
.slick-prev:focus,
.slick-next:hover,
.slick-next:focus
{
    color: transparent;
    outline: none;
    background: transparent;
}
.slick-prev:hover:before,
.slick-prev:focus:before,
.slick-next:hover:before,
.slick-next:focus:before
{
    opacity: 1;
}
.slick-prev.slick-disabled:before,
.slick-next.slick-disabled:before
{
    opacity: .25;
}

.slick-prev:before,
.slick-next:before
{
    font-family: 'slick';
    font-size: 20px;
    line-height: 1;

    opacity: .75;
    color: white;

    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

.slick-prev
{
    left: -25px;
}
[dir='rtl'] .slick-prev
{
    right: -25px;
    left: auto;
}
.slick-prev:before
{
    content: '←';
}
[dir='rtl'] .slick-prev:before
{
    content: '→';
}

.slick-next
{
    right: -25px;
}
[dir='rtl'] .slick-next
{
    right: auto;
    left: -25px;
}
.slick-next:before
{
    content: '→';
}
[dir='rtl'] .slick-next:before
{
    content: '←';
}

/* Dots */
.slick-dotted.slick-slider
{
    margin-bottom: 30px;
}

.slick-dots
{
    position: absolute;
    bottom: -25px;

    display: block;

    width: 100%;
    padding: 0;
    margin: 0;

    list-style: none;

    text-align: center;
}
.slick-dots li
{
    position: relative;

    display: inline-block;

    width: 20px;
    height: 20px;
    margin: 0 5px;
    padding: 0;

    cursor: pointer;
}
.slick-dots li button
{
    font-size: 0;
    line-height: 0;

    display: block;

    width: 20px;
    height: 20px;
    padding: 5px;

    cursor: pointer;

    color: transparent;
    border: 0;
    outline: none;
    background: transparent;
}
.slick-dots li button:hover,
.slick-dots li button:focus
{
    outline: none;
}
.slick-dots li button:hover:before,
.slick-dots li button:focus:before
{
    opacity: 1;
}
.slick-dots li button:before
{
    font-family: 'slick';
    font-size: 6px;
    line-height: 20px;

    position: absolute;
    top: 0;
    left: 0;

    width: 20px;
    height: 20px;

    content: '•';
    text-align: center;

    opacity: .25;
    color: black;

    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
.slick-dots li.slick-active button:before
{
    opacity: .75;
    color: black;
}
        </style>
    </head>
    <body>
        <div class="container">
        <div class="main">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="form-img">
                        <img src="./admin/assets/upload/<?php echo $setting['logo']; ?>" alt="" class="card-img-top">
                    </div>
                </div>
                <div class="col-md-6">
                    <?php
                        if(isset($_SESSION['msg'])){ 
                    ?>
                        <div class="alert alert-success alert-dismissible fade show mt-4" role="alert">
                            <?php echo $_SESSION['msg'] ?>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    <?php 
                        unset($_SESSION["msg"]);
                        }
                    ?>

                    <?php
                        if(isset($_SESSION['err'])){ 
                    ?>
                        <div class="alert alert-danger alert-dismissible fade show mt-4" role="alert">
                            <?php echo $_SESSION['err'] ?>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    <?php 
                        unset($_SESSION["err"]);
                        }
                    ?>
                    <div class="form-submit">
                        <form id="regiration_form" novalidate action="action.php" method="post" enctype="multipart/form-data">
                            <fieldset>
                                <h2 class="text-center">Step 1: Add User Details</h2>
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" class="form-control" id="name" name="name" required placeholder="Enter Your Name" />
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <input type="text" class="form-control" id="address" name="address" required placeholder="Enter Your Address" />
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input type="number" class="form-control" id="phone" name="phone" required placeholder="Enter Your Phone" />
                                </div>
                                <input type="button" name="password" class="next btn btn-dark" value="Next" />
                            </fieldset>
                            <fieldset>
                                <h2 class="text-center">Step 2: Add Vehicles Details</h2>
                                <div class="form-group">
                                    <label for="vehicle_maker">Vehicle Make</label>
                                    <input type="text" class="form-control" name="vehicle_maker" id="vehicle_maker" required placeholder="Enter Vehicle Maker" />
                                </div>
                                <div class="form-group">
                                    <label for="vehicle_model">Vehicle Model</label>
                                    <input type="text" class="form-control" name="vehicle_model" id="vehicle_model" required placeholder="Enter Vehicle Model" />
                                </div>
                                <div class="form-group">
                                    <label for="vehicle_year">Vehicle Year</label>
                                    <input type="text" class="form-control" name="vehicle_year" id="vehicle_year" required placeholder="Enter Vehicle Year" />
                                </div>
                                <input type="button" name="previous" class="previous btn btn-light" value="Previous" />
                                <input type="button" name="next" class="next btn btn-dark" value="Next" />
                            </fieldset>
                            <fieldset>
                                <h2 class="text-center">Step 3: Agree Details</h2>
                                <div class="form-group">
                                    <label for="category">Category</label>
                                    <select name="category" id="category" class="form-control">
                                        <option>Select Category</option>
                                        <?php 
                                            $category_query = "SELECT * FROM category";
                                            if($cat_result = mysqli_query($conn, $category_query)){
                                                if(mysqli_num_rows($cat_result) > 0){
                                                    while($cat_row = mysqli_fetch_array($cat_result)){
                                                    ?>
                                                        <option value="<?php echo $cat_row['name'] ?>"><?php echo $cat_row['name'] ?></option>
                                                    <?php 
                                                    }
                                                }
                                            }
                                        ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="checkbox" name="checkbox">
                                    <span style="color:white;">I (We) Agree to hold The little Big Show and/or its members, harmless for any incident that occurs during the event or while on the premises.</span>
                                </div>
                                <input type="button" name="previous" class="previous btn btn-light" value="Previous" />
                                <input type="submit" name="submit" class="submit btn btn-dark" value="Submit" />
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
           
        </div>

        <div class="container mt-5" style="padding: 0px;">
                <div class="slider" style="padding: 0px 15px;">
                    <div class="slide-track">
                        <div class="slide"> 
                            <?php for($n=0; $n<=$i; $n++){ ?>
                                <div>
                                    <img src="images/sponsers/<?php echo $n; ?>.jpg" alt="" style="height: auto; width: 120px; border-radius: 12px;">
                                </div> 
                            <?php } ?> 
                        </div> 
                    </div>       
                </div>
             </div> 
        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                const slider = document.querySelector('.slide-track');
                let slides = Array.from(slider.children);
                const totalWidth = slides.reduce((total, slide) => total + slide.offsetWidth, 0);
                slider.innerHTML += slider.innerHTML; // Duplicate slides for a seamless loop

                let speed = 0.5; // Control the speed of the slide
                let posX = 0;

                function moveSlides() {
                    posX -= speed;
                    if (posX <= -totalWidth) {
                        posX = 0;
                    }
                    slider.style.transform = `translateX(${posX}px)`;
                    requestAnimationFrame(moveSlides);
                }

                requestAnimationFrame(moveSlides);
            }); 
        </script>

        <script>
          $(document).ready(function(){

            $('.sponsers').slick({
                dots: true,
                infinite: true,
                speed: 300,
                slidesToShow: 1,
                centerMode: true,
                variableWidth: true
            });
      

          var current = 1,current_step,next_step,steps;
          steps = $("fieldset").length;
            $(".next").click(function(){
              current_step = $(this).parent();
              next_step = $(this).parent().next();
              next_step.show();
              current_step.hide();
              setProgressBar(++current);
            });
            $(".previous").click(function(){
              current_step = $(this).parent();
              next_step = $(this).parent().prev();
              next_step.show();
              current_step.hide();
              setProgressBar(--current);
            });
            setProgressBar(current);
            // Change progress bar action
            function setProgressBar(curStep){
              var percent = parseFloat(100 / steps) * curStep;
              percent = percent.toFixed();
              $(".progress-bar")
                .css("width",percent+"%")
                .html(percent+"%");   
            }
          });
        </script>
    </body>
</html>
