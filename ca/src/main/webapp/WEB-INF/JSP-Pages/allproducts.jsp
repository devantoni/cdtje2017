<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <script src="resources/angular/angular.js"></script>
    <script>
      var prodlist = ${productlist};
      angular.module('niit.ca', []).controller('ProductController',
          function($scope) {
            $scope.productangularobject = prodlist;
          });
    </script>
  </head>
  <body ng-app="niit.ca" ng-controller="ProductController">
    

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="resources/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/bootstrap/js/bootstrap.min.js"></script>
    <header>
    <!-- Fixed navbar -->
     <jsp:include page="menu.jsp" />
    </header>
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1>Shop by categories</h1>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-sm-6 col-md-3" ng-repeat="p in productangularobject">
          <div class="thumbnail">
              <img src="resources/Pimage/{{p.productid}}.jpg" alt="Intel chipset">
          </div>
          <div class="caption">
              <h3>{{p.productname}}</h3>
              <p><strong>Starting at: </strong>Rs.{{p.productprice}}</p>
              <p><a href="viewproduct?getId={{p.productid}}" class="btn btn-primary" role="button">View Details</a>               <a href="addtocart?getProductId={{p.productid}}" class="btn btn-default" role="button">Add to cart</a></p>
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