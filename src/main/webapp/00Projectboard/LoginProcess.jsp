<%@page import="utils.JSFunction"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");
String cookieId = request.getParameter("cookie_id");

if(cookieId==null){}
else if(cookieId.equals("on")){
   Cookie cookie = new Cookie("loginCookie", userId);
   response.addCookie(cookie);
}


MemberDAO dao = new MemberDAO();

MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);

dao.close();

if(memberDTO.getId() != null){
	//로그인에 성공한 경우라면...
	//세션영역에 회원아이디와 이름을 저장한다.
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getName());
	JSFunction.alertLocation("환영합니다!", "main.jsp", out);
%>
<script>
self.close();
opener.parent.location.reload();
</script>   
<%

}
else{
	//로그인에 실패한 경우라면...
	//리퀘스트 영역에 에러메세지를 저장한다.
	request.setAttribute("LoginErrMsg","로그인 오류입니다." );
	//그리고 로그인 페이지로 '포워드'한다.
	request.getRequestDispatcher("Login.jsp").forward(request, response);
}
%>