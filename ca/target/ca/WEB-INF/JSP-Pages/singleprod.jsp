<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  <body ng-app="niit.ca" ng-controller="ProductDetailsController">
    

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="resources/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="resources/angular/angular.js"></script>
    <script>
      var productdetails = ${pro};
      angular.module('niit.ca', []).controller(
          'ProductDetailsController', function($scope) {
            $scope.pdo = productdetails;
          });
    </script>
    <header>
		<!-- Fixed navbar -->
	    <jsp:include page="menu.jsp" />
    </header>
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <img src="resources/Pimage/{{pdo.productid}}.jpg" alt="{{pdo.productname}}" class="img-responsive img-thumbnail img-rounded">
        </div>
        <div class="col-md-8">
            <h2>{{pdo.productname}}</h2>
            <p><strong>Starting at: </strong>Rs.{{pdo.productprice}}</p>
            <hr>
            <p>{{pdo.productdescription}} </p>
            <p><a href="#" class="btn btn-primary" role="button">Add to cart</a></p>
        </div>
        
        <div class="col-md-12">
          <hr>
          <h2 class="text-center">Product Description &amp; Specification</h2>
          <p>{{pdo.productdescription}}</p>
        </div>  
      </div>
    <hr>
      <footer>
        <p>&copy; 2017 Company, Inc.</p>
      </footer>
    </div> <!-- /container -->

  </body>

  
</html>