<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	request.setCharacterEncoding("UTF-8"); %>
<% 	response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.wv.root.model.dto.TeamDto.TeamMemberDto" %>


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
    <title>team main</title>  
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
   	<link rel="stylesheet" href="css/team.css">
   	<script type="text/javascript" src="js/team.js"></script>
    <script>
    	var sessionTeamInfo;
    	window.onload = function(){
    		let session = "${member.member_id}"; //session login 확인
    		if(session == null || session == "" ||session == undefined ){
    			location.href = "home.do";
    		}
    		//팀아이콘배경랜덤
    		let tmiconbg = document.getElementsByClassName("why-text");
    		let bgcolor = {
    			1:"background: rgba(207, 166, 113, 0.9);",
    			2:"background: rgba(222, 255, 222, 0.9);",
    			3:"background: rgba(255, 222, 239, 0.9);",
    			4:"background: rgba(239, 222, 255, 0.9);",
    			5:"background: rgba(255, 255, 227, 0.9);",
    			6:"background: rgba(222, 222, 239, 0.9);",
    			7:"background: rgba(222, 255, 255, 0.9);",
    			8:"background: rgba(255, 222, 255, 0.9);",
    			9:"background: rgba(255, 255, 222, 0.9);",
    			10:"background: rgba(222, 222, 255, 0.9);",
    			11:"background: rgba(239, 222, 239, 0.9);",
    			12:"background: rgba(239, 239, 222, 0.9);"
    		}
    		for(let i=0; i<tmiconbg.length; i++){
    			let r = Math.floor(Math.random()*Object.keys(bgcolor).length)+1;
    			tmiconbg[i].setAttribute("style",bgcolor[r]);
    			//tmiconbg[i].style.background = bgcolor[r];
    		}
    		
    		//페이지 로드시 기본팀 선택. 이후는 선택된 팀 선택
    		//let basicTeamNo = "${teamInfo.team_no}";
    		//console.log("[teamin.jsp]basicTeamNo: "+basicTeamNo);
    		/*let currteamno = sessionStorage.getItem("teamInfo");
    		if(currteamno == null||currteamno == ""||currteamno == undefined){
	    		sessionStorage.setItem("teamInfo","${teamInfo.team_no}");
	    		sessionStorage.setItem("teamInfo","${teamInfo.team_no}");
    		}
	    		sessionStorage.setItem("teamName","${teamInfo.team_name}");
    		*/
    		teamSelectionCSS();
    		

    		
    	}//window.onload end
    	
    	//팀 사이드 메뉴 클릭 시 동작 설정  << 각자 적기 
    	function teamSide(param){
    		let session = "${member.member_id}"; //session login 확인
    		window.sessionTeamInfo = window.sessionStorage.getItem("teamInfo");
    		let textcon = $(param).text();
    		console.log("textcon: "+ textcon);
    		console.log("sessionTeamInfo: "+ window.sessionTeamInfo);
    		console.log("TeamInfo.team_no: ${teamInfo.team_no}");
    		
    		
    		
    		if(session == null || session == "" ||session == undefined ){
    			location.href = "home.do"; //<<<공모전홈 이름 설정필요.
    		}else if(sessionTeamInfo == null||sessionTeamInfo == ""||sessionTeamInfo == undefined){
    			toastr.error("팀을 선택해주세요.", "팀선택 필요!", {tiemOut: 5000});
    			return false;
    		}//ajax로 다시 세션의 갱신된 값을 가져오기. 로그아웃시 css초기화 <== 로그아웃시 세션번호값 초기화 하면 ajax작업안해도된다!
    		
/*     		<c:if test="${teamInfo.team_no == null }">
	    		else if(true){
				toastr.error("팀을 선택해주세요.", "팀선택 필요!", {tiemOut: 5000});
				return false;	    			
	    		}
			</c:if> */

    		
    		if(textcon == "팀메인"){
    			sidePost('team.do','${member.member_no}');
    		} else if(textcon == "일정"){
    			location.href="shareCalendarList.do";
    		} else if(textcon == "시트"){
    			location.href="shareDocumentList.do";
    		} else if(textcon == "코드"){
    			
    		} else if(textcon == "저장소"){
    			location.href="shareBoardList.do";
    		}
    		
    	}

    </script>
	
</head>

<body>
<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />
	<!-- Start Menu -->
	<div class="menu-box">
		<div class="container">
			
			<div class="row inner-menu-box">
				<div class="col-3">
					<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<a class="nav-link active" id="team-main-tab" data-toggle="pill" href="#" role="tab" aria-controls="team-pills-main" aria-selected="true" onclick="teamSide(this); return false;">팀메인</a>
						<a class="nav-link" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="false" onclick="teamSide(this); return false;">일정</a>
						<a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false" onclick="teamSide(this); return false;">시트</a>
						<a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false" onclick="teamSide(this); return false;">코드</a>
						<a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false" onclick="teamSide(this); return false;">저장소</a>
					</div>
				</div>
				
				<div class="col-9">
					<div class="tab-content" id="v-pills-tabContent">

						<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
							<!-- 팀관리줄 -->
							<div class="row justify-content-end">
								<div class="team-main">
									<div class="team-main-top" style="position:absolute; left:20px;">
										<a class="btn btn-primary" href="#" data-mid="${member.member_id}" onclick="teamManageBT(this); return false;"  style="padding: 5px 15px;background: #DB631F;color: white;">팀정보</a>
									</div>
								</div>
								<div class="team-main">
									<div class="team-main-top">
										<a class="btn btn-primary" href="#" data-mid="${member.member_id}" onclick="teamCreateBT(this); return false;"  style="padding: 5px 15px;background: #DB631F;color: white;">팀만들기</a>
									</div>
								</div>
								<div class="team-main">
									<div class="team-main-top">
										<a class="btn btn-primary" href="#" data-mid="${member.member_id}" onclick="teamInviteBT(this); return false;" style="padding: 5px 15px;background: #DB631F;color: white;">팀초대</a>
									</div>
								</div>
							</div><!-- 팀관리줄 End -->
							
							<hr />
							<!-- 팀목록 Start -->
							<div class="row">
								<c:forEach var="dto" items="${team}">
									<div class="col-lg-4 col-md-6 special-grid drinks">
										<div class="gallery-single fix">
											<div class="why-text whytext2" data-tname="${dto.team_name}" data-tno="${dto.team_no}" onclick="teamIcon(this); return false;" style="cursor:pointer;">
												<h4><a href="#" >${dto.team_name}</a></h4>
												<p><a href="#">${dto.team_intro}</a></p>
											</div>
										</div>
									</div>
								
								</c:forEach>
								
							</div><!-- 팀목록 End -->
							
						</div>
						
					
						
					</div><!-- tab content end -->

				</div><!-- col-9 end -->

			</div><!-- main Row End -->
			
		</div><!-- Container End -->
	</div>
	<!-- End Menu Box -->
	
	
	
	<!-- Invite Modal -->
    <div class="modal" id="invitemodal" role="dialog" data-backdrop="false">
        <div class="modal-dialog" id="iv-modal-dialog">
            <div class="modal-content" style="background-color: #f8f9fa;">
                <!-- <div class="modal-header">
                 	<h4 id="modal-title" class="modal-title"></h4>                 	             	
                </div> -->
                <div class="modal-body" style="padding: 0 50px;">
					<div class="input-group">
						<div class="input-box">
				    		<input type="text" name="idtoInvite" id="iv-modal-input" placeholder="초대할 ID를 입력해주세요." >
				    	</div>
				    </div>
						
                </div>
                <div class="modal-footer justify-content-center" style="border-top: 0px; padding: 7px 20px;" >
                	<button type='button' class="btn btn-sm btn-primary" id="iv-modal-ivbt" data-mid="${member.member_id}" onclick="teamInviteSend(this)">초대</button>
                	<button type='button' class="btn btn-sm btn-primary" id="iv-modal-ccbt" data-dismiss='modal' onclick="(()=>{$('#iv-modal-input').val('');})();">취소</button>
                </div>
            </div>
        </div>
    </div>	
    
	<!-- Manage Modal -->
    <div class="modal" id="managemodal" role="dialog" data-backdrop="false">
        <div class="modal-dialog" id="mmdialog">
            <div class="modal-content">
                <div class="modal-header" style="justify-content: center;">
                 	<!-- <h4 id="modal-title" class="modal-title"></h4> -->
                	<button type='button' class="btn btn-sm btn-primary" id="mmTeamNamebt" data-mid="${member.member_id}">팀의 이름입니다.</button>
                 	                 	             	
                </div> 
                <div class="modal-body">
					<div class="justify-content-center" id="mmC">
						<table class="table-sm table-hover" style="width: 100%;">
						  <thead>
						    <tr>
						      <th scope="col" style="width:30%;">F</th>
						      <th scope="col" style="width:50%;">팀원</th>
						      <th scope="col">등급</th>
						    </tr>
						  </thead>
						  <tbody>
						  
						    <tr>
						      <td>
						      	<input type="checkbox" name="tmchkbox" />
						      </td>
						      <td>Mark</td>
						      <td>
						      	<select name="grade_inteam" >
									<option value="매니저">매니저</option>
									<option value="팀원">팀원</option>
								</select>
						      </td>
						    </tr>
					
						  </tbody>
						</table>
					</div>
						
                </div>
                <div class="modal-footer justify-content-center" style="border-top: 0px; padding: 7px 20px;" >
                	<button type='button' class="btn btn-sm btn-primary" id="mmCdbt" data-mid="${member.member_id}" onclick="teamManageConfirm(this)">변경</button>
                	<button type='button' class="btn btn-sm btn-primary" id="mmCcbt" data-dismiss="modal" onclick="(()=>{$('#managemodal').val('');$('body').css('overflow', 'scroll');})();">취소</button>
                </div>
            </div>
        </div>
    </div>	
	
		
<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</body>
</html>