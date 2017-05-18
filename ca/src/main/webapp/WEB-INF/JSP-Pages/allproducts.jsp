<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<jsp:include page="menu.jsp" />
<body ng-app="niit.ca" ng-controller="ProductController">
	<br />
	<div class="panel panel-success animated fadeInUp delay-04s" style="margin-left: 50px;"
		ng-repeat="p in productangularobject">
		<div class="panel-body">
			<div>
				<a href="viewproduct?getId={{p.productid}}" id="producta">
					<div>
						<img class="img-rounded img-fluid"
							src="resources/Pimage/{{p.productid}}.jpg" height="200px"
							width="200px">


						<div class="lead" style="margin-top: 5px">{{p.productname}}</div>
						<div class="">{{p.productdescription}}</div>
						<hr>
					</div>
				</a>
			</div>
			<div id="pricediv">
				<c:if test="${sessionScope.UserLoggedIn !=null}">
					<a href="addtocart?getProductId={{p.ProductId}}"
						data-toggle="tooltip" title="Add To Cart">
						<button style="margin: 5px;" class="btn pull-left"
							id="addtocartbutton">
							<span class="glyphicon glyphicon-shopping-cart"></span>
						</button>
					</a>
					<a href="viewproduct?getId={{p.ProductId}}" data-toggle="tooltip"
						data-placement="bottom" title="View Product Details">
						<button style="margin: 5px;" class="btn pull-left"
							id="viewproductsbutton">
							<span class="glyphicon glyphicon-menu-hamburger"></span>
						</button>
					</a>
				</c:if>
				<c:if test="${sessionScope.UserLoggedIn == null}">
					<a href="viewproduct?getId={{p.productid}}" class="btn pull-right" id="viewproductsbutton"><span
						class="glyphicon glyphicon-hand-up"></span>&nbsp; View Product</a>
				</c:if>
				<strong style="margin-top: 5px;margin-right: 5px">Rs.{{p.productprice}}</strong>
			</div>
		</div>
	</div>
</body>
</html>