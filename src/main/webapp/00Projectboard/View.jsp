<%@page import="project.board.ucommentDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="project.board.ucommentDAO"%>
<%@page import="membership.MemberDTO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="project.board.boardDTO"%>
<%@page import="project.board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
boardDAO dao = new boardDAO();
String idx = request.getParameter("idx");
boardDTO dto = dao.selectView(idx);

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
<script>
function deletePost() {
    var confirmed = confirm("정말로 삭제하겠습니까?"); 
    if (confirmed) {
        var form = document.writeFrm;      
        form.method = "get"; 
        form.action = "../board/delete.do"; 
        form.submit();         
    }
}
</script> 
</head>
<body>
    <%@ include file="./inc/top.jsp" %>
    <div class="container mt-5 ">
     <form name="writeFrm" method="get">
     <input type="hidden" name="idx" value="<%= idx %>" /> 
     <input type="hidden" name="b_flag" value="${param.b_flag }" />
        <div class="row">
        <div class="col-1"></div>
        <div class="col-5">
        <table width="90%">
        	<tr>
				<td colspan="3" height="100"> ${ dto.image } 
	            	<p>
	            		<img src="../Uploads/${ dto.sfile }" style="width: 450px; height: 100%"/>
	            	</p>
				</td>
        	</tr>
        </table>
        </div>
        <div class="col-6">
        	<h3 class="mt-3" style="font-weight: bold;">
        	${ dto.title }
        	</h3> <small>[${ dto.id }]</small>
        	<hr>
        	<h4 class="mt-3"></h4>
        	<br>
        	<div class="mt-3"> 
        	<small style="color: gray"></small>
        	</div>
        	<h4 class="mt-3" style="font-weight: bold;">
        	<fmt:formatNumber value="${dto.price }" />원
        	</h4>
        	<div class="mt-3"> 
        	${ dto.content }
        	</div>  
        	<br>
        	<div class="mt-3">
        	<small style="color: gray">
        		조회수 : ${ dto.visitcount }
        		<br>
        		등록일 : ${ dto.postdate }</small>
			</div>
		<table>
	    <tr>
            <td>
	            <c:if test="${ not empty dto.sfile }">${ dto.ofile }
		            	<a href="../board/download.do?ofile=${dto.ofile}&sfile=${dto.sfile}&idx=${dto.idx}">[다운로드]</a>
	            </c:if>
            </td>
        </tr>
        <tr>
         	<td>다운로드수 : ${ dto.downcount } </td>
        </tr>
        </table>
			<hr class="mt-3">
		</div>
		</div>
		<div class="row">
                <div class="col d-flex justify-content-center">
       
         </div>
        </div>
			<div class="row">
                <div class="col d-flex justify-content-center">
					<c:if test="${not empty sessionScope.UserId }">
						<c:choose>
							<c:when test="${sessionScope.UserId eq 'admin' }">
								<button type="button" class="btn btn-primary"
									onclick="deletePost();">삭제하기</button>
							</c:when>
							<c:otherwise>
								<c:if test="${sessionScope.UserId != null }">
									<button type="button" class="btn btn-primary"
										onclick="location.href='../board/edit.do?b_flag=${param.b_flag }&idx=${param.idx}';">수정하기
									</button>&nbsp
                    				<button type="button" class="btn btn-primary"
										onclick="deletePost();">삭제하기</button>
								</c:if>
							</c:otherwise>
						</c:choose>
					</c:if>
				</div>
            </div>
            </form>
            <br>
        </div>
		<div class="container d-flex justify-content-center">
			<div class="form-group">
				<c:choose>
					<c:when test="${ empty comment }">
					</c:when>
					<c:otherwise>
						<c:forEach items="${ comment }" var="row" varStatus="loop">
							<table class="table table-striped" style="text-align: left;
								border: 1px solid #dddddd; width: 800px">
								<tr>
									<td width="30%">${ row.id }</td>
									<td colspan="2">${ row.content }</td>
									<td style="text-align: right; color: gray;">
										<small>${ row.postdate }</small></td>
								</tr>
								<tr>
								</tr>
							</table>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<form method="post"
					action="../board/comment.do?b_flag=${param.b_flag }&idx=${param.idx}">
					<input type="hidden" value="${ sessionScope.UserId }" name="id">
					<table class="table table-striped" 
						style="text-align: center; border: 1px solid #dddddd; width: 800px">
						<tr>
							<td>
							<input type="text" style="height: 100px; width: 650px;"
								class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다."
								name="content"></td>
							<td class="">
								<div class="mt-2 me-3">
								<button class="btn btn-secondary" type="submit">댓글쓰기</button>
								</div>
								<div class="mt-1 mb-1 me-3">
								<button class="btn btn-dark" type="reset">다시쓰기</button>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		
        <br>
        <div class="col d-flex justify-content-center">
            <button type="button" class="btn btn-light" onclick="location.href='../board/list.do?b_flag=${param.b_flag}';">더 많은 상품보기</button>
        </div>
        <br>
     <div class="container mt-5 ">
    <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
    <%@ include file="./inc/copy.jsp" %>
    </div>
</body>
</html>