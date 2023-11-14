<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create your Donation</title>
</head>
<body>
<h1>Create Your Donation here!</h1>
<p>Please give us information as much as you can about your donation.</p>
<form:form action="/create/donation" method="POST" modelAttribute="item">

<div class="mb-3">
<form:label path="articleName">Name:</form:label>
<form:input path="articleName" type="text"/>
<form:errors path="articleName" class="form-text text-danger" />
</div>

<div class="mb-3">
<form:label path="description"> Description: </form:label>
<form:input path="description" type="text"/>
<form:errors path="description"  class="form-text text-danger"/>
</div>

<div class="mb-3">
<form:label path="articleImage">Add your picture here</form:label>
<form:input path="articleImage"  type="file" accept="image/*" />
<form:errors path="articleImage" class="form-text text-danger"  />
</div>
 <input type="submit" value="Submit">
</form:form>
</body>
</html>