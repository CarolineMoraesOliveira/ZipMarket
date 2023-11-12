<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			
</body>
</html> -->

<!-- this came from the main branch !!!! -->

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
    <title>Dashboard</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->   
</head>
<body style="font-family: fantasy;">
<div class="container3">
    <div>
        <h1 class="display-3 p-3 ">Welcome to the ZipMarket "${newUser.userName}"</h1>
    </div>
    <div  id="container2">
        <a href="/logout"><button><span>Logout</span></button></a>
    </div>
</div>
<div id="bodyneon">
    <a  class="a p-3 " style="font-size: x-large;" href="/create">
        <span id="span2"></span>
        <span id="span2"></span>
        <span id="span2"></span>
        <span id="span2"></span>
        + Create your donation
    </a>
</div>
<div>


<!-- INSERT FILTER HERE!!!!! -->

    <!-- <label for="cars">Choose a car:</label>

    <select name="cars" id="cars">
      <option value="volvo">Volvo</option>
      <option value="saab">Saab</option>
      <option value="mercedes">Mercedes</option>
      <option value="audi">Audi</option>
    </select> -->

<body>
	<div class="bodypicture">
		<div class="containerpicture">
			<div class="box">
				<div class="imgBx">
					<img src="/images/img1.jpg">
				</div>
				<div class="content">
					<div>
						<h2>Image Title</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua.</p>
					</div>
				</div>
			</div>
			<div class="box">
				<div class="imgBx">
					<img src="/images/img2.jpg">
				</div>
				<div class="content">
					<div>
						<h2>Image Title</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua.</p>
					</div>
				</div>
			</div>
			<div class="box">
				<div class="imgBx">
					<img src="/images/img3.jpg">
				</div>
				<div class="content">
					<div>
						<a href="#"><h2>CHICA COOL</h2></a>
					</div>
				</div>
			</div>
			<div class="box">
				<div class="imgBx">
					<img src="/images/img4.jpg">
				</div>
				<div class="content">
					<div>
						<h2>Image Title</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>


</body>
</html>