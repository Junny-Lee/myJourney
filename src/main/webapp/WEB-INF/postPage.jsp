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
<link rel="stylesheet" type="text/css" href="/css/postPage.css">
</head>
<body>
	<div id="navBar">
		<a href="/posts" class="aTags">Back</a>
		<h2 id="logo"><a href="/home" id="logoTag">My Journey</a></h2>
		<a href="/logout" class="aTags">Logout</a>
	</div>
	<div id="main">
		<div id="post">
			<div id="favBar">
				<h3 id="title">${p.title}</h3>
				<c:if test="${p.favorite == false}">
					<a href="/posts/${postId}/favorited" id="favorite"><img src="https://img.icons8.com/windows/20/000000/empty-flag--v1.png"/></a>
				</c:if>
				<c:if test="${p.favorite == true}">
					<a href="/posts/${postId}/favorited" id="favorite"><img src="https://img.icons8.com/color/20/000000/filled-flag.png"/></a>
				</c:if>
			</div><hr>
			<p>
				<img src="https://img.icons8.com/material-outlined/24/000000/calendar--v1.png"/>
				<fmt:formatDate value="${p.createdAt}" pattern="EEE. MM/dd/yyyy"/> at
				<fmt:formatDate type = "time" value="${p.createdAt}" pattern="h:mm aa"/> &nbsp&nbsp | &nbsp&nbsp
				<c:if test="${not empty p.updatedAt}">
					Last update: <fmt:formatDate value="${p.updatedAt}" pattern="EEE. MM/dd/yyyy"/> at
					<fmt:formatDate type = "time" value="${p.updatedAt}" pattern="h:mm aa"/>
				</c:if>&nbsp&nbsp | &nbsp&nbsp
				<c:if test="${p.personal == true }">private</c:if>
       			<c:if test="${p.personal == false }">public</c:if>
			</p>
			<hr>
			<div id="text">
				<p>${p.text}</p>
			</div>
			<div id="editDelete">
				<a href="/posts/${p.id}/edit">Edit</a> &nbsp|&nbsp
				<a href="/posts/${p.id}/delete">Delete</a>
			</div>
		</div>
	</div>
</body>
</html>