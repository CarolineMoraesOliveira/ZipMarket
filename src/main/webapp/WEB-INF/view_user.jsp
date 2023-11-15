<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View User</title>
</head>
<body>
<h1>Get in contact with the <c:out value="${ user.name}"></c:out></h1>

<a href="/">Logout</a>
<a href="/dashboard">Dashboard</a>


	<p> name : <c:out value="${ user.name}"></c:out></p>
	<p> UserName : <c:out value="${ user.userName}"></c:out></p>
	<p> Email :<c:out value="${user.email}"></c:out></p>
	
	<!-- <a href="/view/${item.id}">get back to article details</a> could not get it to work--> 
	
</body>
</html>