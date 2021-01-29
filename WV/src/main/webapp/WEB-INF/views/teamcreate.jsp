<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	request.setCharacterEncoding("UTF-8"); %>
<% 	response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- %@ page session="false" %> --%>

<!DOCTYPE html>
<html lang="ko"><!-- Basic -->
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
 
     <!-- Site Metas -->
    <title>team create</title>  
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="css/team.css">
    <script type="text/javascript" src="js/team.js"></script>
    <script>
    	window.onload = function(){ //팀만들기 결과창 확인 후 팀화면이동
    		let res = '${createTeamRes}';
    		if(res!=null && res != "" && res!=undefined){
    			toastr.success("팀을 만들었습니다.","팀생성",{timeOut:1000});
    			setTimeout(()=>{
    				let form = document.createElement("form");
					$(form).append($('<input/>', {type: 'hidden', name: 'member_no', value:'${member.member_no}' }));
					$(form).append($('<input/>', {type: 'hidden', name: 'member_id', value:'${member.member_id}' }));
					form.action = 'teamin.do';
					form.method = "post";
					document.body.appendChild(form);
					form.submit();
    			}, 1000);
    		}
    	};
    </script>
</head>

<body>
<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />
	<!-- Start Menu -->
	<div class="menu-box">
		<div class="container">
			
			
		<form action="" method="post" id="tcreateform">
			<div class="row">
				<div class="col-2"></div>
				
					<input type="hidden" name="member_no" value="${member.member_no}" />
					<input type="hidden" name="member_id" value="${member.member_id}" />
					<div class="col-8" id="team-create">
						<div class="text-center">
							<img src="images/we-removebg.png" style="margin: 30px; width: 15%;" alt="팀생성이미지"/>
						</div>
						<!-- <h2 style="font-weight: 500;">팀이 없습니다. 팀에 소속</h2> -->
						<div class="team-create-in">
							<!-- <label for="tn">팀이름 : </label> -->
							<input type="text" id="tn" name="team_name" placeholder="팀명을 입력해주세요."  />
							<!-- <label for="ti">팀소개 : </label> -->
							<textarea name="team_intro" id="ti" cols="50" rows="5" placeholder="간단한 소개를 입력해주세요." ></textarea>
						</div>
						<div class="team-create-btarea">
							<a href="#" class="btn btn-sm btn-primary" data-mid="${member.member_id}" onclick="createTeam(this); return false;">팀만들기</a>
						</div>
					</div><!-- col-8 end -->

				<div class="col-2"></div>
			</div><!-- main Row End -->
		</form>
			
		</div><!-- Container End -->
	</div>
	<!-- End Menu Box -->
	
	
<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</body>
</html>