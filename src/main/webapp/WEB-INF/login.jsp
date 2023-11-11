<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login and Registration</title>
</head>
<body>
<div class = "top">
	<h1>Welcome!</h1>
	<p>Join our growing community.</p>
</div>
<div class = tables>
	<div>
		<h2 class= "top1">Register</h2>
		<form:form action = "/register" modelAttribute = "newUser" method = "post"> 
		
			<form:label path="userName">Username</form:label><br>
			<form:errors path = "userName"></form:errors>
			<form:input type = "text" path = "userName"/><br>
			
			<form:label path="name">Name</form:label><br>
			<form:errors path = "name"></form:errors>
			<form:input type = "text" path = "name"/><br>
	
			<form:label path="email">Email</form:label><br>
			<form:errors path = "email"></form:errors>
			<form:input type = "text" path = "email"/><br>
			
			<form:label path="zipCode">ZIPCODE</form:label><br>
			<form:errors path = "zipCode"></form:errors>
			<form:input type = "number" path = "zipCode"/><br>
	
			<form:label path="password">Password</form:label><br>
			<form:errors path = "password"></form:errors>
			<form:input type = "password" path = "password"/><br>
	
			<form:label path="confirm">Confirm Password</form:label><br>
			<form:errors path = "confirm"></form:errors>
			<form:input type = "password" path = "confirm"/><br>

			<input type = "submit" value = "Submit"/>
		</form:form>
	</div>
	<div>
		<h2 class="top2">Log in</h2>
		<form:form action = "/login" modelAttribute = "newLogin" method = "post">
	
			<form:label path="email">Email:</form:label><br>
			<form:errors path = "email"></form:errors>
			<form:input type = "email" path = "email"/><br>
		
			<form:label path="password">Password:</form:label><br>
			<form:errors path = "password"></form:errors>
			<form:input type = "password" path = "password"/><br>
	
			<input type = "submit" value = "Submit"/>
		</form:form>
	</div>
</div>
</body>
</html>