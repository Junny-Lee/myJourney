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
			<h6 id="journalCover"> JOURNAL COVER</h6>
			<div id="colorButtons">
				<form:form action="/user/${user.id}/process" method="post" id="newColor">
					<input type="hidden" name="_method" value="put">
				    <button name="journalColor" type="submit" class="btn btn-info" style="background-color: #ff4d4d" value="#ff4d4d"></button>
				</form:form>
				<form:form action="/user/${user.id}/process" method="post" id="newColor">
					<input type="hidden" name="_method" value="put">
				    <button name="journalColor" type="submit" class="btn btn-info" style="background-color: #ff80b3" value="#ff80b3"></button>
				</form:form>
				<form:form action="/user/${user.id}/process" method="post" id="newColor">
					<input type="hidden" name="_method" value="put">
				    <button name="journalColor" type="submit" class="btn btn-info" style="background-color: #ffaa80" value="#ffaa80"></button>
				</form:form>
				<form:form action="/user/${user.id}/process" method="post" id="newColor">
					<input type="hidden" name="_method" value="put">
				    <button name="journalColor" type="submit" class="btn btn-info" style="background-color: #ffff99" value="#ffff99"></button>
				</form:form>
				<form:form action="/user/${user.id}/process" method="post" id="newColor">
					<input type="hidden" name="_method" value="put">
				    <button name="journalColor" type="submit" class="btn btn-info" style="background-color: #73e600" value="#73e600"></button>
				</form:form>
				<form:form action="/user/${user.id}/process" method="post" id="newColor">
					<input type="hidden" name="_method" value="put">
				    <button name="journalColor" type="submit" class="btn btn-info" style="background-color: #70dbdb" value="#70dbdb"></button>
				</form:form>
				<form:form action="/user/${user.id}/process" method="post" id="newColor">
					<input type="hidden" name="_method" value="put">
				    <button name="journalColor" type="submit" class="btn btn-info" style="background-color: #66a3ff" value="#66a3ff"></button>
				</form:form>
				<form:form action="/user/${user.id}/process" method="post" id="newColor">
					<input type="hidden" name="_method" value="put">
				    <button name="journalColor" type="submit" class="btn btn-info" style="background-color: #a292c7" value="#a292c7"></button>
				</form:form>
				<form:form action="/user/${user.id}/process" method="post" id="newColor">
					<input type="hidden" name="_method" value="put">
				    <button name="journalColor" type="submit" class="btn btn-info" style="background-color: #a6a6a6" value="#a6a6a6"></button>
				</form:form>
				<form:form action="/user/${user.id}/process" method="post" id="newColor">
					<input type="hidden" name="_method" value="put">
				    <button name="journalColor" type="submit" class="btn btn-info" style="background-color: #000000" value="#000000"></button>
				</form:form>
			</div>
			<br><br><br>
		</div>
	</div>
</body>
</html>