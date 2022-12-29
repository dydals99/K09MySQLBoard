<%@page import="utils.JSFunction"%>
<%@page import="project.board.boardDTO"%>
<%@page import="project.board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>  
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
<script type="text/javascript">
function validateForm(form) {  // 폼 내용 검증
    if (form.title.value == "") {
        alert("제목을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.content.value == "") {
        alert("내용을 입력하세요.");
        form.content.focus();
        return false;
    }
}
</script>
    <style>
        .nav-link{color: black;}
        .nav-link:hover{color: gray;}
    </style>
</head>
<body>
    <%@ include file="./inc/top.jsp" %>
    <div class="container mt-5 ">
        <div class="row">
        <div class="col-2"></div>
        <div class="col-8">
     <form name="writeFrm" method="post" class="form-inline"
      action="../board/multiedit.do" onsubmit="return validateForm(this);">
    <input type="hidden" name="idx" value="${ param.idx }" />
    
    <input type="hidden" name="b_flag" value="${param.b_flag }" />
    <table class="table" style="text-align: center">
        <tr>
            <th>제목</th>
            <td>
                <input class="form-control" type="text" name="title" value="${ dto.title }" style="width: 90%;" />
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td>
                <textarea class="form-control" 
                name="content" style="width: 90%; height: 250px;">${ dto.content }</textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button class="btn btn-primary" type="submit">작성 완료</button>
                <button class="btn btn-primary" type="reset">다시 입력</button>
            </td>
        </tr>
    </table>
</form>
</div>
		</div>
	</div>
        <br>
        <div class="col d-flex justify-content-center">
            <button type="button" class="btn btn-light" onclick="location.href='../board/multiview.do';">이전</button>
        </div>
        <br>
     <div class="container mt-5 ">
    <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
    <%@ include file="./inc/copy.jsp" %>
    </div>
</body>
</html>