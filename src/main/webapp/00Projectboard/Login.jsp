<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">   
 <style>
        .nav-link{color: black;}
        .nav-link:hover{color: gray;}
 </style>
 <script>
   function searchId(){      
       open("./IdSearch.jsp",
        "idSearch",
        "width=385, height=240, left=1000, top=150, "
        + "location=no, toolbar=no, menubar=no, "
        + "scrollbars=yes, resize=no");
   }
   function searchPw(){      
       open("./PwSearch.jsp",
        "pwSearch",
        "width=385, height=240, left=1000, top=150, "
        + "location=no, toolbar=no, menubar=no, "
        + "scrollbars=yes, resize=no");
   }
</script>
</head>
<body>
<%@ include file="./inc/top.jsp" %>
 <div class="container mt-5">
	<div class="row">
	   	<!-- 좌측부분 네비바 인클루드 --> 
	       <div class="col-12 pt-3">
	            <div class="row ">
				  <h2 style="text-align: center; font-weight: bold ">LOGIN</h2>  
				  <div class="container mt-3 d-flex justify-content-center" >
					  <form action="LoginProcess.jsp" method="post" name="loginFrm"
					   	onsubmit="return validateForm(this);"  >
					    <div class="mb-2 mt-2" >
					      <input type="text" class=" form-control" id="cook"
					      	placeholder="아이디" name="user_id" style="width:300px;">
					    </div >
					    <div class="mb-1">
					      <input type="password" class="form-control" 
					      	placeholder="비밀번호" name="user_pw" style="width:300px;">
					    </div>
					    <div class="d-flex justify-content-end" style="font-size: 13px; color: gray;">
					   <label style="cursor:pointer;"><input type="checkbox" name="cookie_id" style="margin-left:62px; margin-bottom:7px;" />아이디 저장</label>
					    </div>
					    <div class="mb-5">
					    <button type="submit" class="btn btn-primary" value="login" style=" width:300px;"
					     >로그인</button><br>
					     <div class="mt-2 d-flex justify-content-end">
					     <a href="#" onclick="searchId();">아이디 찾기</a>&nbsp
					     <a href="#" onclick="searchPw();">비밀번호 찾기</a>
					     </div>
					    <hr />
					    </div>
					  </form>
					</div>
	            </div>
	       </div>
	   </div>
	   <%
		Cookie[] cookies = request.getCookies();
		boolean cookieExist = false;
		String cookieCheck = "";
		for(Cookie c : cookies) {
		    String cookieName = c.getName();   
		    String cookieValue = c.getValue();   
		    if (cookieName.equals("loginCookie")) {
		       cookieExist = true;
		       cookieCheck = c.getValue();
		       break;
		    }
		}
		if(cookieExist == true){
		%>
		   <script>
		      document.getElementById("cook").value = "<%= cookieCheck %>";
		   </script>
		<%
		}
		%>   
	   <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
	    <%@ include file="./inc/copy.jsp" %>
 </div>
</body>
</html>
