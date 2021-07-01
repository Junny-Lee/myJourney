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
		<a href="/home" class="aTags">Home</a>
		<h2 id="logo"><a href="/home" id="logoTag">My Journey</a></h2>
		<a href="/logout" class="aTags">Logout</a>
	</div>
	<div id="main">
		<div id="header">
			<div id="mainHeader">
				<h2 id="welcome"><c:out value="${user.firstName}"/>'s Journal</h2>
				<div id="newEntryDiv">
					<form:form action="/newPost" method="post" modelAttribute="post" id="newForm">
					    <button type="submit" class="btn btn-primary w-100">+ New Entry</button>
					</form:form>
				</div>
			</div>
			<div id="subheader">
				<c:if test = "${countPosts < 2}">
					<p>${countPosts} total entry</p>
				</c:if>
				<c:if test = "${countPosts > 1}">
					<p>${countPosts} total entries</p>
				</c:if>
				<a href="/posts/public">Public Board</a>
			</div>
			<div id="searchBar">
		         <form action="/search" method="post" id="searchBarForm">
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
			            <th scope="col">Status</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach items="${user.events}" var="p">
				        <tr>
				            <td>
				            	<a href="/posts/${p.id}"><c:out value="${p.title}"/></a>
				            	<c:if test="${p.favorite == true}">
				            		<img src="https://img.icons8.com/color/20/000000/filled-flag.png"/>
				            	</c:if>
				            	<p id="entryText"><c:out value="${p.text}"/></p>
				            </td>
				            <td id="entryDate">
				            	<fmt:formatDate value="${p.createdAt}" pattern="EEE. MM/dd/yyyy"/><br>
				            	<fmt:formatDate type = "time" value="${p.createdAt}" pattern="h:mm aa"/>
				            </td>
				            <td>
			            		<p>
			            			<c:if test="${p.personal == true }">			            			
			            				private <img src="https://img.icons8.com/material-two-tone/24/000000/lock--v1.png"/>
			            				<br><a href="/posts/${p.id}/statusChange">make public</a>
			            			</c:if>
			            			<c:if test="${p.personal == false }">			            			
			            				public <img src="https://img.icons8.com/ios/24/000000/conference-call--v1.png"/>
			            				<br><a href="/posts/${p.id}/statusChange">make private</a>
			            			</c:if>
				            		<%-- <a href="/posts/${p.id}/edit">Edit</a> &nbsp|&nbsp
									<a href="/posts/${p.id}/delete">Delete</a> --%>
			            		</p>
				            </td>
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


<!-- https://www.tutorialspoint.com/jsp/jstl_format_formatdate_tag.htm -->


