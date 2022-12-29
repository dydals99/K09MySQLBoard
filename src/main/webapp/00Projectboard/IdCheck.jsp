<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
 integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%
String id = (String) session.getAttribute("UserId");
String userId = request.getParameter("usrId");

MemberDAO dao = new MemberDAO();

boolean isDup = dao.checkId(userId);

dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function idUse() {

	opener.document.regiFrm.user_id.value =

	document.getElementById('user_id').innerHTML;
	opener.document.regiFrm.user_id.readOnly = true;

	self.close();

}

window.onload = function() {

	var url = location.href;

	console.log(url);

	var parameters = (url.slice(url.indexOf('?') + 1, url.length))
			.split('&');

	console.log(parameters[0]);

	returnValue = parameters[0].split('=')[1];

	document.getElementById('user_id').innerHTML = returnValue;
}
</script>


</head>
<body>
	<h2>[아이디 중복확인 하기]</h2>
	<h4>
		입력한 아이디 : <span id="user_id"></span>
	</h4>
	<%
	if (!isDup) {
		System.out.println("중복아이디 있음");
	%>


	<h3>다른 아이디를 입력해주세요.</h3>
	<form name="overlapFrm1" action="IdCheck.jsp">
		<input class="form-control" type="text" name="user_id" placeholder="아이디">
		<button type="submit" class="btn btn-primary">중복검사</button>
	</form>

	<%
	} else {
	System.out.println("사용가능");
	%>

	<h4>사용가능</h4>
	<form name="overlapFrm2">
		<input type="hidden" name="retype_id" size="20">
		<button type="button" class="btn btn-primary" onclick="idUse();">사용하기</button>
	</form>




	<%
	}
	%>

</body>
</html>