<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
				<%@ page isErrorPage="true" %>
					<!DOCTYPE html>
					<html>

					<head>
						<meta charset="UTF-8">
						<meta name="viewport" content="width=device-width, initial-scale=1.0">
						<title>View Article</title>
						<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
						<link rel="stylesheet" href="/css/style.css">
						<!-- change to match your file/naming structure -->
						<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
						<script type="text/javascript" src="/js/app.js"></script>
						<!-- change to match your file/naming structure -->
					</head>

					<body style=" font-family: fantasy; background-color: black;">

						<div>
							<h1 class="display-3 p-4  text-white ">Article Details</h1>
						</div>
						<div id="container2">
							<a href="/logout"><button><span>Logout</span></button></a>
						</div>
						<div style="margin-left: 30px;">
							<img src="data:image/*;base64,${item.getBase64Image()}" width="500" height="500">
							<h2 class="text-white "> Name: <c:out value="${ item.articleName}"></c:out> <br> </h2>
							<h2 class="text-white "> Description: <c:out value="${ item.description}"></c:out>
							</h2>
						</div>
						<c:if test="${userId == item.personWhoIsGoingToDonate.id }">
							<a href="/donation/${donationId}/edit" style="margin-left: 30px; font-size: x-large;">edit</a>
							<a href="/donation/delete/${donationId}" style="margin-left: 30px; font-size: x-large;">delete</a>
						</c:if>
						<a href="/view/user/${item.id}" style="margin-left: 30px; font-size: x-large;"> I'm
							interested</a>
						<div class="  align-content-center" id="container2">
							<a href="/dashboard"><button><span>Dashboard</span></button></a>
						</div>
					</body>

					</html>