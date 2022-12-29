<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignUp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <style>
        .nav-link{color: black;}
        .nav-link:hover{color: gray;}
        .emalis{border:  gray solid 1px; border-radius:5px;}
    </style>    
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
function validateForm(form) {
	
	if(form.id.value==""){
		alert("아이디를 입력하세요");
	   form.id.focus();
		return false;
	}
    if (form.passwd1.value == "") {
        alert("비밀번호를 입력하세요.");
        form.passwd1.focus();
        return false;
    }
    if (form.passwd1.value != form.passwd2.value) {
        alert("비밀번호가 일치하지않습니다..");
        form.passwd1.value="";
        form.passwd2.value="";
        form.passwd1.focus();
        return false;
    }
    if (form.name.value == "") {
        alert("회원자명을 입력하세요.");
        form.name.focus();
        return false;
    }
    if (form.tel.value == "") {
        alert("휴대전화를 입력하세요.");
        form.tel.focus();
        return false;
    }
    if (form.email1.value == "") {
        alert("이메일을 입력하세요.");
        form.email1.focus();
        return false;
    }
    if (form.email2.value == "") {
        alert("도메인을 입력하세요.");
        form.email2.focus();
        return false;
    }
    
    form.submit(); 
}
function inputEmail(frm){
    var domain = frm.email_domain.value;
    if(domain==''){
        frm.email1.value = '';
        frm.email2.value = '';
    }
    else if(domain=='직접입력'){
        frm.email2.readOnly = false;
        frm.email2.value = '';
        frm.email2.focus();
    }
    else{
        frm.email2.value = domain;
        frm.email2.readOnly = true; 
    }
}   
function idCheck(){
	var form = document.getElementById("regiFrm");
	
	if(form.id.value==''){
		alert("아이디 입력후 중복검사를 누르세요.")
		form.id.focus();
	}
	else{
		form.id.readOnly = true;
		
		open("IdCheck.jsp?id="+form.id.value,"","width=500, height=300");
	} 
}
$(function(){
	$('#passwd1').keyup(function(){
		var inputVal = $(this).val();
		console.log("입력", inputVal);
		
		if(inputVal.length>=8){
			$('#confirm4').css({'color':'green','fontSize':'15px','fontWeight':'bold'});
		}
		else{
			$('#confirm4').css('color','gray').css('fontSize','15px')
				.css('fontWeight','normal');
		}
		var strUpper=false, strLower=false, strNumber=false;
		
		for(var i=0 ; i<inputVal.length ; i++){
			console.log("아스키코드값", inputVal[i].charCodeAt(0));
			
			if(inputVal[i].charCodeAt(0)>=65 && inputVal[i].charCodeAt(0)<=90){
				strUpper = true;
			}
			if(inputVal[i].charCodeAt(0)>=97 && inputVal[i].charCodeAt(0)<=122){
				strLower = true;
			}
			if(inputVal[i].charCodeAt(0)>=48 && inputVal[i].charCodeAt(0)<=57){
				strNumber = true;
			}			
		}
		if(strUpper==true)			
			$('#confirm1').css({'color':'green','fontSize':'15px','fontWeight':'bold'});
		else
			$('#confirm1').css({'color':'gray','fontSize':'15px','fontWeight':'normal'});
		
		if(strLower==true)			
			$('#confirm2').css({'color':'green','fontSize':'15px','fontWeight':'bold'});
		else
			$('#confirm2').css({'color':'gray','fontSize':'15px','fontWeight':'normal'});
		
		if(strNumber==true)			
			$('#confirm3').css({'color':'green','fontSize':'15px','fontWeight':'bold'});
		else
			$('#confirm3').css({'color':'gray','fontSize':'15px','fontWeight':'normal'});
	});
	
	$('#passwd2').keyup(function(){
		var p1 = $('#passwd1').val();
		var p2 = $(this).val();
		if(p1==p2){
			$('#passConfirm').html('패스워드가 일치합니다.').css('color','green');
		}
		else{
			$('#passConfirm').html('패스워드가 틀렸습니다.').css('color','red');
		}
	});
});
function idCheck() {

    var usrId = document.getElementById("user_id").value;
    if (usrId == '') {
       alert("아이디를 입력하고 누르세요.");
    } else {

       window.open("./IdCheck.jsp?usrId=" + usrId, "idover",
             "width=400px, height=300px");
    }
 }
</script>   
</head>
<body>
<div class="container">
    <div class="row">
    	<!-- 상단부분 네비바 인클루드 -->
        <%@ include file="./inc/top.jsp" %>
    </div>
		<div class="row" style="height: 590px">
			<!-- 좌측부분 네비바 인클루드 -->
			<div class="col-12 pt-3">
				<h2 style="text-align: center; font-weight: bold">
					회원가입<i class="bi bi-door-open"></i>
				</h2>
				<div class="container mt-3 d-flex justify-content-center">
					<form action="SignUpProcess.jsp" method="post"  name="regiFrm" id="regiFrm">
						<div class="input-group mb-4">
							<input type="text" class="form-control" placeholder="아이디"
								name="usrId" id="user_id" style="width:300px;">
							<div class="input-group-append">
								<button class= "btn btn-primary" type="button" onclick="idCheck();">중복확인</button>
							</div> 
						</div> 
						<div class="mb-3">
							<input type="password" name="passwd1" id="passwd1" style="width:520px"
								class=" form-control" placeholder="비밀번호" />
							<span id="confirm1" class="confirmChar">√</span> 대문자
							<span id="confirm2" class="confirmChar">√</span> 소문자
							<span id="confirm3" class="confirmChar">√</span> 숫자
							<span id="confirm4" class="confirmChar">√</span> 8자이상
						</div>	
							<input type="password" name="passwd2" id="passwd2" style="width:520px"
								class=" form-control" placeholder="비밀번호확인"/>
						<div class="mb-4" id="passConfirm"></div>
						<div class="mb-4">
							<input type="text" class="form-control" 
					      		placeholder="회원이름" name="name" style="width:520px;"> 
						</div> 
						<div class="mb-4">
							<input type="text" class="form-control" 
					      		placeholder="전화번호" name="tel" style="width:520px;"> 
						</div>
						<div class="form-group mb-4">
							<input type="text" name="email1" placeholder="이메일" class="emalis" />
                    	<span style="font-size:16px;">＠</span>
                    	<input type="text" name="email2" placeholder="도메인" class="emalis" />
                    		<select name="email_domain" class="emalis" onchange="inputEmail(this.form);" >  
		                        <option value=""> -- 선택 --</option>
		                        <option value="naver.com">naver.com</option>
		                        <option value="nate.com">nate.com</option>
		                        <option value="gmail.com">gmail.com</option>
		                        <option value="daum.net">daum.net</option>
		                        <option value="hanmail.net">hanmail.net</option>
		                        <option value="직접입력" selected>직접입력</option>
                    		</select>
						</div>
					   <div class="mb-4">
					    <button type="button" class="btn btn-primary" style=" width:520px;" onclick="validateForm(this.form);"
					     >회원가입</button>
					    <hr />
					    </div>
					</form>
				</div>
			</div>
		</div>
		<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
    <!-- 하단 카피라이트 부분 네비바 인클루드 -->
    <%@ include file="./inc/copy.jsp" %>
</div>
</body>
</html>