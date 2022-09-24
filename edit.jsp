<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form"%> <%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Edit page</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
   <link rel="stylesheet" href="/css/dashboard.css">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
  </head>
<body>
<div class="top-bar">
		<h2><img src="/images/geocache-logo.png" class="image-top"></h2>
		<div class="navbar">
			<div class="addgeocache">
				<a href="/dashboard" class="btn">Dashboard</a>
			</div>
			<div class="mycache">
				<a href="/" class="btn">Sign Out</a>
			</div>
		</div>
	</div>
	<h1 class="name">Update your Geocache!</h1>
	
	<form:form action="/geocaches/${geocaching.id}" modelAttribute="geocaching" class="table-edit" method="put">
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
	<div class="move">
		<form action="/geocaches/delete/${geocaching.id}" method="post">
			<input type="hidden" name="_method" value="delete">
			<input type = "submit" value="Delete" class="btn">
		</form>
	</div>
</body>
</html>