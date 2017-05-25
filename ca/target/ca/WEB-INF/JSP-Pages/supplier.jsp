<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</head>
<body>


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="resources/jquery/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/angular/angular.js"></script>

	<script>
		var sup = ${supplierlist};

		angular.module('niit.ca', []).controller('SupplierController',
				function($scope) {
					$scope.supplierangularobject = sup;
				});
	</script>
	<header>
		<!-- Fixed navbar -->
		<jsp:include page="menu.jsp"></jsp:include>
	</header>
	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Create Supplier</h1>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<!-- Example row of columns -->
		<div class="row">
			<div class="col-md-12">
				<div class="well well-sm">
					<form:form modelAttribute="Supplier" action="addsupplier" method="post">
						<div class="row">
							<div class="col-md-12">
								<c:if test="${!check}">
									<div class="form-group">
										<form:input class="form-control" type="hidden" path="Supplierid" ></form:input>
									</div>
								</c:if>
								<div class="form-group">
									<form:input type="text" class="form-control"
										placeholder="Supplier Name" path="suppliername" required="true"></form:input>
								</div>
								<div class="form-group">
									<form:input type="email" class="form-control"
										placeholder="Supplier Email" path="supplieremail" required="true"></form:input>
								</div>

							</div>
							
							<div class="col-md-12">
								<button type="submit" class="btn btn-primary pull-right"
									id="btnCategory">Create Supplier</button>
								<c:if test="${!check}">
								<form:button id="editbuttons" type="submit" name="EditCategory"
								class="btn">Edit Category</form:button>
								</c:if>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
<div class="row">
			<div class="col-md-12">
				<div class="panel">
					<div class="panel-heading">
						<span class="lead">List Of Suppliers</span>
					</div>
					<div class="panel-body" ng-app="niit.ca"
						ng-controller="SupplierController" >
						<ul class="list-group ">
							<li class="list-group-item"	ng-repeat="s in supplierangularobject">
							<div class="row">
								<div class="col-md-8">
									<ul class="list-inline">
										<li><span><b>Supplier Id: </b></span>{{s.supplierid}}</li>
										<li><span><b>Supplier Name: </b></span>{{s.suppliername}}</li>
										<li><span><b>Supplier Email: </b></span>{{s.supplieremail}}</li>
									</ul>
								</div>
								<div class="col-md-4 align-left">
									<a href="editsupplierbutton?getsid={{s.supplierid}}"><button
											id="editbuttons" type="submit" class="btn">Edit</button></a> <a
										href="removingsupplier/{{s.supplierid}}"><button
											id="removebuttons" type="button" class="btn">Remove</button></a>
								</div>
							</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<hr>

		<footer>
			<p>&copy; 2016 Company, Inc.</p>
		</footer>
	</div>
	<!-- /container -->

</body>


</html>