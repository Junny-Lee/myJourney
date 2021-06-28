<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!-- bootstrap -->
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form"%>
<!-- to format date -->
<%@ taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Post</title>
<!-- bootstrap -->
<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- link css -->
<link rel="stylesheet" type="text/css" href="/css/eventPage.css">
</head>
<body>
	<div id="navbar">
		<a href="/logout" class="aTags">Log out</a>
	</div>
	<h2 id="logo"><a href="/" id="logoTag">My Journey</a></h2>
	<div id="main">
		<div id="leftSide">
			<h3>${p.title}</h3><br>
			<p>Host: ${p.creator.firstName} ${p.creator.lastName}</p>
			<p>Date: <fmt:formatDate value="${p.date}" pattern="MMMM dd, yyyy"/></p>
			<p>Text: ${p.text}</p>
		</div>
	</div>
</body>
</html>