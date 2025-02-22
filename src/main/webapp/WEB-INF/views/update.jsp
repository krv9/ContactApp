<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./base.jsp" %>    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Contact</title>
</head>
<body>
    <div class="container mt-3">
        <h1 class="text-center">Update Existing Contact</h1>
        <div class="container">
            <form action="${pageContext.request.contextPath }/handle-contact" method="post">

                <!-- Fix: Corrected name="id" and made it readonly -->
                <div class="form-group">
                    <label>Id</label>
                    <input type="text" class="form-control" name="id" value="${contact.id}" readonly>
                </div>

                <div class="form-group">
                    <label>Name</label>
                    <input type="text" class="form-control" name="name" value="${contact.name}">
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control" name="email" value="${contact.email}">
                </div>

                <div class="form-group">
                    <label>Phone</label>
                    <input type="text" class="form-control" name="phone" value="${contact.phone}">
                </div>    

                <div class="container text-center mt-3">
                    <a href="${pageContext.request.contextPath }" class="btn btn-success">Back</a>
                    <input type="submit" class="btn btn-primary" value="Update Contact">
                </div>                
            </form>
        </div>
    </div>
</body>
</html>
