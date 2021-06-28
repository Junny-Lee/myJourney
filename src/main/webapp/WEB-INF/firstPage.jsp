<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- bootstrap -->
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap -->
<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- link css -->
<link rel="stylesheet" type="text/css" href="/css/firstPage.css">
</head>
<body>
<div id="navBar">
	<h2 id="logo"><a href="/" id="logoTag">My Journey</a></h2>
	<div id="links">
		<a href="/register" class="aTags">Sign up</a> &nbsp|&nbsp
		<a href="/loginNow" class="aTags">Log in</a>
	</div>
</div>
	<div id="main">
		<br></br><br></br>
		<h5 class="sentence">Online journal that is private and customizable.</h5>
		<h5 class="sentence">A safe space for your mind.</h5>
		<br><br><br><br><br>
	 	<form:form action="/register" method="post" id="newForm">
		    <button type="submit" class="btn btn-primary">GET STARTED!</button>
		</form:form>
		<br><br>
<%-- 		<h5 class="sentence">Already have an account?</h5>
		<form:form action="/loginNow" method="post" id="newForm">
		    <button type="submit" class="btn btn-link">Log in</button>
		</form:form> --%>
	</div>
</body>
</html>