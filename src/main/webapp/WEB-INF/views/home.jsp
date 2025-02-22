<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="./base.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

			<div class="container text-center mt-5">
				<h1>Welcome to Phone Diary!!!</h1>	
			</div>
			<hr>
			
			<div class="container mt-5">
				<div class="row">
					<div class="col-md-12">
						<table class="table">
						  <thead class="table-dark text-light">
						    <tr>
						      <th scope="col">Id</th>
						      <th scope="col">Name</th>
						      <th scope="col">Email</th>
						      <th scope="col">Phone Number</th>
						      <th scope="col">Action</th>
						    </tr>
						  </thead>
						  <tbody class="table-info">
							    <c:if test="${not empty contactList}">
						    		<tbody class="table-info">
						        <c:forEach items="${contactList}" var="t">
						            <tr>
						                <th scope="row">${t.id}</th>
						                <td>${t.name}</td>
						                <td>${t.email}</td>
						                <td>${t.phone}</td>
						                <td>
						                <a href="delete/${t.id}"><i class="fa-solid fa-trash" style="color: #d0061b;"></i></a>
						                <a href="update/${t.id}"><i class="fa-solid fa-pen-to-square" style="color: #021d4b;"></i></a>
						                </td>
						            </tr>
						        </c:forEach>
						    	</tbody>
								</c:if>
								<c:if test="${empty contactList}">
								    <tr>
								        <td colspan="5" class="text-center">No contacts found.</td>
								    </tr>
								</c:if>
						  </tbody>
						</table>
						
					</div>
				</div>
			</div>

			<div class="container text-center mt-5">
				<a href="${pageContext.request.contextPath}/add" class=" btn btn-success">Add New Contact</a>
			</div>

</body>
</html>
