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
	<div id="navbar">
		<a href="/logout" class="aTags">Log out</a>
	</div>
	<h2 id="logo"><a href="/" id="logoTag">My Journey</a></h2>
	<div id="main">
	 	<form:form action="/createPost" method="post" modelAttribute="post" id="newForm">
			<form:hidden value="${user.id}" path="creator"/>
		<%-- 	<form:errors path="name"/>
			<form:errors path="lastName"/>  --%>
		    <div class="mb-3 w-25">
		        <form:label path="title" for="title" class="form-label">Title</form:label>
		        <form:input path="title" type="text" class="form-control" id="title"/>
		    </div>
		    <div class="mb-3 w-25">
		        <label for="date1" class="form-label">Date</label>
		        <input name="date1" type="date" class="form-control" id="date1"/>
		    </div>
		   	<div class="mb-3 w-25">
		        <label for="text" class="form-label">Text</label>
		        <input name="text" type="text" class="form-control" id="text"/>
		    </div>
		    <button type="submit" class="btn btn-info">Create</button>
		</form:form>
	</div>
</body>
</html>