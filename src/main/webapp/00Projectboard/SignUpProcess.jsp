<%@page import="utils.JSFunction"%>
<%@page import="membership.MemberDAO"%>
<%@page import="membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pass = request.getParameter("passwd1");
String pass2 = request.getParameter("passwd2");
String name = request.getParameter("name");
String tel = request.getParameter("tel");
String email = request.getParameter("email1") +"@"+ request.getParameter("email2");

MemberDTO dto = new MemberDTO();
dto.setId(id);
dto.setPass(pass);
dto.setPass(pass2);
dto.setName(name);
dto.setTel(tel);
dto.setEmail(email);

MemberDAO dao = new MemberDAO();

int iResult = dao.insertMember(dto); 
//자원해제
dao.close();
 
if(iResult == 1){
	JSFunction.alertLocation("회원가입 성공", "Login.jsp", out); 
}
else{
	
	JSFunction.alertBack("회원가입에 실패하였습니다.", out);
}
%>