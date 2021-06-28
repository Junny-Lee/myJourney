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
<link rel="stylesheet" type="text/css" href="/css/home.css">
</head>
<body>
	<div id="navBar">
		<h2 id="logo"><a href="/home" id="logoTag">My Journey</a></h2>
		<div id="links">
			<a href="/logout" class="aTags">Logout</a>
		</div>
	</div>
	<div id="main">
		<div id="notebookName">
		<h2 id="welcome"><c:out value="${user.firstName}"/>'s Journal</h2>
<%-- 		<div id="options">
			<form:form action="/posts" method="post" modelAttribute="post" id="newForm">
			    <button type="submit" class="btn btn-primary">See all entries</button>
			</form:form>
			<form:form action="/newPost" method="post" modelAttribute="post" id="newForm">
			    <button type="submit" class="btn btn-primary">Add Entry</button>
			</form:form>
		</div> --%>
		<div id="icons">
			<form:form action="/newPost" method="post" modelAttribute="post" id="formNewEntry">
				    <button type="submit" class="btn btn-link" data-toggle="popover" data-trigger="hover" id="newEntry"><img src="https://img.icons8.com/ios/40/000000/create-new.png"/>New Entry</button>
			</form:form>
			<form:form action="/posts" method="post" modelAttribute="post" id="formViewEntries">
				    <button type="submit" class="btn btn-link" data-toggle="popover" data-trigger="hover"><img src="https://img.icons8.com/ios/40/000000/list--v2.png"/></button>
			</form:form>
			<form:form action="" method="post" modelAttribute="post" id="formSettings">
				    <button type="submit" class="btn btn-link" data-toggle="popover" data-trigger="hover"><img src="https://img.icons8.com/ios/40/000000/settings--v1.png"/></button>
			</form:form>
		</div>
		<br>
		</div>
	</div>
</body>
</html>