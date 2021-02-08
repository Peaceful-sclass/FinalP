<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	request.setCharacterEncoding("UTF-8"); %>
<% 	response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%-- %@ page session="false" %> --%>



<!DOCTYPE html>
<html lang="ko"><!-- Basic -->
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
   
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
 
     <!-- Site Metas -->
    <title>sidemenu example</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
	
	<!-- calendar -->
	<link href="fullcalendar/main.css" rel="stylesheet" />
	<script src="fullcalendar/main.js"></script>
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
		//let basicTeamNo = "${teamInfo.team_no}";
		//teamSelectionCSS();
		
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
			$("<form></form>").attr("method","post").attr("action","team.do").append($('<input/>',{type:'hidden',name:'member_no',value:'${member.member_no}'})).appendTo('body').submit();
		} else if(textcon == "일정"){
			location.href="shareCalendarList.do";
		} else if(textcon == "시트"){
			location.href="shareDocumentList.do";
		} else if(textcon == "코드"){
			location.href="team.do?member_no="+${member.member_no};
		} else if(textcon == "저장소"){
			location.href="shareBoardList.do";
		}
		
	}	
	
	
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
	
			var calendar = new FullCalendar.Calendar(calendarEl, {
				
				editable : true,
				selectable : true,
			      selectMirror: true,
			      select: function(arg) {
			        var title = prompt('일정을 입력하세요:');
			        if (title) {
			          calendar.addEvent({
			            title: title,
			            start: arg.start
			          }),
			          location.href='shareCalendarInsert.do?title='+title+'&start='+arg.start;
			          
			        }
			        calendar.unselect()
			      },
			      eventClick: function(arg) {
			        if (confirm('일정을 지우시겠습니까??')) {
			        	location.href='shareCalendarDelete.do?start='+arg.event.title
			        }
			        
			      },
			      editable: true,
				businessHours : true,
				dayMaxEvents : true, // allow "more" link when too many events
				events : [ {
					title : 'All Day Event',
					start : '2020-09-01'
				}
				<c:forEach items="${list }" var="caldto">
				,{
					title :	"${caldto.calTitle }",
					start : "${caldto.calStart }"
				}
				</c:forEach>
				]
			});
	
			calendar.render();
		});
	</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}



</style>

</head>

<body>
<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />
	<!-- Start Menu -->
	<div class="menu-box">
		<div class="container">
			<div class="row inner-menu-box">
				<div class="col-3">
					<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<a class="nav-link" id="team-main-tab" data-toggle="pill" href="#" role="tab" aria-controls="team-pills-main" aria-selected="true" onclick="teamSide(this); return false;">팀메인</a>
						<a class="nav-link  active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="false" onclick="teamSide(this); return false;">일정</a>
						<a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false" onclick="teamSide(this); return false;">시트</a>
						<a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false" onclick="teamSide(this); return false;">코드</a>
						<a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false" onclick="teamSide(this); return false;">저장소</a>
					</div>
				</div>
				
				<div class="col-9">
					<div class="tab-content" id="v-pills-tabContent">
						<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
							<div id='calendar'></div>
						</div>
						
						
						<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">

						</div>
						
						<div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab" >
							
						</div>
						
						<div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">

						</div>
						
					</div>
				</div>		
			</div>
		</div>
	</div>
	<!-- End Menu -->
	
	
<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</body>
</html>