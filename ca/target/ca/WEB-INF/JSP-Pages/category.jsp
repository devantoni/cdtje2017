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
	<header>
		<!-- Fixed navbar -->
		<jsp:include page="menu.jsp"></jsp:include>
	</header>
	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Create Category</h1>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<!-- Example row of columns -->
		<div class="row">
			<div class="col-md-12">
				<div class="well well-sm">
					<form:form modelAttribute="Category" action="addcategory" method="post">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<form:input type="text" class="form-control"
										placeholder="Category Name" path="categoryname" required="true"></form:input>
								</div>
								<div class="form-group">
									<form:input type="textarea" class="form-control"
										placeholder="Category Description" path="categorydescriptions" required="true"></form:input>
								</div>

							</div>
							
							<div class="col-md-12">
								<button type="submit" class="btn btn-primary pull-right"
									id="btnCategory">Create Category</button>
							</div>
						</div>
					</form:form>
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