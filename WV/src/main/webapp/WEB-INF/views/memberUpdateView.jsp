<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%	request.setCharacterEncoding("UTF-8"); %>
<% 	response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

#cc:hover {
	background: #bebebe;
	color: #f8f9fa;
	border-radius: 2px;
}

#userPassC:hover {
	background: #DB631F;
	color: white;
}

#userEmail:hover {
	background: #DB631F;
	color: white;
}

#userGrade:hover {
	background: #DB631F;
	color: white;
}

#memberDeleteBtn:hover {
	background: #DB631F;
	color: white;
	border-radius: 2px;
}

#userId {
	width: 200px;
}

#userPass {
	width: 200px;
}

#userPassC {
	width: 200px;
}

#userEmail {
	width: 200px;
}

#submit {
	background-color: white;
	color: #DB631F;
	font-weight: bold;
	border-style: solid;
	border-color: #DB631F;
	border-radius: 2px;
}

#memberDeleteBtn {
	background-color: white;
	color: #DB631F;
	font-weight: bold;
	border-style: solid;
	border-color: #DB631F;
	border-radius: 2px;
}

#cc {
	border-style: #DB631F;
	background-color: #f8f9fa;
	font-weight: bold;
	border-style: solid;
	border-radius: 2px;
}

#f {
	color: #DB631F;
	font-weight: bold;
}

.col-8 {
	left: 220px;
}

.filelabel {
	display: inline-block;
	padding: 1px 6px;
	vertical-align: middle;
	cursor: pointer;
	background-color: white;
	color: #DB631F;
	font-weight: bold;
	border: 2px solid #DB631F;
	border-radius: 2px;
	margin: 1% 0px 0px 1%;
}

.filelabel:hover {
	background: #DB631F;
	color: white;
	border-radius: 2px;
}

input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

#member_pfname {
	width: 200px;
	border-radius: 2px;
	float: left;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/headerfooter/header.jsp"
		flush="false" />

	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$("#cc").on("click", function(){
				
				location.href = "/root";
						    
			})
		
			$("#submit").on("click", function(){
				//비번확인
				if($("#userPass").val()==""){
					alert("패스워드를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}	
				//비번체크확인
				if ($("#userPassC").val() == "") {
					alert("패스워드확인을 입력해주세요.");
					$("#userPassC").focus();
					return false;
				}	
				if($("#userEmail").val()==""){
					alert("이메일을 입력해주세요.");
					$("#userEmail").focus();
					return false;
				}

			});
			
			//프로필 이미지 변경
			$("#member_pfimg").on('change', function(){ 
				var imgname = $("#member_pfimg").val().split('/').pop().split('\\').pop();
			    $("#member_pfname").val(imgname);
			});
			
		})

				//비밀번호확인
				function tocheckpw(){
					var member_pw=document.getElementById("userPass").value;
					var member_pwC=document.getElementById("userPassC").value;
				
				if(member_pw != member_pwC){
					document.getElementById('pwsame').innerHTML = '비밀번호가다릅니다 다시입력해서주세요'
				   return false;
				}
				}
       
		 //한글입력 안되게 처리
		$(document).ready(function(){

			  $("input[class=form-control]").keyup(function(event){ 

			   if (!(event.keyCode >=37 && event.keyCode<=40)) {

			    var inputVal = $(this).val();

			    $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));

			   }

			  });

			});
		 //회원탈퇴 이동
		$("#memberDeleteBtn").on("click", function(){
			location.href="dest.do";
		})
		</script>

	<div class="menu-box">

		<div class="container">
			<form action="memberUpdate.do" method="post"
				enctype="multipart/form-data">

				<div class="row">
					<div class="col-2"></div>
					<div class="col-8">
						<h1>회원수정</h1>
						<br>
						<div class="form-group has-feedback">
							<label class="control-label" for="member_id" id="f"
								style="ime-mode: disabled">아이디</label> <input
								class="form-control" type="text" id="userId" name="member_id"
								value="${member.member_id}" readonly="readonly" />
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="member_pw" id="f"
								style="ime-mode: disabled">패스워드 수정</label> <input
								class="form-control" type="password" id="userPass"
								name="member_pw" maxlength="8" placeholder="8자이내 영문,숫자 입력" />
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="member_pwC" id="f"
								style="ime-mode: disabled">패스워드 확인</label> <input
								class="form-control" type="password" id="userPassC"
								name="member_pw2" maxlength="8" placeholder="8자이내 영문,숫자 입력" />
							<p id="pwsame" style="color: red;"></p>
						</div>
						<div class="form-group has-feedback" style="display: none">
							<label class="control-label" for="member_email" id="f"
								style="ime-mode: disabled">이메일 수정</label> <input
								class="form-control" type="text" id="userEmail"
								name="member_email" value="${member.member_email}"
								placeholder="바꾸실 이메일 입력" />
						</div>
						<div class="form-group has-feedback">
							<div class="control-label" id="f" style="margin-bottom: .5rem;">프로필사진</div>
							<input type="text" class="form-control" id="member_pfname"
								value="" readonly="readonly"> <label for="member_pfimg"
								class="filelabel">파일선택</label> <input type="file"
								name="member_pfimg" id="member_pfimg" accept="image/*">
						</div>
						<div class="form-group has-feedback">
							<button type="submit" id="submit">회원정보수정</button>
							<button type="button" id="memberDeleteBtn">회원탈퇴</button>
							<button type="button" id="cc">취소</button>
						</div>



					</div>
					<!-- col-8 end -->
					<div class="col-2"></div>

				</div>
			</form>

		</div>
		<!-- container -->
	</div>
	<!-- 메뉴박스 -->
	<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp"
		flush="false"></jsp:include>
</body>

</html>