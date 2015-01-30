<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h2>
	Welcome <b><c:out value="${user.name}" /></b>!
</h2>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal"
	data-target="#myModal">Create New Blog</button>


<!-- Modal -->

<form:form cssClass="form-horizontal" commandName="blog">
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">New Blog</h4>
			</div>
			<div class="modal-body">

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						<form:input type="text" path="name" cssClass="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">Url</label>
					<div class="col-sm-10">
						<form:input type="text" path="url" cssClass="form-control" />
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<input type="submit" value="Save" class="btn btn-primary"  />
			</div>
		</div>
	</div>
</div>
</form:form>

<c:forEach items="${user.blogs}" var="blog">

	<h3>
		<b>Blog:</b>
		<c:out value="${blog.name}" />
	</h3>
	<c:out value="${blog.url}" />
	<br />
	<br />

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