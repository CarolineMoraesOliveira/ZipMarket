<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html lang="en" data-bs-theme="dark" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->   
</head>

<body style="font-family: fantasy; background-color: black;">
<div class="container3">
    <div>
        <h1 class="display-3 p-2  text-white ">Welcome to the ZipMarket "${newUser.userName}"</h1>
    </div>
    <div  id="container2" style="">
        <a href="/logout"><button><span>Logout</span></button></a>
    </div>
</div>

<div style="margin-left: 20px;">
<a class="btn btn-ultra-voilet btn-fab"  style="    background: #7474BF;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #348AC7, #7474BF);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #348AC7, #7474BF); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
color: #fff;
border: 3px solid #eee;"  href="/donate" role="button">Create Your Donation</a>
</div>
<br>
<div style="margin-left: 20px;">
	<form:form method="post" action="/${eachUser.zipCode}/show" modelAttribute="newUser">
		<form:label path="zipCode" class="text-white ">ZipCode</form:label>
		<form:select path="zipCode">
			<c:forEach var="eachUser" items="${users}">
				<form:option path="zipCode" value="${eachUser.zipCode}">
					<c:out value="${eachUser.zipCode}" />
				</form:option>
			</c:forEach>
		</form:select>

    <c:forEach var="creator" items="${usersByZipCode}" >
        <p>Article Name: <c:out value="${creator.thingToBeDonate.articleName}"/></p>
        <p>Article Image:</p>
        <img src="data:image/jpeg;base64,${creator.thingToBeDonate.getBase64Image()}" alt="Article Image">
    </c:forEach>
</form:form>
</div>



<div> 
		<c:forEach var="creator" items="${item }" >
	   <img src="data:image/jpeg;base64,${creator.getBase64Image()}" width="100" height="100">
	<a href="/view/${creator.id}"><c:out value="${ creator.articleName}"></c:out></a>
	</c:forEach>
	</div>

	
  
  <div class="bodypicture" style="padding-top: 1;">

		<div class="containerpicture">
			<div class="box">
				<div class="imgBx">
					<img src="/images/phone.jpg">
				</div>
				<div class="content">
					<div>
						<a href="/view/3" class="text-white">Old Phone</a>
						<p>This phone will never brake!</p>
					</div>
				</div>
			</div>
			<div class="box">
				<div class="imgBx">
					<img src="/images/yeezy.webp">
				</div>
				<div class="content">
					<div>
						<a href="/view/2" class="text-white">Yeezy Foam</a>
						<p>They are just ugly as sh&%</p>
					</div>
				</div>
			</div>
			<div class="box">
				<div class="imgBx">
					<img src="/images/Pochita.jpg">
				</div>
				<div class="content">
					<div>
						<a href="/view/1" class="text-white">POCHITA</a>
						<p>  Devil dog with a chainsaw instead of a nose, very powerful and loyal</p>
					</div>
				</div>
			</div>
			<div class="box">
				<div class="imgBx">
					<img src="/images/PC.jpg">
				</div>
				<div class="content">
					<div>
						<a href="/view/4" class="text-white">Brand New iMac</a>
						<p>  Just used once !!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>



