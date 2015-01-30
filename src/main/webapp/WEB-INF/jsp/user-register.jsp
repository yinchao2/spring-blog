<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<form:form  cssClass="form-horizontal" commandName="user">

	<c:if test="${param.success != null }">
		<div class="alert alert-success">You register successfully!</div>
	</c:if>

  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
    <div class="col-sm-10">
      <form:input type="text" path="name" cssClass="form-control" />
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
       <form:password path="password" cssClass="form-control" />
       <form:errors path="password" cssClass="text-danger" />
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-primary">Save</button>
    </div>
  </div>
</form:form>