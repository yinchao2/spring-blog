<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<style>
	.error {
		color: red;
	}
</style>
<form:form  cssClass="form-horizontal registrationForm" commandName="user">

	<c:if test="${param.success != null }">
		<div class="alert alert-success">You register successfully!</div>
	</c:if>

  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
    <div class="col-sm-10">
      <form:input type="text" path="name" cssClass="form-control" id="username" />
      <form:errors path="name" cssClass="text-danger" />
    </div>
  </div>
   <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <form:input type="text" path="email" cssClass="form-control" />
      <form:errors path="email" cssClass="text-danger" />
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
       <form:password path="password" cssClass="form-control" id="password" />
       <form:errors path="password" cssClass="text-danger" />
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Password again</label>
    <div class="col-sm-10">
       <input type="password" name="password_again" class="form-control" id="password_again" />
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-primary">Save</button>
    </div>
  </div>
</form:form>

<script>
$(".registrationForm").validate(
	{
		rules: {
			name: {
				required: true,
				minlength: 3,
				remote: {
			        url: "<c:url value='/register/available.html' />",
			        type: "get",
			        data: {
			          username: function() {
			            return $( "#username" ).val();
			          }
			        }
			    }
			},
			email: {
				required: true,
				email: true
			},
			password: {
				required: true,
				minlength: 5
			},
			password_again: {
				required: true,
				minlength: 5,
				equalTo: "#password"
			}
		},
		highlight: function(element) {
			$(element).closest('.form-group').removeClass('has-success').addClass('has-error');
		},
		unhighlight: function(element) {
			$(element).closest('.form-group').removeClass('has-error').addClass('has-success');
		},
		messages: {
			name: {
				remote: "Such username already exists!"
			}
		}
	}		
);
</script>