<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="project.board.boardDAO"%>
<%@page import="project.board.boardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
boardDAO dao = new boardDAO();
Map<String, Object> map = new HashMap<String, Object>();

String b_flag = request.getParameter("b_flag");

map.put("b_flag", "used");

String idx = request.getParameter("idx");
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");

if(searchWord != null) {
	 
   map.put("searchField", searchField);
   map.put("searchWord", searchWord);
}
int totalCount = dao.selectCount(map);

//메인페이제 게시물 4개만 출력하기위한 파라미터
int pageSize =
         Integer.parseInt(
               application.getInitParameter("PER_PAGE"));

int pageNum = 1;
String pageTemp = request.getParameter("pageNum");
if(pageTemp != null && !pageTemp.equals(""))
   pageNum = Integer.parseInt(pageTemp);

int start = (pageNum - 1) * pageSize;
int end = pageSize;
map.put("start",start);
map.put("end",end);

List<boardDTO> boardLists = dao.selectListPage(map);
dao.close();
%>
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
    
    <div class="container-fluid">
      <div id="demo" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active bg-info">
            <img src="./images/pay.png" class="d-block" style="width:70%">
            <div class="carousel-caption">
            </div>
          </div>
          <div class="carousel-item bg-secondary">
            <img src="./images/kakao.png" class="d-block" style="width:70%">
            <div class="carousel-caption">
            </div> 
          </div>
          <div class="carousel-item bg-dark">
            <img src="./images/first.png" class="d-block" style="width:70%">
            <div class="carousel-caption">
            </div>  
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
          <span class="carousel-control-next-icon"></span>
        </button>
      </div>
    </div>
	<div class="container  mt-5">
		<div class="d-flex flex-row">
		<%
		for (boardDTO dto : boardLists) {
		%>
			<div class="card m-3" style="width: 280px">
					<img class="card-img-top" src="../Uploads/<%=dto.getSfile()%>"
						alt="Card image" style="width: 100%" height="250">
					<div class="card-body">
						<p class="card-title" style="font-weight: bold; text-align: center" >
							<%=dto.getTitle()%></p>
					</div>
				<a href="../board/view.do?b_flag=<%=dto.getB_flag()%>&idx=<%=dto.getIdx()%>"
				class="btn btn-primary">자세히보기</a>
			</div>
		<%
		}
		%>
		</div>
	<br>
		<div class="col d-flex justify-content-center">
			<button type="button" class="btn btn-light"
				onclick="location.href='../board/list.do?b_flag=used';">더보기</button> 
		</div>
		<br>
		<div
			class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
		<%@ include file="./inc/copy.jsp"%>
	</div>
</body>
</html>