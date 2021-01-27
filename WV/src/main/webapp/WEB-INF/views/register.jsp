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
		         width:130px;
		   }
		   #userPass{
		         width:130px;
		   }		   
		   #userEmail{
		         width:200px;
		   }	
		   #userGrade{
		         width:140px;  
		   }	
		</style>
		
	</head>
	<script type="text/javascript">
				$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/root";
						    
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
				
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("중복확인을 해주세요");
					return false;
					
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
				}
			});
		})
         $(document).on('click', '. "#fn_idChk"', function(){
					$.ajax({
					url : "idChk",	
					type :"post",
					dataType : "json",
					data : {"userId" : $("#userId").val()},
					success : function(data){
						if(data == 1){
							alert("중복된 아이디입니다.");
						}else if(data == 0){
							$("#idChk").attr("value", "Y");
							alert("사용가능한 아이디입니다.");
				        }
					  }
					});
				})
    </script>
	<body>
		<section id="container">
			<form action="register.do" method="post" id="regForm">
				<div class="form-group has-feedback">
					<label class="control-label" for="member_id">아이디</label> <!-- for는 member-mapper부분 -->
					<input class="form-control"  type="text" id="userId" name="member_id" />    <!-- id는 위에 알림창 script부분, name은 member-mapper부분 -->
				    <button class="idChk" type="button" id="idChk" id="fn_idChk" value="N">중복확인</button> 
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
					<button class="cencle btn btn-danger" type="button" >취소</button>
				</div>
			</form>
		</section>
		
	</body>
	
</html>