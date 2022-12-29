<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

      
         	
        <% if (session.getAttribute("UserId") == null) { %>
			<li class="nav-item">
                      <a class="nav-link" href="../00Projectboard/SignUp.jsp">
                      <i class='bi bi-person-plus-fill' style='font-size: 20px'></i> 회원가입</a>
                    </li>
           <li class="nav-item">
                      <a class="nav-link" href="../00Projectboard/Login.jsp">
                      <i class='bi bi-box-arrow-in-right' style='font-size: 20px'></i> 로그인</a>
                    </li>
        <% 
        } 
        else { 
        %>
			<li class="nav-item">
                      <a class="nav-link" href="../00Projectboard/UpdateMember.jsp">
                      <i class='bi bi-person-lines-fill' style='font-size: 20px'></i> <%= session.getAttribute("UserId")%> 님</a>
                    </li>
            <li class="nav-item">
                      <a class="nav-link" href="../00Projectboard/MyWrite.jsp?b_flag=used">
                      <i class='bi bi-person-lines-fill' style='font-size: 20px'></i> 나의 거래</a>
                    </li>
            <li class="nav-item">
                      <a class="nav-link" href="../00Projectboard/Logout.jsp"
                      ><i class='bi bi-box-arrow-right' style='font-size:20px'></i> 로그아웃</a>
                    </li>
          
        <%
        } 
        %>  
        	<li class="nav-item">
                <a class="nav-link" href="../board/list.do?b_flag=used">
                <i class="bi bi-collection" style='font-size: 20px'></i> 거래소</a>
            </li>
    	    <li class="nav-item">
                <a class="nav-link" href="../00Projectboard/Multiboard.jsp?b_flag=free">
                <i class="bi bi-card-text" style='font-size: 20px'></i> 자유게시판</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../00Projectboard/Multiboard.jsp?b_flag=notice">
                <i class="bi bi-chat-right-text" style='font-size: 20px'></i> 공지사항</a>
            </li>

