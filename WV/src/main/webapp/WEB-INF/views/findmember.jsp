<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%	request.setCharacterEncoding("UTF-8"); %>
<% 	response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<!-- Basic -->

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>회원수정</title>

<style>
#submit:hover {
	background: #DB631F;
	color: white;
	border-radius: 2px;
}
#userEmail:hover {
	background: #DB631F;
	color: white;
}
#userId {
	width: 200px;
}

#userEmail {
	width: 200px;
}
#userEmail2 {
	width: 200px;
}
#userEmail2:hover {
	background: #DB631F;
	color: white;
}
#submit {
      background-color: white;
      color: #DB631F;
      font-weight: bold;
      border-style:solid;
      border-color: #DB631F;
      border-radius: 2px;
}

#f {
	color: #DB631F;
	font-weight: bold;
}

.col-8 {
	left: 240px;
}
</style>
<script type="text/javascript">
	function findid() {
		var member_email = $("#userEmail").val();
		if(!member_email){
			toastr.warning("이메일을 입력해 주세요.", "Error",{tiemOut:5000});
			return;
		}
		console.log(member_email);
		$.ajax({
			type:"post",					
			url:"findid.do?member_email="+member_email,
			success:function(msg){
				if(msg){
					toastr.success(member_email+" 으로<br> 아이디가 발송되었습니다.", "아이디 찾기",{tiemOut:5000});
				}else{
					toastr.warning(member_email+" 으로<br> 가입된 아이디가 없습니다.", {tiemOut:5000});
				}
			},
			error:function(){
				alert("통신실패");
			}
		});
	}
	function findpw() {
		var member_email2 = $("#userEmail2").val();
		var member_id = $("#userId").val();
		if(!member_id){
			toastr.warning("아이디를 입력해 주세요.", {tiemOut:5000});
			return;
		}
		if(!member_email2){
			toastr.warning("이메일을 입력해 주세요.", {tiemOut:5000});
			return;
		}
		$.ajax({
			type:"post",					
			url:"findpw.do",
			data: {"member_id" : member_id, "member_email": member_email2},
			success:function(msg2){
				if(msg2){
					toastr.success(member_email2+" 으로<br> 비밀번호가 발송되었습니다.", "비밀번호 찾기",{tiemOut:5000});
				}else{
					toastr.warning("아이디 또는 이메일이 잘못되었습니다.", {tiemOut:5000});
				}
			},
			error:function(){
				alert("통신실패");
			}
		});
	}
</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/headerfooter/header.jsp"
		flush="false" />

	<div class="menu-box">

		<div class="container">

				<div class="row">
					<div class="col-2"></div>
					<div class="col-8">
                             <h1>ID 찾기</h1>
                             <br>
						<div class="form-group has-feedback">
							<label class="control-label" for="userEmail" id="f">이메일</label> 
							<input class="form-control" type="text" id="userEmail"/>
						</div>
						
						<div class="form-group has-feedback">
							<button id="submit" onclick="findid();">아이디 찾기</button>
						</div>
						


					</div>					
				</div>


				<div class="row" style="margin-top: 50px">
					<div class="col-2"></div>
					<div class="col-8">
                             <h1>PW 찾기</h1>
                             <br>
						<div class="form-group has-feedback">
							<label class="control-label" for="userId" id="f">아이디</label> 
							<input class="form-control" type="text" id="userId"/>
							<label class="control-label" for="userEmail2" id="f">이메일</label> 
							<input class="form-control" type="text" id="userEmail2"/>
						</div>
						
						<div class="form-group has-feedback">
							<button id="submit" onclick="findpw();">비밀번호 찾기</button>
						</div>
						


					</div>					
				</div>
				
		</div>
		<!-- container -->
	</div>
	<!-- 메뉴박스 -->
	
	<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp"
		flush="false"></jsp:include>
		
		
</body>

</html>