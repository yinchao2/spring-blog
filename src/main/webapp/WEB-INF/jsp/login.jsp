<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

.form-signin {
	max-width: 330px;
	padding: 15px;
	margin: 0 auto;
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin .checkbox {
	font-weight: normal;
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
</style>

<div class="container">

	<form class="form-signin" action="<c:url value="/j_spring_security_check" />" method="POST">
		<h2 class="form-signin-heading">Please sign in</h2>
		
		<c:if test="${param.logout != null}">
			<h2><small class="text-success bg-success">You logout successfully!</small></h2>
		</c:if>
		
		<c:if test="${param.error != null}">
			<h2><small class="text-danger bg-danger">Invalid username and password!</small></h2>
		</c:if>
		
		<label for="inputEmail" class="sr-only">Email address</label> 
		<input type="text" name='j_username' class="form-control" placeholder="username" required autofocus> 
		<label for="inputPassword" class="sr-only">Password</label> 
		<input
			type="password" name='j_password' id="inputPassword"
			class="form-control" placeholder="Password" required>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
			in</button>
	</form>

</div>
