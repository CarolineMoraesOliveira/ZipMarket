<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<title>Dashboard</title>
</head>
<body>
Welcome to the ZipMarket @<c:out value="${newUser.userName}">!</c:out>

<a class="btn btn-primary" href="/donate" role="button">Create your donation +</a>
Create a donation
<a href="/">Log out</a>
Select a ZipCode:
<form:form method="post" action="/selected_zipcode" modelAttribute="newUser">
	<form:label path="zipCode">ZipCode</form:label>
	<form:select path="zipCode">
		<c:forEach var="eachUser" items="${users}">
			<form:option path="zipCode" value="${eachUser.zipCode}">
				<c:out value="${eachUser.zipCode}" />
			</form:option>
		</c:forEach>
	</form:select>
</form:form>
			
	<div> <h1>Post test</h1>
		<c:forEach var="creator" items="${item }" >
	<c:out value="${ creator.description}"></c:out>
  <c:out value="${creator.getBase64Image()}"></c:out> 
	   <img src="data:image/jpeg;base64,${creator.getBase64Image()}" alt="Article Image">
	</c:forEach>
	</div>
</body>
</html>