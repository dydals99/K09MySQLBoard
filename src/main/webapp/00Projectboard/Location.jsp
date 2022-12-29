<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="project.board.boardDAO"%>
<%@page import="project.board.boardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">   
    <style>
        .nav-link{color: black;}
        .nav-link:hover{color: gray;}
    </style>
</head>
<body>
    <%@ include file="./inc/top.jsp" %>
	<br>
	<div class="container">
		<div class="row">
			<div id="map" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy">
				<div class="col d-flex justify-content-center">
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.4042695562734!2d126.98244175131892!3d37.56909707969834!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2e8cf2ef38d%3A0x5a0649f4a68f5bd5!2z7Iqk7YOA6rOo65Oc!5e0!3m2!1sko!2skr!4v1672220404627!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</div>
			</div>
		</div>
		<br>
		<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
		<%@ include file="./inc/copy.jsp"%>
	</div>
</body>
</html>