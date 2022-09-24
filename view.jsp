<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/css/dashboard.css">
<head>
<meta charset="ISO-8859-1">
<title>This is the view geocache</title>
</head>
<body>
<div class="top-bar">
	<div class="top-bar">
		<h2><img src="/images/geocache-logo.png" class="image-top"></h2>
	</div>
	
	
	<div>
	  <a href="/dashboard" class="btn">Back to Dashboard</a>
	  <a href="/geocaches/${geocaching.id}/edit" class="btn">Update Geocache</a>
	</div>
</div>
<div class="middle">
<div class="split left">
  <div class="centered">
    
    <h1> <c:out value="${ geocaching.name }"/></h1>
    <h2>This Geocache will be located in: <c:out value="${geocaching.location }"/></h2>
    <p><img src="/images/map img.png"/></p>
  </div>
</div>

<div class="split right">
  <div class="centered">
    
    <h1><img src="/images/diff meter.png"/></h1>
    <h1>Level of Difficulty: <c:out value="${ geocaching.difficulty }"/></h1>
  </div>

</div>
</div>

</body>
</html>