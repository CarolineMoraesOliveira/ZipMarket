<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
</head>
<body>
Welcome to the ZipMarket @<c:out value="${newUser.userName}">!</c:out>

<form action="/create_donation" method="get">
   	<button type="submit" value="submit">+</button>
</form>
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
			
</body>
</html>