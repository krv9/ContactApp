<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="./base.jsp" %>
</head>
<body>
	
	<div class="container  mt-3">
		<h1 class="text-center">Add new Contact</h1>
		<div class="container"><form action="handle-contact" method="post">
			
			<div class="form-group">
				<label>Name</label>
				<input type="text " class="form-control" name="name"
				placeholder="Enter your Name">
			</div>
			<div class="form-group">
				<label>Email</label>
				<input type="email" class="form-control" name="email"
				placeholder="Enter your Email">
			</div>
			<div class="form-group">
				<label>Phone</label>
				<input type="number" class="form-control" name="phone"
				placeholder="Enter your Phone">
			</div>	
		
		<div class=" container text-center  mt-3">
		<a href="${pageContext.request.contextPath }" class="btn btn-success">Back</a>
			<button class="btn btn-success">AddContact</button>
		</div>
	
			
		</form>
		</div>
	</div>

</body>
</html>