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
<link rel="stylesheet" type="text/css" href="/css/newPost.css">
</head>
<body>
	<div id="navBar">
		<a href="/posts" class="aTags">Back</a>
		<h2 id="logo"><a href="/home" id="logoTag">My Journey</a></h2>
		<a href="/logout" class="aTags">Logout</a>
	</div>
	<div id="main">
	 	<form:form action="/createPost" method="post" modelAttribute="post" id="newForm">
			<form:hidden value="${user.id}" path="creator"/>
		    <div class="form-group col-md-12">
		        <form:input path="title" type="text" class="form-control" id="title" placeholder="Entry Title"/>
		        <button type="submit" class="btn btn-primary">Save</button>
		    </div>
		    <hr>
			 <p id="dateRightNow">
			 	&nbsp
			 	<img src="https://img.icons8.com/material-outlined/24/000000/calendar--v1.png"/>
				<script> document.write(new Date().toLocaleDateString()); </script>
			</p>
		    <hr>
		   	<div class="form-group col-md-12">
		        <form:input path="text" type="text" class="form-control" id="text" placeholder="Write text here"/>
		    </div>
		</form:form>
	</div>
</body>
</html>