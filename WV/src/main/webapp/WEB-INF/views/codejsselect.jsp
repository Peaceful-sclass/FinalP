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
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
   
<link rel="stylesheet" href="http://codemirror.net/lib/codemirror.css">

<script src="http://codemirror.net/lib/codemirror.js"></script>
<script src="http://codemirror.net/addon/edit/matchbrackets.js"></script>
<script src="http://codemirror.net/addon/comment/continuecomment.js"></script>
<script src="http://codemirror.net/addon/comment/comment.js"></script>
<script src="http://codemirror.net/mode/javascript/javascript.js"></script>
<link rel="stylesheet" href="css/comunity.css">
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<style>

.CodeMirror {border: 1px solid rgb(201, 169, 31); width: 100%; height: 600px; }
		#container {
	    margin: 50px auto;
	    max-width: 720px;
	  }
	  #editor-container {
	    height: 350px;
	    border: 1px solid rgba(239, 204, 135, 0.8);
	  }
	  #toolbar-container{
	  	border: 1px solid rgba(239, 204, 135, 0.8);
	  }
	  
</style>


<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />

	<!-- Start Menu -->
	<div class="menu-box">
		<div class="container">
			<div class="row inner-menu-box">
				<div class="col-3">
					<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<a class="nav-link" id="team-main-tab" data-toggle="pill" href="#" role="tab" aria-controls="team-pills-main" aria-selected="true" onclick="teamSide(this); return false;">팀메인</a>
						<a class="nav-link" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="false" onclick="teamSide(this); return false;">일정</a>
						<a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false" onclick="teamSide(this); return false;">시트</a>
						<a class="nav-link active" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false" onclick="teamSide(this); return false;">코드</a>
						<a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false" onclick="teamSide(this); return false;">저장소</a>
					</div>
				</div>
				
				<div class="col-9">
					<div class="tab-content" id="v-pills-tabContent">
						<div class="tab-pane fade" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
							<div id='calendar'></div>
						</div>
						
						
						<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">

						</div>
						
						<div class="tab-pane fade show active" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab" >
							<div class="menu-box" style="padding: 0px 0 0px 0px;">
		<!-- write container Start -->
		<div class="container">
			<div class="row">
				<!-- 본문 상단 내용 -->
			</div>
			
			<!-- 본문 중단 시작 -->
			<div class="row">
				<div class="col-1"></div>
				
				<div class="col-10 dv-border">
					<!-- 제목 입력 -->
					<div class="dv-header">
						<div class="dv-subject2">
							<span> </span> &nbsp; 
							<span>${dto.myname }</span> &nbsp;| &nbsp;
							<span><fmt:formatDate value="${dto.mydate}" pattern="yyyy.MM.dd" /></span> &nbsp;| &nbsp;
						</div>
					<div class="dv-category">
						<a>Title:</a>
						<input class="dv-subject" type="text" name="title" value="${dto.mytitle }" readonly="readonly" style="border: 1px solid rgba(239, 204, 135, 1); width: 45%;"/>
					</div>
					<!-- 내용 입력-->
					<div class="dv-middle">
						<div class="dv-content">
							
								  
								  <div><textarea rows="10" cols="68" style="border: 1px solid rgb(201, 169, 31);" readonly="readonly">${dto.mycoment }</textarea> </div>
								  <div><textarea id="code">${dto.mycontent }</textarea> </div>
							</div>
						<input class="bt-write" type="button" value="목록" onclick="location.href='codemain.do'">
						<input class="bt-write" type="button" value="수정" onclick="location.href='updateform.do?myno=${dto.myno}&&myco=${dto.myco}'">
						<input class="bt-write" type="button" value="삭제" onclick="location.href='delete.do?myno=${dto.myno}&&myco=${dto.myco}'">
						</div>
						
						<!-- <textarea class="dv-textarea" name="dv-content-ta" cols="300" rows="900"></textarea> -->
					</div>

				</div>
				
				<div class="col-1"></div>
			</div>
			<div class="row">
				<!-- 본문 하단 내용 -->
			</div>
		</div>
		<!-- write container End -->
			
			
	</div>			
						</div>
						
						
						
						<div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">

						</div>
						
					</div>
				</div>		
			</div>
		</div>
	</div>
	<!-- End Menu -->
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
		
		//페이지 로드시 기본팀 선택
		let basicTeamNo = "${teamInfo.team_no}";
		teamSelectionCSS(basicTeamNo);
		
	}
	
	//팀 사이드 메뉴 클릭 시 동작 설정  << 각자 적기 
	function teamSide(param){
		let session = "${member.member_id}"; //session login 확인
		window.sessionTeamInfo = window.sessionStorage.getItem("teamInfo");
		let textcon = $(param).text();
		console.log("textcon: "+ textcon);
		console.log("sessionTeamInfo: "+ window.sessionTeamInfo);
		
		if(session == null || session == "" ||session == undefined ){
			location.href = "home.do"; //<<<공모전홈 이름 설정필요.
		}else if(sessionTeamInfo == null||sessionTeamInfo == ""||sessionTeamInfo == undefined){
			toastr.error("팀을 선택해주세요.", "팀선택 필요!", {tiemOut: 5000});
			return false;
		}
		
		if(textcon == "팀메인"){
			sidePost('team.do','${member.member_no}');
		} else if(textcon == "일정"){
			location.href="shareCalendarList.do";
		} else if(textcon == "시트"){
			location.href="shareDocumentList.do";
		} else if(textcon == "코드"){
			//location.href="team.do?member_no="+${member.member_no};
			location.href="codemain.do";
		} else if(textcon == "저장소"){
			location.href="shareBoardList.do";
		}
		
	}	
		
	var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
        lineNumbers: true,
        matchBrackets: true,
        continueComments: "Enter",
        extraKeys: {"Ctrl-Q": "toggleComment"}
      });
      hljs.configure({
		  languages: ['javascript', 'ruby', 'python', 'java', 'html', 'css', 'cpp']
		});
		
		var quill = new Quill('#editor-container', {
		    modules: {
		      formula: true,
		      syntax: true,
		      toolbar: '#toolbar-container'
		    },
		    contant: '내용을 입력해 주세요.',
		    theme: 'snow',
	        readOnly: true
		});

		
		//const delta = quill.clipboard.convert(ctt);
		
		quill.setContents(ctt2, 'silent');
	</script>
	
<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
