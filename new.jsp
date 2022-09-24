<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Geocaching page</title>
<link rel="stylesheet" href="/css/dashboard.css">
</head>
<body>

	<div class="top-bar">
		<h2><img src="/images/geocache-logo.png" class="image-top"></h2>
		<div class="navbar">
			<div class="addgeocache">
				<a href="/dashboard" class="btn-top">Dashboard</a>
			</div>
			<div class="mycache">
				<a href="/" class="btn-top">Sign Out</a>
			</div>
		</div>
	</div>
	
	<h1 class="name">Add a Geocache and join in on the fun!</h1>
	
	<form:form action="/geocaches" modelAttribute="geocaching" class="table-enter" method="post">
		<div class="form-row">
			<form:errors path="name" class="error"/>
			<form:label for="name" path="name">Name:</form:label>
			<form:input type="text" path="name" class="form-control"/>
		</div>
		
		<div class="form-row">
			<form:errors path="location" class="error"/>
			<form:label for="location" path="location">Location:</form:label>
			<form:input type="text" path="location" class="form-control"/>
		</div>
		
		<div class="form-row">
			<form:errors path="difficulty" class="error"/>
			<form:label for="difficulty" path="difficulty">Difficulty:</form:label>
			<form:input type="text" path="difficulty" class="form-control"/>
		</div>
		
		<div class="form-row">
				<input type="submit" value="Submit" class="btn"/>
		</div>
	</form:form>
</body>
</html>