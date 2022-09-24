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
<title>Geocache Dashboard</title>
<link rel="stylesheet" href="/css/dashboard.css">
</head>
<body>
<div class="container">
	<div class="top-bar">
		<h2><img src="/images/geocache-logo.png" class="image-top"></h2>
		<div class="navbar">
				<div class="mycache">
					<a href="/" class="btn-top">Sign Out</a>
				</div>
			</div>
		</div>
	</div>
	<h1>Join the worlds largest treasure hunt</h1>
	<p>Geocaching is an outdoor recreational activity, in which participants use a (GPS) or any other mobile device and 
	other navigational techniques to hide and seek containers, called "geocaches'' or "caches". These specific locations 
	are marked by coordinates all over the world. A typical cache is a small waterproof container containing a logbook and 
	sometimes a pen or pencil. The geocacher signs the log with their established code name and dates it, in order to prove 
	that they found the cache. After signing the log, the cache must be placed back exactly where the person found it. Larger 
	containers such as plastic storage containers (Tupperware or similar) or ammo boxes can also contain items for trading, 
	such as toys or trinkets, usually of more sentimental worth than financial. Geocaching can be compared to a sort of scavenger 
	hunt or treasure hunting.</p>
	<div class="body">
            <div class="body-table">
                <table class="table">
                    <tr>
                        <th>Name</th>
                        <th>Location</th>
                        <th>Difficulty</th>
                        <th>Action</th>
                    </tr>
                    <c:forEach var="geocaching" items="${geocaches}">

                    <tr>
                        <td><c:out value="${geocaching.name}"/></td>
                        <td><c:out value="${geocaching.location}"/></td>
                        <td><c:out value="${geocaching.difficulty}"/></td>
                        <td><a href="geocaches/${geocaching.id}">View</a>
                    </tr>
                    </c:forEach>
                </table>
            </div>
            <a href="/addGeocaching" class="btn">Add a Geocache Location</a>
        </div>
        <div><img src="/images/geocaching-photo.png" class="image"></div>
</body>
</html>