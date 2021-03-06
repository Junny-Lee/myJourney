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
<link rel="stylesheet" type="text/css" href="/css/publicPosts.css">
</head>
<body>
	<div id="navBar">
		<a href="/posts/public" class="aTags">Back</a>
		<h2 id="logo"><a href="/home" id="logoTag">Our Journey</a></h2>
		<a href="/logout" class="aTags">Logout</a>
	</div>
	<div id="main">
		<div id="header">
			<div id="mainHeader">
				<h2 id="welcome">Public Journal</h2>
				<div id="newEntryDiv">
					<form:form action="/newPost" method="post" modelAttribute="post" id="newForm">
					    <button type="submit" class="btn btn-primary w-100">+ New Entry</button>
					</form:form>
				</div>
			</div>
			<div id="subheader">
				<c:if test = "${countPosts < 2}">
					<p>${countPosts} matched entry</p>
				</c:if>
				<c:if test = "${countPosts > 1}">
					<p>${countPosts} matched entries</p>
				</c:if>
				<p><a href="/posts/public">Back to all entries</a></p>
			</div>
			<div id="searchBar">
		         <form action="/search/public" method="post" id="searchBarForm">
		         	<input type="search" class="form-control w-25" name="search" placeholder="Search journal"/>
				    <button type="submit" class="btn btn-primary"><img src="/images/magnifyingGlass.png"/></button>
				</form>
			</div>
		</div>
		<div id="tableOfPosts">
			<table class="table">
			    <thead>
			        <tr class="border-bottom border-danger">
			            <th scope="col" style="width: 50%">Entry Title</th>
			            <th scope="col">Created</th>
			            <th scope="col">Creator</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach items="${posts}" var="p">
				        <tr>
				            <td>
				            	<a href="/posts/${p.id}"><c:out value="${p.title}"/></a>
				            	<p id="entryText"><c:out value="${p.text}"/></p>
				            </td>
				            <td id="entryDate">
				            	<fmt:formatDate value="${p.createdAt}" pattern="EEE. MM/dd/yyyy"/><br>
				            	<fmt:formatDate type = "time" value="${p.createdAt}" pattern="h:mm aa"/>
				            </td>
				            <td><c:out value="${p.creator.firstName} ${p.creator.lastName}"/></td>
				        </tr>
			        </c:forEach>
			    </tbody>
			</table>		
		</div>
		<br></br>
		<br><br><br>
	</div>
</body>
</html>


