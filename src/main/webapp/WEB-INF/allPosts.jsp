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
<title>Welcome</title>
<!-- bootstrap -->
<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- link css -->
<link rel="stylesheet" type="text/css" href="/css/allPosts.css">
</head>
<body>
	<div id="navBar">
		<h2 id="logo"><a href="/home" id="logoTag">My Journey</a></h2>
		<a href="/logout" class="aTags">Log out</a>
	</div>
	<div id="main">
		<div id="header">
			<h2 id="welcome"><c:out value="${user.firstName}"/>'s Journal</h2>
			<c:if test = "${countPosts < 2}">
				<p>${countPosts} total entry</p>
			</c:if>
			<c:if test = "${countPosts > 1}">
				<p>${countPosts} total entries</p>
			</c:if>
		</div>
		<div id="tableOfPosts">
			<table class="table table-striped">
			    <thead>
			        <tr>
			            <th scope="col">Title</th>
			            <th scope="col">Date</th>
			            <th scope="col">Action / Status</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach items="${posts}" var="p">
				        <tr>
				            <td><a href="/posts/${p.id}"><c:out value="${p.title}"/></a></td>
				            <td><fmt:formatDate value="${p.date}" pattern="MMMM dd, yyyy"/></td>
				            <td>
			            		<p>
				            		<a href="/posts/${p.id}/edit">Edit</a> &nbsp|&nbsp
									<a href="/posts/${p.id}/delete">Delete</a>
			            		</p>
				            </td>
				        </tr>
			        </c:forEach>
			    </tbody>
			</table>		
		</div>
		<br></br>
		<br><br><br>
 		<form:form action="/newPost" method="post" modelAttribute="post" id="newForm">
		    <button type="submit" class="btn btn-primary">Add Entry</button>
		</form:form>
	</div>
</body>
</html>