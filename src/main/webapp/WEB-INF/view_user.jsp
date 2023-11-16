<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>View User</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/style.css">
	<!-- change to match your file/naming structure -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/app.js"></script>
	<!-- change to match your file/naming structure -->
</head>
<body style=" font-family: fantasy; background-color: black;">

<h1 class="display-3 p-4  text-white ">Get in contact with <c:out value="${ user.name}"></c:out></h1>

<div id="container2">
	<a href="/logout"><button><span>Logout</span></button></a>
</div>
<div class="text-white " style="margin-left: 30px;">
	<h2> name : <c:out value="${ user.name}"></c:out></h2>
	<h2> UserName : <c:out value="${ user.userName}"></c:out></h2>
	<h2> Email :<c:out value="${user.email}"></c:out></h2>
</div>
	<div class="  align-content-center" id="container2">
		<a href="/dashboard"><button><span>Dashboard</span></button></a>
	</div>
</body>
</html>