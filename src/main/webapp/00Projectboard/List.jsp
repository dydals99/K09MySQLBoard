<%@page import="utils.ListPage"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="project.board.boardDAO"%>
<%@page import="project.board.boardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h1 class="mt-5 mb-5" style="text-align: center; font-weight: bold">중고거래소</h1>
	<div class="container">
	<div class="row">
		<div class="col-8"></div>
		<div class="col-4">
			<form method="get">
				<input type="hidden" name="b_flag" value="${ param.b_flag }"/>
				<div class="input-group ms-2" style="width: 330px;">
					<select name="searchField" class="form-control" style="width: 100px">
						<option value="category">카테고리</option>
						<option value="location">지역</option>
					</select> 
					<input type="text" name="searchWord" class="form-control" style="width: 150px;" />
					<div class="input-group-btn">
						<button type="submit" class="btn btn-secondary">
							<i class="bi bi-search" style='font-size: 20px'></i>
						</button>
					</div>
				</div>
			</form>
			<br>
		</div>
	</div>
	<div class="row">
	<c:choose>
		<c:when test="${ empty boardLists }">
		<!-- 게시물을 저장하고 있는 boardLists 컬렉션에 내용이 없다면
		아래 부분을 출력한다. -->
	        <tr>
	            <td colspan="6" align="center" style="text-align: center"> 
	                등록된 게시물이 없습니다^^*
	            </td>
	        </tr>
	    </c:when>
		<c:otherwise>
			<c:forEach items="${ boardLists }" var="row" varStatus="loop">
	        <div class="card m-3" style="width: 280px">
					<img class="card-img-top" src="../Uploads/${ row.sfile }"
						alt="Card image" style="width: 100%" height="250">
					<div class="card-body">
						<p class="card-title" style="font-weight: bold; text-align: center" >
							${ row.title }</p>
					</div>
				<a href="../board/view.do?b_flag=${param.b_flag }&idx=${ row.idx}"
				class="btn btn-primary">자세히보기</a>
			</div>
	        </c:forEach>
		</c:otherwise>
	</c:choose>
    <div class="d-flex justify-content-center">
    <button class="btn btn-primary" type="button" style="width:150px;"
    	onclick="location.href='../board/write.do?b_flag=${param.b_flag}';">상품
			등록하기</button>
	</div>
	</div>
	<br>
		${ map.pagingImg }
	</div>
	<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
	<%@ include file="./inc/copy.jsp" %>
</body>
</html>