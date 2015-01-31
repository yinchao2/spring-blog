<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title"></tiles:getAsString></title>
</head>
<body>
<tilesx:useAttribute name="current"/>

	<div class="container">

		<!-- Static navbar -->
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="<c:url value="/index.html" />">String blog</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="${current == 'index'? 'active' : ''}"><a href="<c:url value="/index.html" />">Home</a></li>
						<security:authorize access="hasRole('ROLE_ADMIN')">
							<li class="${current == 'users'? 'active' : ''}"><a href="<c:url value="/users.html" />">Users</a></li>
						</security:authorize>
						<li class="${current == 'register'? 'active' : ''}"><a href="<c:url value="/register.html" />">Register</a></li>
			
						<security:authorize access="!isAuthenticated()">
							<li class="${current == 'login'? 'active' : ''}"><a href="<c:url value="/login.html" />">Login</a></li>
						</security:authorize>
						
						<security:authorize access="isAuthenticated()">
							<li class="${current == 'account'? 'active' : ''}"><a href="<c:url value="/account.html" />">My account</a></li>
							<li><a href="<c:url value='/logout'/>">Logout</a></li>
						</security:authorize>
					</ul>
					
				</div>
				<!--/.nav-collapse -->
			</div>
			<!--/.container-fluid -->
		</nav>

		<div class="jumbotron">
			<tiles:insertAttribute name="body" />
		</div>
		
		<center>
			<tiles:insertAttribute name="footer" />
		</center>
	</div>

</body>
</html>