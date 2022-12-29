<%@page import="project.board.boardDTO"%>
<%@page import="project.board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
boardDAO dao = new boardDAO();
String idx = request.getParameter("idx");
boardDTO dto = dao.MultiselectView(idx);

dao.close();
%>
<!DOCTYPE html>
<html>
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
<script>
function deletePost() {
    var confirmed = confirm("정말로 삭제하겠습니까?"); 
    if (confirmed) {
        var form = document.writeFrm;      
        form.method = "get"; 
        form.action = "../board/multidelete.do"; 
        form.submit();         
    }
}
</script> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%@ include file="./inc/top.jsp" %>
<div class="container mt-5">
<div class="row">
<div class="col-3"></div>
<div class="col-6">
<form name="writeFrm" method="get" class="form-inline">
    <input type="hidden" name="idx" value="${param.idx }" />
    <input type="hidden" name="b_flag" value="${param.b_flag }" />
    <table class="table" style="text-align: center">
       <tr>
            <th>작성자</th>
            <td> ${ dto.id }</td>
            <th>작성일</th>
            <td> ${ dto.postdate }</td>
        </tr>
        <tr>
            <th >제목</th>
            <td >
                ${ dto.title }
            </td>
            <th>조회수</th>
            <td> ${ dto.visitcount }</td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="3" height="300">
                ${ dto.content }
            </td>
        </tr>
    </table>
             <div class=" d-flex justify-content-center">
					<c:if test="${not empty sessionScope.UserId }">
						<c:choose>
							<c:when test="${sessionScope.UserId eq 'admin' }">
								<button type="button" class="btn btn-primary"
									onclick="deletePost();">삭제하기</button>&nbsp
							</c:when>
							<c:otherwise>
								<c:if test="${sessionScope.UserId != null }">
									<button type="button" class="btn btn-primary"
										onclick="location.href='../board/multiedit.do?b_flag=${param.b_flag }&idx=${param.idx}';">수정하기
									</button>&nbsp
                    				<button type="button" class="btn btn-primary"
										onclick="deletePost();">삭제하기</button>&nbsp
								</c:if>
							</c:otherwise>
						</c:choose>
					</c:if>
				<button class="btn btn-primary" type="button" onclick="location.href='../00Projectboard/Multiboard.jsp?b_flag=${param.b_flag}';">
                    목록 바로가기
                </button>
       		</div>
</form>
   	</div>
   	<div class="col-3"></div>
</div>
</div>
  <div class="container mt-5 ">
  <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
  <%@ include file="./inc/copy.jsp" %>
  </div>
</body>
</html>