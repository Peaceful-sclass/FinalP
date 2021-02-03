<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%	request.setCharacterEncoding("UTF-8"); %>
<% 	response.setContentType("text/html; charset=UTF-8"); %>	

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko"><!-- Basic -->

	<head>
	     <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	     
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원탈퇴</title>
		
				<style>
		   #userId{
		         width:200px;
		   }
		   #userPass{
		         width:200px;
		   }		   
		   #userEmail{
		         width:200px;
		   }	

		</style>
	</head>

	<body>
	<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />
	      
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
			
		
	</script>
	      
	     <div class="menu-box">
	
		<div class="container">
		
		
		
			<form action="memberDelete.do" method="post" id="delForm">
			
			    	<div class="row">
					<div class="col-2"></div>
					<div class="col-8">
			    
				<div class="form-group has-feedback">
					<label class="control-label" for="member_id">아이디</label>
					<input class="form-control" type="text" id="userId" name="member_id" value="${member.member_id}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="member_pw">패스워드</label>
					<input class="form-control" type="password" id="userPass" name="member_pw" placeholder="현재 패스워드 입력"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="member_email">이메일</label>
					<input class="form-control" type="text" id="userEmail" name="member_email" value="${member.member_email}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<button  type="submit" id="submit">회원탈퇴</button>
					<button  type="button" id="cc">취소</button>
				</div>
				
			        </div>  <!-- col-8 end -->
					<div class="col-2"></div>
				
				
				</div><!-- row -->
			</form>
			
			<div>
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
			</div>
			
		</div><!-- container -->
		
		</div><!-- menu-box -->
		
		<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
	</body>
	
</html>