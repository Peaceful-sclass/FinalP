<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
		
	 <style>
		   #userId{
		         width:160px;
		   }
		   #userPass{
		         width:200px;
		   }		   
		   #userEmail{
		         width:200px;
		   }	
		   

		   

		</style>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$("#cc").on("click", function(){
				
				location.href = "/root";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
			});
			
				
			
		})
	</script>
	<body>
	<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />
		<section id="container">
	       	<h1>회원수정</h1>
			<form action="memberUpdate.do" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="member_id">아이디</label>
					<input class="form-control" type="text" id="userId" name="member_id" value="${member.member_id}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="member_pw">패스워드</label>
					<input class="form-control" type="password" id="userPass" name="member_pw" placeholder="바꾸실 패스워드 입력"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="member_email">이메일</label>
					<input class="form-control" type="text" id="userEmail" name="member_email" value="${member.member_email}" placeholder="바꾸실 이메일 입력"/>
				</div>
				<div class="form-group has-feedback">
					<button type="submit" id="submit">회원정보수정</button>
					<button type="button" id="cc">취소</button>
				</div>
			</form>
		</section>
		<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
	</body>
	
</html>