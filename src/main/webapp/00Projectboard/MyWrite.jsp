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

String id = request.getParameter("id");
String idx = request.getParameter("idx");
String b_flag = request.getParameter("b_flag");

map.put("b_flag", b_flag);
map.put("id",session.getAttribute("UserId"));

String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");

if(searchWord != null) {
	 
   map.put("searchField", searchField);
   map.put("searchWord", searchWord);
}
int totalCount = dao.selectCount2(map);

//메인페이제 게시물 4개만 출력하기위한 파라미터
int pageSize =
         Integer.parseInt(
               application.getInitParameter("POSTS_PER_PAGE"));

int pageNum = 1;
String pageTemp = request.getParameter("pageNum");
if(pageTemp != null && !pageTemp.equals(""))
   pageNum = Integer.parseInt(pageTemp);

int start = (pageNum - 1) * pageSize;
int end = pageSize;
map.put("start",start);
map.put("end",end);

List<boardDTO> boardLists;
if(b_flag.equals("used")){
	
   boardLists = dao.selectListMyPage(map);
}
else{
   boardLists = dao.selectListPage(map);
}
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
    <h1 class="mt-5 mb-5" style="text-align: center; font-weight: bold">나의 거래소</h1>
	<div class="container mt-5">
		<div class="row">
			<table class="table table-hover"
				style="text-align: center; text-align: center;">
				<tr>
					<th width="10%">번호</th>
					<th width="*">제목</th>
					<th width="15%">작성자</th>
					<th width="10%">조회수</th>
					<th width="15%">작성일</th>
				</tr>
				<%
				if (boardLists.isEmpty()) {
				%>
				<tr>
					<td colspan="5" align="center">등록된 게시물이 없습니다^^*</td>
				</tr>
				<%
				}
				else 
				{
						int virtualNum = 0;
						int countNum = 0;
					for (boardDTO dto : boardLists) {

						virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
						if(session.getAttribute("UsedId")== id){
				%>
				<tr align="center">
					<td><%=virtualNum%></td>
					<td align="left"><a href="../board/view.do?idx=<%=dto.getIdx()%>"><%=dto.getTitle()%></a>
					</td>
					<td align="center"><%=dto.getId()%></td>
					<td align="center"><%=dto.getVisitcount()%></td>
					<td align="center"><%=dto.getPostdate()%></td>
				</tr>
				<%
						}
					}
				}
				%>
			</table>
		</div>
		<br>
		<div class="col d-flex justify-content-center">
			<button type="button" class="btn btn-light"
				onclick="location.href='../board/list.do';">더보기</button>
		</div>
		<br>
		<div
			class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
		<%@ include file="./inc/copy.jsp"%>
	</div>
</body>
</html>