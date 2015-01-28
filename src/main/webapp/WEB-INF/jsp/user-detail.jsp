<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2><b><c:out value="${user.name}" /></b></h2>

<c:forEach items="${user.blogs}" var="blog">

	<h3><c:out value="${blog.name}" /></h3>
	<c:out value="${blog.url}" /><br/><br/>
	
		<table class="table table-bordered table-hover table-striped">
			<thead>
				<tr>
					<th>Title</th>
					<th>Link</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${blog.items}" var="item">
					<tr>
						<td><c:out value="${item.title}" /></td>
						<td><c:out value="${item.link}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>	
	
</c:forEach>