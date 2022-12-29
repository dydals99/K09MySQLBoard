<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String tel = request.getParameter("tel");
MemberDAO dao = new MemberDAO();
MemberDTO dto = dao.findPw(id, tel);
dao.close();

if(dto.getPass() != null){
   request.setAttribute("pass", dto.getPass());
   request.setAttribute("name", dto.getName());
   request.getRequestDispatcher("./PwSearch.jsp").forward(request, response);
} else {
   JSFunction.alertBack("가입되지 않은 아이디입니다. 가입을 진행해주세요.", out);
}
%>