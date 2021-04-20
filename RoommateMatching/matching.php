<!DOCTYPE html>
<html lang="en">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Make a Match</title>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">



  <!-- Add custom styles for this page here -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="lib/fontawesome/webfonts/all.css">


  <!-- Main stylesheet -->
  <link rel="stylesheet" href="css/main.css">

</head>

<body>
  <!-- Navigation -->
  <?php
    include "includes/student_nav.php";
  ?>

  <!-- Header -->
  <header class="bg-info py-5 mb-5">
    <div class="container h-50" style="max-height:10%">
      <div class="row h-50 align-items-center">
        <div class="col-lg-12">
          <h1 class="display-4 text-white mt-5 mb-2">
            Make a M A T C H</h1>
          <p class="lead mb-5 text-white-50">Manage your sent and received roommate requests!.</p>
        </div>
      </div>
    </div>
  </header>
    <div class="row" style="width: 60%; margin: auto;">
      <div class="col-6">

        <!-- TODO: populate this left column with the student's info that was clicked from previous page -->

        <div class="card">
          <!-- <img class="card-img-top" src="img/cinder.jpeg" alt="Card image cap"> -->
          <div class="card-body center">
            <h2 class="card-title">Kinsley Sigmund</h2>
            <hr />
            <h3 class="card-text mb-2">Smoker?</h3>
            <i class="fas fa-times fa-5x mb-5" style="color:red;"></i>
            <h3 class="card-text mb-2">Early Riser?</h3>
            <i class="fas fa-check fa-5x mb-5" style="color:green;"></i>
            <h3 class="card-text mb-2">Night owl?</h3>
            <i class="fas fa-times fa-5x" style="color:red;"></i>
          </div>
        </div>
      </div>


      <div class="col-6">
        <div id="myCarousel" class="carousel slide" data-interval="false">


          <!-- TODO: populate each of these cards with the rest of the eligible students in the database -->
          <!--  Will need to keep track of the current student displayed at this index -->

          <!-- Carousel indicators -->
          <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
          </ol>

          <!-- Wrapper for carousel items -->
          <div class="carousel-inner">
            <div class="carousel-item active">
              <div class="card">
                <!-- <img class="card-img-top" src="..." alt="Card image cap"> -->
                <div class="card-body center">
                  <h2 class="card-title">Evan Kurpiewski</h2>
                  <hr />
                  <h3 class="card-text mb-2">Smoker?</h3>
                  <i class="fas fa-times fa-5x mb-5" style="color:red;"></i>
                  <h3 class="card-text mb-2">Early Riser?</h3>
                  <i class="fas fa-check fa-5x mb-5" style="color:green;"></i>
                  <h3 class="card-text mb-2">Night owl?</h3>
                  <i class="fas fa-times fa-5x" style="color:red;"></i>
                  <br />
                </div>
              </div>
            </div>
            <div class="carousel-item">
              <div class="card">
                <!-- <img class="card-img-top" src="..." alt="Card image cap"> -->
                <div class="card-body center">
                  <h2 class="card-title">Gray LeCompote</h2>
                  <hr />
                  <h3 class="card-text mb-2">Smoker?</h3>
                  <i class="fas fa-times fa-5x mb-5" style="color:red;"></i>
                  <h3 class="card-text mb-2">Early Riser?</h3>
                  <i class="fas fa-times fa-5x mb-5" style="color:red;"></i>
                  <h3 class="card-text mb-2">Night owl?</h3>
                  <i class="fas fa-times fa-5x" style="color:red;"></i>
                  <br />
                </div>
              </div>
            </div>
            <div class="carousel-item">
              <div class="card">
                <!-- <img class="card-img-top" src="..." alt="Card image cap"> -->
                <div class="card-body center">
                  <h2 class="card-title">Hilmi</h2>
                  <hr />
                  <h3 class="card-text mb-2">Smoker?</h3>
                  <i class="fas fa-times fa-5x mb-5" style="color:red;"></i>
                  <h3 class="card-text mb-2">Early Riser?</h3>
                  <i class="fas fa-check fa-5x mb-5" style="color:green;"></i>
                  <h3 class="card-text mb-2">Night owl?</h3>
                  <i class="fas fa-times fa-5x" style="color:red;"></i>
                  <br />
                </div>
              </div>
            </div>
          </div>
          <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon bg-info" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon bg-info" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>

    </div>
    <div class="d-flex justify-content-center">
      <button onclick="verifyMatch()" class="btn btn-info w-50" style="color:#FFF;"><h3>Match</h3></button>
    </div>
  <script>
    function verifyMatch() {
      if (confirm("Are you sure you would like to match these two students?")) {
        // TODO: if they confirm then do the php stuff to create a match in the table
        // I am envisioning there would be a way to grab who is at the student in the left column
        // and the current student displayed in the right column (swiping cards)
        // to connect to the database to make the match and update both students
      }
    }
    (function () {
      $('.carousel-showmanymoveone .item').each(function () {
        var itemToClone = $(this);

        for (var i = 1; i < 6; i++) {
          itemToClone = itemToClone.next();

          // wrap around if at end of item collection
          if (!itemToClone.length) {
            itemToClone = $(this).siblings(':first');
          }

          // grab item, clone, add marker class, add to collection
          itemToClone.children(':first-child').clone()
            .addClass("cloneditem-" + (i))
            .appendTo($(this));
        }
      });
    }());


  </script>

  <!-- Footer -->
  <?php include "includes/footer.php"
  ?>

</body>

</html>
