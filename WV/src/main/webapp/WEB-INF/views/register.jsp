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
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/login";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userEmail").val()==""){
					alert("이메일을 입력해주세요.");
					$("#userEmail").focus();
					return false;
				}
			});
			
			
		
			
		})
	</script>
	<body>
		<section id="container">
			<form action="register.do" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="member_id">아이디</label> <!-- for는 member-mapper부분 -->
					<input class="form-control" type="text" id="userId" name="member_id" />    <!-- id는 위에 알림창 script부분, name은 member-mapper부분 -->
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="member_pw">패스워드</label>
					<input class="form-control" type="password" id="userPass" name="member_pw" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="member_email">이메일</label>
					<input class="form-control" type="text" id="userEmail" name="member_email" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="member_grade">회원등급</label>
					<select class="form-control" id="userGrade" name="member_grade">
				           <option>일반회원</option>
				    </select>
				</div>	
												
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원가입</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
		
	</body>
	
</html>