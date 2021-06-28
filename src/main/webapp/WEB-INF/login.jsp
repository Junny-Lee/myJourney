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
<link rel="stylesheet" type="text/css" href="/css/login.css">
</head>
<body>
	<div id="navBar">
		<h2 id="logo"><a href="/" id="logoTag">My Journey</a></h2>
		<div id="links">
			<a href="/register" class="aTags">Sign up</a>
		</div>
	</div>
	<div id="main">
		<div id="login">
			<h3>Already have an account?</h3>
			<h3>Sign in here!</h3><br>
		    <p><c:out value="${error}" /></p>
		    <form method="post" action="/login">
		        <div class="form-group">
		            <input type="text" class="form-control input-lg w-100" id="email" name="email"/><br>
		            <label for="email" class="label">EMAIL</label>
		        </div>
		        <div class="form-group">
		            <input type="password" class="form-control input-lg w-100" id="password" name="password"/><br>
		            <label for="password" class="label">PASSWORD</label>
		        </div>
		        <div id="buttonDiv"><button type="submit" class="btn btn-primary">Login</button></div>
		    </form>  
		</div>
	</div>
</body>
</html>