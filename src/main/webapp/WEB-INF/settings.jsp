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
<link rel="stylesheet" type="text/css" href="/css/settings.css">
</head>
<body>
	<div id="navBar">
		<h2 id="logo"><a href="/home" id="logoTag">My Journey</a></h2>
		<div id="links">
			<a href="/logout" class="aTags">Logout</a>
		</div>
	</div>
	<div id="main" style="background-color: ${user.journalColor}">
		<div id="notebookName">
			<br><h4 id="journalTheme">Journal Theme</h4><br>
			<form action="/user/${user.id}/process" method="post" id="settingForm">
				<input type="hidden" name="_method" value="put">
				<!-- instead of path, it's name -->
				<label> JOURNAL COVER</label><br>
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
		</div>
		<br><br><br><br><br><br>
	</div>
</body>
</html>