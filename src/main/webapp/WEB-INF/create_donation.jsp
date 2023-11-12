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
    <title>Create your idea !!!</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->   
</head>
<body>
    <div class="bodycreate">
        <div class="boxcreate">
            <div class="lightbar"></div>
            <div class="topLayer"></div>
            <h2>Create your donation here</h2>
        </div>
    </div>
    <div  class=" align-content-end " id="container2">
        <a href="/logout"><button><span>Logout</span></button></a>
    </div>
    <div  class="  align-content-end " id="container2">
        <a href="/"><button><span>Dashboard</span></button></a>
    </div>
    <div>
        <form:form action="/ideas" modelAttribute="idea" method="POST">
        <div class="mb-3">
        <form:input path="content" class="form-control" type="text"/>
        <form:errors path="content" class="form-text text-warning"/>
    </div>
    <div class="mb-3">
        <form:errors path="user" class="error"/>
        <form:input type="hidden" path="user" value="${user.id}"/>
    </div>
    <div class="text-end">
        <button type="submit" class="btn btn-success" style="    background: #56ab2f;  /* fallback for old browsers */
        background: -webkit-linear-gradient(to right, #a8e063, #56ab2f);  /* Chrome 10-25, Safari 5.1-6 */
        background: linear-gradient(to right, #a8e063, #56ab2f); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        color: #fff;
        ">Create your doantion</button>
    </div>
    </form:form>
</body>
</html>