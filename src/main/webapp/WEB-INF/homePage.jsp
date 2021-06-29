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
	<!-- <div id="main"> -->
	<div id="main" style="background-color: ${user.journalColor}">
		<div id="notebookName">
			<h2 id="welcome"><c:out value="${user.firstName}"/>'s Journal</h2>
			<div id="icons">
				<form:form action="/newPost" method="post" modelAttribute="post" id="formNewEntry">
					    <button type="submit" class="btn btn-link" data-toggle="popover" data-trigger="hover" id="newEntry"><img src="https://img.icons8.com/ios/40/000000/create-new.png"/>New Entry</button>
				</form:form>
				<form:form action="/posts" method="post" modelAttribute="post" id="formViewEntries">
					    <button type="submit" class="btn btn-link" data-toggle="popover" data-trigger="hover"><img src="https://img.icons8.com/ios/40/000000/list--v2.png"/></button>
				</form:form>
				<form:form action="/settings" method="post" modelAttribute="post" id="formSettings">
					    <button type="submit" class="btn btn-link"><img src="https://img.icons8.com/ios/40/000000/settings--v1.png"/></button>
				</form:form>
			</div><br>
		</div>
		<div>
		<!-- don't need to use modelAttribute because validations of user comes with it -->
			<form action="/user/${user.id}/process" method="post" id="newForm">
				<input type="hidden" name="_method" value="put">
				<!-- instead of path, it's name -->
				<select name="journalColor" class="form-select form-select-lg mb-3">
					  <option selected value="#a292c7">Pick Color</option>
					  <option value="#ff4d4d">Red</option>
					  <option value="#ff80b3">Pink</option>
					  <option value="#ffff99">Yellow</option>
					  <option value="#73e600">Green</option>
					  <option value="#66a3ff">Blue</option>
					  <option value="#a292c7">Purple (default)</option>
					  <option value="#a6a6a6">Gray</option>
				</select>
				<button type="submit" class="btn btn-link">Change</button>
			</form>
			
<!-- 			<div class="dropdown">
				  	<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
				    <img src="https://img.icons8.com/ios/40/000000/settings--v1.png"/>
				  </button>
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					    <li><a class="dropdown-item" href="#">Action</a></li>
					    <li><a class="dropdown-item" href="#">Another action</a></li>
					    <li><a class="dropdown-item" href="#">Something else here</a></li>
				  </ul>
			</div> -->
		</div>
	</div>
</body>
</html>