<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

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

<title>회원가입</title>

<style>
#userId:hover {
	background: #DB631F;
	color: white;
}

#userPass:hover {
	background: #DB631F;
	color: white;
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

#userId {
	width: 200px;
	border-radius: 2px;
}

#userPass {
	width: 200px;
	border-radius: 2px;
}

#userPassC {
	width: 200px;
	border-radius: 2px;
}

#userEmail {
	width: 200px;
	border-radius: 2px;
}

#userGrade {
	width: 140px;
	border-radius: 2px;
}

#container {
	position: relative;
	left: 400px;
	top: 30px;
	border-radius: 2px;
}

#submit {
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
	left: 240px;
}
</style>


</head>

<body>
	<jsp:include page="/WEB-INF/views/headerfooter/header.jsp"
		flush="false" />

	<script type="text/javascript">
		$(document).ready(function() {
			// 취소
			$("#cc").on("click", function() {

				location.href = "/root";

			})
			//아이디 입력확인
			$("#submit").on("click", function() {
				if ($("#userId").val() == "") {
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}

				//비번입력확인
				if ($("#userPass").val() == "") {
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
				//이메일입력확인
				if ($("#userEmail").val() == "") {
					alert("이메일을 입력해주세요.");
					$("#userEmail").focus();
					return false;
				}
				
				//도메인선택확인
				if ($("#dm").val() == "") {
					alert("도메인을 선택해주세요.");
					$("dm").focus();
					return false;
				}
			});
		})

		//비밀번호확인
		function tocheckpw() {
			var member_pw = document.getElementById("userPass").value;
			var member_pwC = document.getElementById("userPassC").value;

			if (member_pw != member_pwC) {
				document.getElementById('pwsame').innerHTML = '비밀번호가다릅니다 다시입력해서주세요'
				return false;
			}
		}
	</script>


	<div class="menu-box">

		<div class="container">


			<form action="register.do" onsubmit="return tocheckpw()"
				data-ajax="false" method="post">
				<!-- onsubmit="return tocheckpw()" data-ajax="false" 해당function이 맞으면 submit 아니면 페이지그대로-->

				<div class="row">
					<div class="col-2"></div>
					<div class="col-8">
						<h1>회원가입</h1>
						<br>
						<div class="form-group has-feedback">
							<label class="control-label" for="member_id" id="f">아이디</label>
							<!-- for는 member-mapper부분 -->
							<input class="form-control" type="text" id="userId"
								name="member_id" maxlength="8" placeholder="8자이내 입력">
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="member_pw" id="f">패스워드</label>
							<input class="form-control" type="password" id="userPass"
								name="member_pw" placeholder="패스워드" />
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="member_pwC" id="f">패스워드
								확인</label> <input class="form-control" type="password" id="userPassC"
								name="member_pw2" placeholder="패스워드확인" />
							<p id="pwsame" style="color: red;"></p>
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="member_email" id="f">이메일</label> 
							<input class="form-control" type="text" id="userEmail"
								name="member_email" placeholder="이메일 입력" />@
							 <select class="select" id="dm" title="이메일 도메인 주소 선택" onclick="setEmailDomain(this.value);return false;">
								<option value="">-선택-</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="korea.com">korea.com</option>
								<option value="nate.com">nate.com</option>
								<option value="yahoo.com">yahoo.com</option>
							</select>


						</div>
						<div class="form-group has-feedback" style="display: none">
							<!-- 아직 사용안하는부분이라 숨김 -->
							<label class="control-label" for="member_grade" id="f">회원등급</label>
							<select class="form-control" id="userGrade" name="member_grade">
								<option>일반회원</option>
							</select>
						</div>
						<div class="form-group has-feedback">
							<button type="submit" id="submit">회원가입</button>
							<button type="button" id="cc">취소</button>
						</div>

					</div>
					<!-- col-8 end -->
					<div class="col-2"></div>

				</div>
				<!-- row -->
			</form>


		</div>
		<!-- container -->
	</div>
	<!-- menu박스 -->
	<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp"
		flush="false"></jsp:include>
</body>

</html>