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
<form:form cssClass="form-horizontal blogForm" commandName="blog">
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
							<form:errors path="name" cssClass="text-danger" />
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">Url</label>
						<div class="col-sm-10">
							<form:input type="text" path="url" cssClass="form-control" />
							<form:errors path="url" cssClass="text-danger" />
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<input type="submit" value="Save" class="btn btn-primary" />
				</div>
			</div>
		</div>
	</div>
</form:form>

<br/></br/>

<script type="text/javascript">
	$(document).ready(function() {
		$('.nav-tabs a:first').tab('show') // Select first tab
		
		$(".triggerRemove").click(function(e) {
			e.preventDefault();
			$("#modalRemove .removeBtn").attr("href", $(this).attr("href"));
			$("#modalRemove").modal();
		});
		
		$(".blogForm").validate(
			{
				rules: {
					name: {
						required: true,
						minlength: 6
					},
					url: {
						required: true,
						url: true
					}
				},
				highlight: function(element) {
					$(element).closest('.form-group').removeClass('has-success').addClass('has-error');
				},
				unhighlight: function(element) {
					$(element).closest('.form-group').removeClass('has-error').addClass('has-success');
				}
			}		
		);
	});
</script>

<div role="tabpanel">

	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
		<c:forEach items="${user.blogs}" var="blog">
			<li role="presentation"><a href="#blog_${blog.id}" role="tab" data-toggle="tab"><c:out value="${blog.name}" /></a></li>
		</c:forEach>
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<c:forEach items="${user.blogs}" var="blog">
		<div role="tabpanel" class="tab-pane" id="blog_${blog.id}">
			<h3>
				<b>Blog:</b>
				<c:out value="${blog.name}" />
			</h3>
			<a href="<c:url value="/blog/remove/${blog.id}.html" />" class="btn btn-danger triggerRemove" >Remove blog</a>
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
		</div>
		</c:forEach>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="modalRemove" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Remove blog</h4>
      </div>
      <div class="modal-body">
        Are you sure you want to remove this blog?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <a href="" class="btn btn-danger removeBtn">Remove</a>
      </div>
    </div>
  </div>
</div>

