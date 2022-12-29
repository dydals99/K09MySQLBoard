<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="./IsLoggedIn.jsp" %>
<%
String author = session.getAttribute("UserId").toString();
%>  
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>회원제 게시판</title>

<script type="text/javascript">
function validateForm(form) {
    if (form.price.value == "") {
        alert("가격을 입력하세요.");
        form.price.focus();
        return false;
    }
    if (form.location.value == "") {
        alert("지역을 선택하세요.");
        form.location.focus();
        return false;
    }
    if (form.catagory.value == "") {
        alert("카테고리를 선택하세요.");
        form.catagory.focus();
        return false;
    }
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
</head>
<body>
<%@ include file="./inc/top.jsp" %>
<div class="container mt-5">
<div class="row">
<div class="col-2"></div>
<div class="col-8">
<form name="writeFrm" method="post" enctype="multipart/form-data" class="form-inline"
      action="../board/write.do" onsubmit="return validateForm(this);">
    <input type="hidden" name="b_flag" value="${param.b_flag }" />
    <table class="table" style="text-align: center">
   	 	<tr>
            <th>작성자</th>
            <td>
                <input class="form-control" type="text" name="id" style="width: 150px;"
                value="<%=author %>"	/>
            </td>
        </tr>
        <tr>
            <th>가격</th>
            <td>
                <input class="form-control" type="text" name="price" style="width: 150px;" />
            </td>
        </tr>
        <tr>
            <th>지역</th>
            <td>
                <select class="form-select" name="location"
						 style="width: 380px;">
						<option value="강동구">강동구</option>
						<option value="강서구">강서구</option>
						<option value="강북구">강북구</option>
						<option value="강남구">강남구</option>
						<option value="중구">중구</option>
						<option value="" selected>지역을 선택하세요</option>
				</select>
            </td>
        </tr>
        <tr>
            <th>카테고리</th>
            <td>
                <select class="form-select" name="category"
						 style="width: 380px;">
						<option value="전자기기">전자기기</option>
						<option value="의류">의류</option>
						<option value="잡화">잡화</option>
						<option value="" selected>카테고리를 선택하세요</option>
				</select>
            </td>
        </tr>
        <tr>
            <th>제목</th>
            <td>
                <input class="form-control" type="text" name="title" style="width: 90%;" />
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td>
                <textarea class="form-control" name="content" style="width: 90%; height: 250px;"></textarea>
            </td>
        </tr>

        <tr>
            <th>첨부 파일</th>
            <td>
                <input class="form-control" class="" type="file" name="ofile" style="width: 90%;"/>
                
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button class="btn btn-primary" type="submit">작성 완료</button>
                <button class="btn btn-primary" type="reset">다시 입력</button>
                <button class="btn btn-primary" type="button" onclick="location.href='List.jsp';">
                    목록 바로가기
                </button>
            </td>
        </tr>
    </table>
</form>
</div>
<div class="col-2"></div>
</div>
</div>
  <div class="container mt-5 ">
  <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
  <%@ include file="./inc/copy.jsp" %>
  </div>
</body>
</html>
