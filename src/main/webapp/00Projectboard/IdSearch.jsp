<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
 integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
</style>
<script>
   function comfotable(idx, lengthx, next){
      if(document.getElementById(idx).value.length == lengthx)
         document.getElementById(next).focus();
   }
</script>
</head>
<body>
    <%
    if(request.getAttribute("id") != null){
    %>
       <div style="margin-top:60px; text-align:center;">
          고객님의 정보와 일치하는 아이디는<br />
          "<%= request.getAttribute("id") %>"입니다.          
         <br /><br />
          <button type="button" onclick="self.close()" style="border-radius:5px; border:1px solid grey;
             width:50px; height:30px;">닫기</button>
       </div>
	<% } else { %>
	<h2 style="margin-left: 30px; margit-top: 30px;">아이디 찾기</h2>
	<form action="./IdSearchProcess.jsp" style="margin-left: 30px;"
		onsubmit="return formValidate(this);">
		<table>
			<tr>
				<td><input class="form-control" type="text" name="name"
					placeholder="이름" /></td>
			</tr>
			<tr>
				<td><input class="form-control" type="text" id="m1" name="tel"
					placeholder="휴대전화" /></td>
			</tr>
			<tr>
				<td><input type="submit" class="form-control bg-primary"
					value="찾기" style="color: white;" /></td>
			</tr>
		</table>
		<br />
	</form>
	<%
    }
    %>
</body>
</html>