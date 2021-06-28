<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!-- bootstrap -->
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<!-- bootstrap -->
<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- link css -->
<link rel="stylesheet" type="text/css" href="/css/register.css">
</head>
<body>
	<div id="navBar">
		<h2 id="logo"><a href="/" id="logoTag">My Journey</a></h2>
		<div id="links">
			<a href="/loginNow" class="aTags">Log in</a>
		</div>
	</div>
	<div id="main">
		<div id="register">
		    <h3>Welcome!</h3>
		    <h3>Create your free account.</h3><br>
		    <p><form:errors path="user.*" id="errors"/></p>
		    <form:form method="POST" action="/registration" modelAttribute="user" id="regForm">
		    	<div id="fullName">
			    	<div class="form-group">
			            <form:input type="text" path="firstName" class="form-control input-lg w-100"/><br>
			            <form:label path="firstName" class="label">FIRST NAME</form:label>
			       </div>
			       <div class="form-group">
			            <form:input type="text" path="lastName" class="form-control input-lg w-100"/><br>
			            <form:label path="lastName" class="label">LAST NAME</form:label>
			       </div>
		    	</div>
		       <div class="form-group">
		            <form:input type="email" path="email" class="form-control input-lg w-100"/><br>
		            <form:label path="email" class="label">EMAIL ADDRESS</form:label>
		       </div>
		       <div class="form-group">
		            <form:password path="password" class="form-control input-lg w-100"/><br>
		            <form:label path="password" class="label">PASSWORD</form:label>
		       </div>
		       <div class="form-group">
		            <form:password path="passwordConfirmation" class="form-control input-lg w-100"/><br>
		            <form:label path="passwordConfirmation" class="label">CONFIRM PASSWORD</form:label>
		       </div>
		        <div id="buttonDiv"><button type="submit" class="btn btn-primary">Create Account</button></div>
		    </form:form>
		    <br><br>
<%-- 		    <h5 class="sentence">Already have an account?</h5>
			<form:form action="/loginNow" method="post" id="newForm">
			    <button type="submit" class="btn btn-link">Login</button>
			</form:form> --%>
		</div>
	</div>
</body>
</html>