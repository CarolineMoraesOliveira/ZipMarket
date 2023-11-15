<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view article</title>
</head>
<body>
<h1>Article Details </h1>

<div>
<a href="/">Log out</a>
<a href="/dashboard">Dashboard</a>
</div>

 <h2>Posted By: <c:out value="${item.personWhoIsGoingToDonate.getUserName()}"></c:out></h2>
 
 <div>
	   <img src="data:image/*;base64,${item.getBase64Image()}" width="100" height="100">  <br>
   <p> Name: <c:out value="${ item.articleName}"></c:out> <br> </p>
	<p> Description: <c:out value="${ item.description}"></c:out> </p>

	</div>
	<c:if test="${userId == item.personWhoIsGoingToDonate.id }">
<a href="/donation/${donationId}/edit">edit</a>
<a href="/donation/delete/${donationId}">delete</a>
</c:if>
<a href="/view/user/${item.personWhoIsGoingToDonate.id}"> I'm interested</a>
</body>
</html>