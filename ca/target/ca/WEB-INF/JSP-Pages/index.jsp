<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>My Shop - Computer pheripherals</title>

    <!-- Bootstrap -->
    <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="resources/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/bootstrap/js/bootstrap.min.js"></script>
    <header>
		<!-- navbar -->
		<jsp:include page="menu.jsp"></jsp:include>
	</header>
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
      	<div class="row">
      		<div class="col-md-8">
		        <h1>Welcome to My Shop!</h1>
		        <p>Launching MAC Book for $499 only !</p>
		        <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more &raquo;</a></p>
	        </div>
	        <div class="col-md-4">
	        	<img class="img-responsive" alt="Mac Book" src="resources/branding/mac.png">
	        </div>
        </div>
      </div>
    </div>

    <div class="container">

	  <!-- Featured Items-->
	  <div class="row">
	  	<div class="col-md-12">
	  		<h2 class="text-center">Featured Items</h2>
	  	</div>
	  </div>

	  <hr>

      <div class="row">
        <div class="col-sm-6 col-md-3">
        	<div class="thumbnail">
          		<img src="resources/products/placeholder.png" alt="Intel chipset">
          	</div>
          	<div class="caption">
          		<h3>Pentium</h3>
          		<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          		<p><a href="single-product.html" class="btn btn-primary" role="button">View Details</a> <a href="#" class="btn btn-default" role="button">Add to cart</a></p>
        	</div>
    	</div>
        <div class="col-sm-6 col-md-3">
        	<div class="thumbnail">
          		<img src="resources/products/placeholder.png" alt="Intel chipset">
          	</div>
          	<div class="caption">
          		<h3>Pentium</h3>
          		<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
				<p><a href="single-product.html" class="btn btn-primary" role="button">View Details</a> <a href="#" class="btn btn-default" role="button">Add to cart</a></p>
			</div>  
        </div>
        <div class="col-sm-6 col-md-3">
          	<div class="thumbnail">
          		<img src="resources/products/placeholder.png" alt="Intel chipset">
	      	</div>
	      	<div class="caption">
	      		<h3>Pentium</h3>
	      		<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
				<p><a href="single-product.html" class="btn btn-primary" role="button">View Details</a> <a href="#" class="btn btn-default" role="button">Add to cart</a></p>
	    	</div>
        </div><div class="col-sm-6 col-md-3">
          	<div class="thumbnail">
          		<img src="resources/products/placeholder.png" alt="Intel chipset">
	      	</div>
	      	<div class="caption">
	      		<h3>Pentium</h3>
	      		<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
				<p><a href="single-product.html" class="btn btn-primary" role="button">View Details</a> <a href="#" class="btn btn-default" role="button">Add to cart</a></p>
	    	</div>
        </div>
      </div>

      <hr>

      <footer>
        <p>&copy; 2017 Company, Inc.</p>
      </footer>
    </div> <!-- /container -->

  </body>

  
</html>