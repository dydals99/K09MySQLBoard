<%@page import="utils.JSFunction"%>
<%@page import="membership.MemberDAO"%>
<%@page import="membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pass = request.getParameter("passwd1");
String name = request.getParameter("name");
String tel = request.getParameter("tel");

MemberDTO dto = new MemberDTO();
dto.setId(id);
dto.setPass(pass);
dto.setName(name);
dto.setTel(tel);
/* dto.setEmail(email); */

MemberDAO dao = new MemberDAO();

int affected = dao.updateMember(dto); 

dao.close();

if(affected == 1){
	
	JSFunction.alertLocation("회원정보수정완료", "main.jsp", out); 
}
else{
	JSFunction.alertBack("회원수정하기에 실패하였습니다.", out);
}
%>