<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<%	request.setCharacterEncoding("UTF-8"); %>
<% 	response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

		<style>
		
		   #userId{
		         width:80px;
		         height: 25px;
		   }
		   
		   #userPass{
		         width:80px;
		         height: 25px;		   
		   }
		   
		   #logbt{
		         width:60px;
		         height: 25px;		
		         font-size: 5px;
		   }
		   #regibt{
		         width:60px;
		         height: 25px;	
		         font-size: 5px;
		   }
		   #memberUpdateBtn{
		         width:60px;
		         height: 25px;	
		         font-size: 5px;	
		   }
		   #memberDeleteBtn{
		         width:60px;
		         height: 25px;	
		         font-size: 5px;	
		   }		   		   
		   #outBtn{
		         width:60px;
		         height: 25px;	
		         font-size: 5px;	
		   }    
		   
		          
		</style>

</head>
<!-- 로그인 스크립트 -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#outBtn").on("click", function(){
			location.href="logout.do";

		})
		
		$("#registerBtn").on("click", function(){
			location.href="register.do";
		})
		
		$("#memberUpdateBtn").on("click", function(){
			location.href="test.do";
		})    
		
		$("#memberDeleteBtn").on("click", function(){
			location.href="dest.do";
		})  
	});
</script>
<body>
      			<!-- 로그인// -->
		<form name='homeForm' method="post" action="login.do" >
		<c:if test="${member == null}">
			<div>
				<label for="member_id"></label>
				<input type="text" id="userId" name="member_id">
			</div>
			<div>
				<label for="member_pw"></label>
				<input type="password" id="userPass" name="member_pw" >
			</div>
			<div>
				      <span><a href="login.do"><button type="submit" id="logbt">로그인</button></a></span>
				      <span><a href="register.do"><button type="button" id="regibt">회원가입</button></a></span>  
				<!--<button type="submit">로그인</button>
				<button id="registerBtn" type="button">회원가입</button>-->
			</div>
		</c:if>
		<c:if test="${member != null }">
			<div>
				<p>${member.member_id}님 환영 합니다.</p>
				<button id="memberUpdateBtn" type="button">회원수정</button>
				<!-- function빼고 해보기 
				<span><a href="memberUpdateView"><button type="button">회원정보수정</button></a></span>-->
				<button id="memberDeleteBtn" type="button">회원탈퇴</button>
				<button id="outBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">     <!-- 컨트롤러값 -->
			<p style="color: red;">아이디와 비밀번호 확인해주세요.</p>
		</c:if>
	</form>
	
</body>
</html>