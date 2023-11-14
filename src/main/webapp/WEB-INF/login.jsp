<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login/Registration</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"  type="text/css" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->   
</head>
<body background="https://e0.pxfuel.com/wallpapers/252/1013/desktop-wallpaper-tfw-you-don-t-have-an-21-9-monitor-for-rad-ultrawide-16-9.jpg" style="font-family: monospace; background-size: cover;">
    <div class="container">
        <br>
        <img  class="image1" src="/images/logo.png" alt="duke">
        <div class="row">
            <div class="col">
                <h2 class="display-5 text-white">Register</h2>
                <div class="bodyb">
                    <div class="card shadow" style="background-color: rgb(19, 16, 16);">
                        <div class="card-body">
                            <form:form action="/register" method="POST" modelAttribute="newUser" >
                                <div class="mb-3">
                                    <form:label path="name" class="form-label text-white" >First Name</form:label>
                                    <form:input path="name" class="form-control"/>
                                    <form:errors path="name" class="form-text text-warning"/>
                                </div>
                                <div class="mb-3">
                                    <form:label path="userName" class="form-label text-white">User Name</form:label>
                                    <form:input path="userName" class="form-control"/>
                                    <form:errors path="userName" class="form-text text-warning"/>
                                </div>
                                <div class="mb-3">
                                    <form:label path="zipCode" class="form-label text-white">Zip Code</form:label>
                                    <form:input path="zipCode" class="form-control" type="number"/>
                                    <form:errors path="zipCode" class="form-text text-warning"/>
                                </div>
                                <div class="mb-3">
                                    <form:label path="email" class="form-label text-white">Email</form:label>
                                    <form:input path="email" class="form-control"/>
                                    <form:errors path="email" class="form-text text-warning"/>
                                </div>
                                <div class="mb-3">
                                    <form:label path="password" class="form-label text-white">Password</form:label>
                                    <form:input path="password" class="form-control" type="password"/>
                                    <form:errors path="password" class="form-text text-warning"/>
                                </div>
                                <div class="mb-3">
                                    <form:label path="confirm" class="form-label text-white">Confirm Password</form:label>
                                    <form:input path="confirm" class="form-control" type="password"/>
                                    <form:errors path="confirm" class="form-text text-warning"/>
                                </div>
                                <div  id="container2" class="text-end">
                                    <button type="submit" class="btn btn-info"><span>Register</span></button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <h2 class="display-5 text-white ">Login</h2>
                <div class="card shadow" style="background-color: rgb(19, 16, 16);">
                    <div class="card-body">
                        <form:form action="/login" method="POST" modelAttribute="newLogin">
                            <div class="mb-3">
                                <form:label path="email" class="form-label text-white">Email</form:label>
                                <form:input path="email" class="form-control"/>
                                <form:errors path="email" class="form-text text-warning"/>
                            </div>
                            <div class="mb-3">
                                <form:label path="password" class="form-label text-white">Password</form:label>
                                <form:input path="password" class="form-control" type="password"/>
                                <form:errors path="password" class="form-text text-warning"/>
                            </div>
                            <div  id="container2" class="text-end">
                                <button type="submit" ><span>Login</span></button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>