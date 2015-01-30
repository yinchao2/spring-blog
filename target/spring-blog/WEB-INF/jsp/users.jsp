<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
	$(document).ready(function() {
		
		$(".triggerRemove").click(function(e) {
			e.preventDefault();
			$("#modalRemove .removeBtn").attr("href", $(this).attr("href"));
			$("#modalRemove").modal();
		});
		
	});
</script>

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
				<td><a href="<c:url value="/user/remove/${user.id}.html" />" class="btn btn-danger triggerRemove">Remove</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<!-- Modal -->
<div class="modal fade" id="modalRemove" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Remove blog</h4>
      </div>
      <div class="modal-body">
        Are you sure you want to remove this user?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <a href="" class="btn btn-danger removeBtn">Remove</a>
      </div>
    </div>
  </div>
</div>