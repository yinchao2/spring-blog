<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table class="table table-bordered table-hover table-striped">
	<thead>
		<tr>
			<th>Users Name</th>
			<th>Operation</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${users}" var="user">
			<tr>
				<td><a href="<c:url value="/users/${user.id}.html" />" ><c:out value="${user.name}" /></a></td>
				<td><a href="<c:url value="/user/remove/${user.id}.html" />" class="btn btn-danger">Remove</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>