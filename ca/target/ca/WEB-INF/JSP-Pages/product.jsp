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
	var productslist = ${productlist};
	var sl = ${supplierslist};
	var cl = ${categorylist};

	angular.module("niit.ca", []).controller('ProductController',
			function($scope) {
				$scope.productangularobject = productslist;
				$scope.slo = sl;
				$scope.clo = cl;
			});
</script>
</head>
<body ng-app="niit.ca" ng-controller="ProductController">


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="resources/jquery/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>

	<header> <!-- Fixed navbar --> <jsp:include page="menu.jsp"></jsp:include>
	</header>
	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Create Product</h1>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<!-- Example row of columns -->
		<div class="row">
			<div class="col-md-12">
				<div class="well well-sm">
					<form:form modelAttribute="ProductObject" action="addproduct"
						enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									
									<form:input type="text" class="form-control"
										placeholder="Product Name" path="productname" required="true"></form:input>
								</div>
								<div class="form-group">
									<form:input type="text" class="form-control"
										placeholder="Product SKU" path="productsku" required="true"></form:input>
								</div>
								<div class="form-group">
									<form:input type="text" class="form-control"
										placeholder="Product Description" path="productdescription"
										required="true"></form:input>
								</div>
								<div class="form-group">
									<form:input type="text" class="form-control"
										placeholder="Product Price" path="productprice"
										required="true"></form:input>
								</div>
								<div class="form-group">
									<form:input type="text" class="form-control"
										placeholder="Product Quantity" path="productinv"
										required="true"></form:input>
								</div>
								<div class="form-group">
									<form:select path="CategoryId" cssClass="form-control">
										<form:option ng-repeat="c in clo" value="{{c.categoryid}}">
									{{c.categoryname}}
								</form:option>
									</form:select>
								</div>
								<div class="form-group">
									<form:select path="SupplierId" cssClass="form-control">
										<form:option ng-repeat="s in slo" value="{{s.supplierid}}">
									{{s.suppliername}}
								</form:option>
									</form:select>
								</div>
								<div class="form-group">
									<form:input type="file" name="fileToUpload" id="fileToUpload"
										path="PImage" required="true"></form:input>
								</div>
								<c:if test="${check}">
									<form:button id="editbuttons" type="submit" name="Add"
										class="btn">Add
							Details</form:button>
									<form:button id="removebuttons" type="reset" class="btn">Reset
							Details</form:button>
								</c:if>
								<c:if test="${!check}">
									<form:button id="editbuttons" type="submit" name="Edit"
										class="btn">Edit
							Details</form:button>
									<form:button id="removebuttons" type="reset" class="btn">Reset
							Details</form:button>
								</c:if>
							</div>

							
						</div>
					</form:form>
				</div>
			</div>
		</div>

		<div class="panel-body">
			<ul class="list-group">
				<li class="list-group-item" height="45px"
					ng-repeat="product in productangularobject">
					<table style="width: 100%">
						<tr>
							<td><img style="width: 125px; height: 150px"
								src="resources/Pimage/{{product.productid}}.jpg" /></td>
							<td>
								<ul>
									<li><span><b>Product Id: </b></span>{{product.productid}}</li>
									<li><span><b>Product Name: </b></span>{{product.productname}}</li>
									<li><span><b>Product Price: </b></span>{{product.productprice}}</li>
									<li><span><b>Product Stock: </b></span>{{product.productinv}}</li>
									<li><span><b>Product SKU: </b></span>{{product.productsku}}</li>
									<li><span><b>Supplier Id: </b></span>{{product.SupplierId}}</li>
									<li><span><b>Category Id: </b></span>{{product.CategoryId}}</li>
								</ul>
							</td>
							<td><a href="editingproduct?getpid={{product.productid}}"><button
										id="editbuttons" type="submit" class="btn">Edit</button></a> <a
								href="removingproduct/{{product.productid}}"><button
										id="removebuttons" type="button" class="btn">Remove</button></a></td>
						</tr>
					</table>
				</li>
			</ul>
		</div>
		<hr>

		<footer>
		<p>&copy; 2016 Company, Inc.</p>
		</footer>
	</div>
	<!-- /container -->

</body>


</html>