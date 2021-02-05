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


<title>회원탈퇴</title>

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
      border-style:solid;
      border-color: #DB631F;
      border-radius: 2px;
}
#cc {
      border-style: #DB631F;
      background-color: #f8f9fa;
      font-weight: bold;
      border-style:solid;
      border-radius: 2px;
}

#f {
	color: #DB631F;
	font-weight: bold;
}

.col-8 {
	left: 220px;
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
				$.ajax({
					url : "passChk",
					type : "POST",
					dataType : "json",
					data : $("#delForm").serializeArray(),
					success: function(data){
						
						if(data==0){
							alert("패스워드가 틀렸습니다.");
							return;
						 }else{
							if(confirm("회원탈퇴하시겠습니까?")){
								$("#delForm").submit();
							}
							
						}
					}
				})				
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
		

	</script>

	<div class="menu-box">

		<div class="container">



			<form action="memberDelete.do" method="post" id="delForm">

				<div class="row">
					<div class="col-2"></div>
					<div class="col-8">
                          <h1>회원탈퇴</h1>
                          <br>
						<div class="form-group has-feedback">
							<label class="control-label" for="member_id" id="f">아이디</label> <input
								class="form-control" type="text" id="userId" name="member_id"
								value="${member.member_id}" readonly="readonly"/>
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="member_pw" id="f">패스워드</label> <input
								class="form-control" type="password" id="userPass"
								name="member_pw" placeholder="현재 패스워드 입력" />
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="member_pwC" id="f">패스워드 확인</label> <input
								class="form-control" type="password" id="userPassC"
								name="member_pw2" placeholder="패스워드확인" />
							<p id="pwsame" style="color: red;"></p>
						</div>
						<div class="form-group has-feedback" style="display:none">
							<label class="control-label" for="member_email" id="f" >이메일</label> <input
								class="form-control" type="text" id="userEmail"
								name="member_email" value="${member.member_email}"
								readonly="readonly" />
						</div>
						<div class="form-group has-feedback">
							<button type="submit" id="submit">회원탈퇴</button>
							<button type="button" id="cc">취소</button>
						</div>

					</div>
					<!-- col-8 end -->
					<div class="col-2"></div>


				</div>
				<!-- row -->
			</form>

			<div>
				<c:if test="${msg == false}">
					패스워드가 맞지 않습니다.
				</c:if>
			</div>

		</div>
		<!-- container -->

	</div>
	<!-- menu-box -->

	<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp"
		flush="false"></jsp:include>
</body>

</html>