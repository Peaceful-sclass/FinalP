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
    			location.href="team.do?member_no="+${member.member_no};
    		} else if(textcon == "저장소"){
    			location.href="shareBoardList.do";
    		}
    		
    	}

    	
    	
    </script>
	<!-- calendar -->
	<link href="fullcalendar/main.css" rel="stylesheet" />
	<script src="fullcalendar/main.js"></script>
<style>
table { 
    width: 750px; 
    border-collapse: collapse; 
    margin:50px auto;
    }
/* Zebra striping */
tr:nth-of-type(odd) { 
    background: #eee; 
    }
th { 
    background: #f57936; 
    color: white; 
    font-weight: bold; 
    }
td, th { 
    padding: 10px; 
    border: 1px solid #ccc; 
    text-align: left; 
    font-size: 18px;
    }
input {
	background-color: white;
    color: #DB631F;
    font-weight: bold;
    border-style: solid;
    border-color: #DB631F;
    border-radius: 2px;

}

table tr td input {
	background-color: white;
	color: #666666;
    font-weight: bold;
    border-style: solid;
    border-color: #f57b36;
    border-radius: 2px;

}


</style>

</head>

<body>
<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />
	<!-- Start Menu -->
	<div class="menu-box">
		<div class="container">
			<c:out value="${row1.colA }"></c:out>
			
			<div class="row inner-menu-box">
				<div class="col-3">
					<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<a class="nav-link" id="team-main-tab" data-toggle="pill" href="#" role="tab" aria-controls="team-pills-main" aria-selected="true" onclick="teamSide(this); return false;">팀메인</a>
						<a class="nav-link" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="false" onclick="teamSide(this); return false;">일정</a>
						<a class="nav-link  active" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false" onclick="teamSide(this); return false;">시트</a>
						<a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false" onclick="teamSide(this); return false;">코드</a>
						<a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false" onclick="teamSide(this); return false;">저장소</a>
					</div>
				</div>
				
				<div class="col-9">
					<div class="tab-content" id="v-pills-tabContent">
						<div class="tab-pane fade show active" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
							<div class="row">
									<c:choose>
										<c:when test="${!empty check}">
											<form action="shareDocumentUpdate.do"  method="post">
												<table class="styled-table">
													<thead>
													<tr>
														<th colspan="3" align="center">update</th>
														<th colspan="3" align="center">A</th>
														<th colspan="3" align="center">B</th>
														<th colspan="3" align="center">C</th>
														<th colspan="3" align="center">D</th>
														<th colspan="3" align="center">E</th>
														<th colspan="3" align="center">F</th>
														<th colspan="3" align="center">G</th>
														<th colspan="3" align="center">H</th>
														<th colspan="3" align="center">I</th>
														<th colspan="3" align="center">J</th>
													</tr>
													</thead>
													<tbody>
													<tr>
														<td colspan="3" align="center">1</td>
														<td colspan="3" align="center"><input type="text" name="A1" value="${row1.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B1" value="${row1.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C1" value="${row1.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D1" value="${row1.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E1" value="${row1.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F1" value="${row1.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G1" value="${row1.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H1" value="${row1.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I1" value="${row1.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J1" value="${row1.colJ }"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">2</td>
														<td colspan="3" align="center"><input type="text" name="A2" value="${row2.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B2" value="${row2.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C2" value="${row2.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D2" value="${row2.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E2" value="${row2.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F2" value="${row2.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G2" value="${row2.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H2" value="${row2.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I2" value="${row2.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J2" value="${row2.colJ }"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">3</td>
														<td colspan="3" align="center"><input type="text" name="A3" value="${row3.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B3" value="${row3.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C3" value="${row3.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D3" value="${row3.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E3" value="${row3.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F3" value="${row3.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G3" value="${row3.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H3" value="${row3.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I3" value="${row3.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J3" value="${row3.colJ }"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">4</td>
														<td colspan="3" align="center"><input type="text" name="A4" value="${row4.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B4" value="${row4.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C4" value="${row4.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D4" value="${row4.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E4" value="${row4.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F4" value="${row4.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G4" value="${row4.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H4" value="${row4.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I4" value="${row4.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J4" value="${row4.colJ }"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">5</td>
														<td colspan="3" align="center"><input type="text" name="A5" value="${row5.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B5" value="${row5.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C5" value="${row5.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D5" value="${row5.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E5" value="${row5.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F5" value="${row5.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G5" value="${row5.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H5" value="${row5.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I5" value="${row5.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J5" value="${row5.colJ }"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">6</td>
														<td colspan="3" align="center"><input type="text" name="A6" value="${row6.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B6" value="${row6.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C6" value="${row6.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D6" value="${row6.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E6" value="${row6.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F6" value="${row6.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G6" value="${row6.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H6" value="${row6.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I6" value="${row6.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J6" value="${row6.colJ }"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">7</td>
														<td colspan="3" align="center"><input type="text" name="A7" value="${row7.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B7" value="${row7.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C7" value="${row7.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D7" value="${row7.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E7" value="${row7.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F7" value="${row7.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G7" value="${row7.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H7" value="${row7.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I7" value="${row7.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J7" value="${row7.colJ }"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">8</td>
														<td colspan="3" align="center"><input type="text" name="A8" value="${row8.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B8" value="${row8.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C8" value="${row8.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D8" value="${row8.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E8" value="${row8.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F8" value="${row8.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G8" value="${row8.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H8" value="${row8.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I8" value="${row8.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J8" value="${row8.colJ }"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">9</td>
														<td colspan="3" align="center"><input type="text" name="A9" value="${row9.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B9" value="${row9.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C9" value="${row9.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D9" value="${row9.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E9" value="${roW9.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F9" value="${row9.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G9" value="${row9.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H9" value="${row9.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I9" value="${row9.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J9" value="${row9.colJ }"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">10</td>
														<td colspan="3" align="center"><input type="text" name="A10" value="${row10.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B10" value="${row10.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C10" value="${row10.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D10" value="${row10.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E10" value="${row10.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F10" value="${row10.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G10" value="${row10.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H10" value="${row10.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I10" value="${row10.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J10" value="${row10.colJ }"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">11</td>
														<td colspan="3" align="center"><input type="text" name="A10" value="${row11.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B10" value="${row11.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C10" value="${row11.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D10" value="${row11.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E10" value="${row11.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F10" value="${row11.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G10" value="${row11.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H10" value="${row11.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I10" value="${row11.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J10" value="${row11.colJ }"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">12</td>
														<td colspan="3" align="center"><input type="text" name="A10" value="${row12.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B10" value="${row12.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C10" value="${row12.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D10" value="${row12.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E10" value="${row12.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F10" value="${row12.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G10" value="${row12.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H10" value="${row12.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I10" value="${row12.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J10" value="${row12.colJ }"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">13</td>
														<td colspan="3" align="center"><input type="text" name="A10" value="${row13.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B10" value="${row13.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C10" value="${row13.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D10" value="${row13.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E10" value="${row13.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F10" value="${row13.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G10" value="${row13.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H10" value="${row13.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I10" value="${row13.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J10" value="${row13.colJ }"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">14</td>
														<td colspan="3" align="center"><input type="text" name="A10" value="${row14.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B10" value="${row14.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C10" value="${row14.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D10" value="${row14.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E10" value="${row14.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F10" value="${row14.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G10" value="${row14.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H10" value="${row14.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I10" value="${row14.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J10" value="${row14.colJ }"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">15</td>
														<td colspan="3" align="center"><input type="text" name="A10" value="${row15.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B10" value="${row15.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C10" value="${row15.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D10" value="${row15.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E10" value="${row15.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F10" value="${row15.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G10" value="${row15.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H10" value="${row15.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I10" value="${row15.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J10" value="${row15.colJ }"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">16</td>
														<td colspan="3" align="center"><input type="text" name="A10" value="${row16.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B10" value="${row16.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C10" value="${row16.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D10" value="${row16.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E10" value="${row16.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F10" value="${row16.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G10" value="${row16.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H10" value="${row16.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I10" value="${row16.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J10" value="${row16.colJ }"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">17</td>
														<td colspan="3" align="center"><input type="text" name="A10" value="${row16.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B10" value="${row16.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C10" value="${row16.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D10" value="${row16.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E10" value="${row16.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F10" value="${row16.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G10" value="${row16.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H10" value="${row16.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I10" value="${row16.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J10" value="${row16.colJ }"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">18</td>
														<td colspan="3" align="center"><input type="text" name="A10" value="${row18.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B10" value="${row18.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C10" value="${row18.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D10" value="${row18.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E10" value="${row18.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F10" value="${row18.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G10" value="${row18.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H10" value="${row18.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I10" value="${row18.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J10" value="${row18.colJ }"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">19</td>
														<td colspan="3" align="center"><input type="text" name="A10" value="${row19.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B10" value="${row19.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C10" value="${row19.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D10" value="${row19.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E10" value="${row19.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F10" value="${row19.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G10" value="${row19.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H10" value="${row19.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I10" value="${row19.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J10" value="${row19.colJ }"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">20</td>
														<td colspan="3" align="center"><input type="text" name="A10" value="${row20.colA }"></td>
														<td colspan="3" align="center"><input type="text" name="B10" value="${row20.colB }"></td>
														<td colspan="3" align="center"><input type="text" name="C10" value="${row20.colC }"></td>
														<td colspan="3" align="center"><input type="text" name="D10" value="${row20.colD }"></td>
														<td colspan="3" align="center"><input type="text" name="E10" value="${row20.colE }"></td>
														<td colspan="3" align="center"><input type="text" name="F10" value="${row20.colF }"></td>
														<td colspan="3" align="center"><input type="text" name="G10" value="${row20.colG }"></td>
														<td colspan="3" align="center"><input type="text" name="H10" value="${row20.colH }"></td>
														<td colspan="3" align="center"><input type="text" name="I10" value="${row20.colI }"></td>
														<td colspan="3" align="center"><input type="text" name="J10" value="${row20.colJ }"></td>
													</tr>													
													<tr>
														<td colspan="11" align="right">
														
															<!-- 팀 번호를 받아서 넘기는 곳 -->
															<input type="submit" value="저장" style="color: #DB631F">	
															<input type="button" value="취소" onclick="location.href='shareDocumentList.do'" style="color: #DB631F">	
														</td>
													</tr>
													</tbody>
												</table>
											</form>										
										</c:when>
									
									
									
										<c:when test="${empty list }">
											<form action="shareDocumentInsert.do"  method="post">
												<table class="styled-table">
													<tr>
														<th colspan="3" align="center">insert</th>
														<th colspan="3" align="center">A</th>
														<th colspan="3" align="center">B</th>
														<th colspan="3" align="center">C</th>
														<th colspan="3" align="center">D</th>
														<th colspan="3" align="center">E</th>
														<th colspan="3" align="center">F</th>
														<th colspan="3" align="center">G</th>
														<th colspan="3" align="center">H</th>
														<th colspan="3" align="center">I</th>
														<th colspan="3" align="center">J</th>
													</tr>
													<tr>
														<td colspan="3" align="center">1</td>
														<td colspan="3" align="center"><input type="text" name="A1"></td>
														<td colspan="3" align="center"><input type="text" name="B1"></td>
														<td colspan="3" align="center"><input type="text" name="C1"></td>
														<td colspan="3" align="center"><input type="text" name="D1"></td>
														<td colspan="3" align="center"><input type="text" name="E1"></td>
														<td colspan="3" align="center"><input type="text" name="F1"></td>
														<td colspan="3" align="center"><input type="text" name="G1"></td>
														<td colspan="3" align="center"><input type="text" name="H1"></td>
														<td colspan="3" align="center"><input type="text" name="I1"></td>
														<td colspan="3" align="center"><input type="text" name="J1"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">2</td>
														<td colspan="3" align="center"><input type="text" name="A2"></td>
														<td colspan="3" align="center"><input type="text" name="B2"></td>
														<td colspan="3" align="center"><input type="text" name="C2"></td>
														<td colspan="3" align="center"><input type="text" name="D2"></td>
														<td colspan="3" align="center"><input type="text" name="E2"></td>
														<td colspan="3" align="center"><input type="text" name="F2"></td>
														<td colspan="3" align="center"><input type="text" name="G2"></td>
														<td colspan="3" align="center"><input type="text" name="H2"></td>
														<td colspan="3" align="center"><input type="text" name="I2"></td>
														<td colspan="3" align="center"><input type="text" name="J2"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">3</td>
														<td colspan="3" align="center"><input type="text" name="A3"></td>
														<td colspan="3" align="center"><input type="text" name="B3"></td>
														<td colspan="3" align="center"><input type="text" name="C3"></td>
														<td colspan="3" align="center"><input type="text" name="D3"></td>
														<td colspan="3" align="center"><input type="text" name="E3"></td>
														<td colspan="3" align="center"><input type="text" name="F3"></td>
														<td colspan="3" align="center"><input type="text" name="G3"></td>
														<td colspan="3" align="center"><input type="text" name="H3"></td>
														<td colspan="3" align="center"><input type="text" name="I3"></td>
														<td colspan="3" align="center"><input type="text" name="J3"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">4</td>
														<td colspan="3" align="center"><input type="text" name="A4"></td>
														<td colspan="3" align="center"><input type="text" name="B4"></td>
														<td colspan="3" align="center"><input type="text" name="C4"></td>
														<td colspan="3" align="center"><input type="text" name="D4"></td>
														<td colspan="3" align="center"><input type="text" name="E4"></td>
														<td colspan="3" align="center"><input type="text" name="F4"></td>
														<td colspan="3" align="center"><input type="text" name="G4"></td>
														<td colspan="3" align="center"><input type="text" name="H4"></td>
														<td colspan="3" align="center"><input type="text" name="I4"></td>
														<td colspan="3" align="center"><input type="text" name="J4"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">5</td>
														<td colspan="3" align="center"><input type="text" name="A5"></td>
														<td colspan="3" align="center"><input type="text" name="B5"></td>
														<td colspan="3" align="center"><input type="text" name="C5"></td>
														<td colspan="3" align="center"><input type="text" name="D5"></td>
														<td colspan="3" align="center"><input type="text" name="E5"></td>
														<td colspan="3" align="center"><input type="text" name="F5"></td>
														<td colspan="3" align="center"><input type="text" name="G5"></td>
														<td colspan="3" align="center"><input type="text" name="H5"></td>
														<td colspan="3" align="center"><input type="text" name="I5"></td>
														<td colspan="3" align="center"><input type="text" name="J5"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">6</td>
														<td colspan="3" align="center"><input type="text" name="A6"></td>
														<td colspan="3" align="center"><input type="text" name="B6"></td>
														<td colspan="3" align="center"><input type="text" name="C6"></td>
														<td colspan="3" align="center"><input type="text" name="D6"></td>
														<td colspan="3" align="center"><input type="text" name="E6"></td>
														<td colspan="3" align="center"><input type="text" name="F6"></td>
														<td colspan="3" align="center"><input type="text" name="G6"></td>
														<td colspan="3" align="center"><input type="text" name="H6"></td>
														<td colspan="3" align="center"><input type="text" name="I6"></td>
														<td colspan="3" align="center"><input type="text" name="J6"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">7</td>
														<td colspan="3" align="center"><input type="text" name="A7"></td>
														<td colspan="3" align="center"><input type="text" name="B7"></td>
														<td colspan="3" align="center"><input type="text" name="C7"></td>
														<td colspan="3" align="center"><input type="text" name="D7"></td>
														<td colspan="3" align="center"><input type="text" name="E7"></td>
														<td colspan="3" align="center"><input type="text" name="F7"></td>
														<td colspan="3" align="center"><input type="text" name="G7"></td>
														<td colspan="3" align="center"><input type="text" name="H7"></td>
														<td colspan="3" align="center"><input type="text" name="I7"></td>
														<td colspan="3" align="center"><input type="text" name="J7"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">8</td>
														<td colspan="3" align="center"><input type="text" name="A8"></td>
														<td colspan="3" align="center"><input type="text" name="B8"></td>
														<td colspan="3" align="center"><input type="text" name="C8"></td>
														<td colspan="3" align="center"><input type="text" name="D8"></td>
														<td colspan="3" align="center"><input type="text" name="E8"></td>
														<td colspan="3" align="center"><input type="text" name="F8"></td>
														<td colspan="3" align="center"><input type="text" name="G8"></td>
														<td colspan="3" align="center"><input type="text" name="H8"></td>
														<td colspan="3" align="center"><input type="text" name="I8"></td>
														<td colspan="3" align="center"><input type="text" name="J8"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">9</td>
														<td colspan="3" align="center"><input type="text" name="A9"></td>
														<td colspan="3" align="center"><input type="text" name="B9"></td>
														<td colspan="3" align="center"><input type="text" name="C9"></td>
														<td colspan="3" align="center"><input type="text" name="D9"></td>
														<td colspan="3" align="center"><input type="text" name="E9"></td>
														<td colspan="3" align="center"><input type="text" name="F9"></td>
														<td colspan="3" align="center"><input type="text" name="G9"></td>
														<td colspan="3" align="center"><input type="text" name="H9"></td>
														<td colspan="3" align="center"><input type="text" name="I9"></td>
														<td colspan="3" align="center"><input type="text" name="J9"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">10</td>
														<td colspan="3" align="center"><input type="text" name="A10"></td>
														<td colspan="3" align="center"><input type="text" name="B10"></td>
														<td colspan="3" align="center"><input type="text" name="C10"></td>
														<td colspan="3" align="center"><input type="text" name="D10"></td>
														<td colspan="3" align="center"><input type="text" name="E10"></td>
														<td colspan="3" align="center"><input type="text" name="F10"></td>
														<td colspan="3" align="center"><input type="text" name="G10"></td>
														<td colspan="3" align="center"><input type="text" name="H10"></td>
														<td colspan="3" align="center"><input type="text" name="I10"></td>
														<td colspan="3" align="center"><input type="text" name="J10"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">11</td>
														<td colspan="3" align="center"><input type="text" name="A11"></td>
														<td colspan="3" align="center"><input type="text" name="B11"></td>
														<td colspan="3" align="center"><input type="text" name="C11"></td>
														<td colspan="3" align="center"><input type="text" name="D11"></td>
														<td colspan="3" align="center"><input type="text" name="E11"></td>
														<td colspan="3" align="center"><input type="text" name="F11"></td>
														<td colspan="3" align="center"><input type="text" name="G11"></td>
														<td colspan="3" align="center"><input type="text" name="H11"></td>
														<td colspan="3" align="center"><input type="text" name="I11"></td>
														<td colspan="3" align="center"><input type="text" name="J11"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">12</td>
														<td colspan="3" align="center"><input type="text" name="A12"></td>
														<td colspan="3" align="center"><input type="text" name="B12"></td>
														<td colspan="3" align="center"><input type="text" name="C12"></td>
														<td colspan="3" align="center"><input type="text" name="D12"></td>
														<td colspan="3" align="center"><input type="text" name="E12"></td>
														<td colspan="3" align="center"><input type="text" name="F12"></td>
														<td colspan="3" align="center"><input type="text" name="G12"></td>
														<td colspan="3" align="center"><input type="text" name="H12"></td>
														<td colspan="3" align="center"><input type="text" name="I12"></td>
														<td colspan="3" align="center"><input type="text" name="J12"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">13</td>
														<td colspan="3" align="center"><input type="text" name="A13"></td>
														<td colspan="3" align="center"><input type="text" name="B13"></td>
														<td colspan="3" align="center"><input type="text" name="C13"></td>
														<td colspan="3" align="center"><input type="text" name="D13"></td>
														<td colspan="3" align="center"><input type="text" name="E13"></td>
														<td colspan="3" align="center"><input type="text" name="F13"></td>
														<td colspan="3" align="center"><input type="text" name="G13"></td>
														<td colspan="3" align="center"><input type="text" name="H13"></td>
														<td colspan="3" align="center"><input type="text" name="I13"></td>
														<td colspan="3" align="center"><input type="text" name="J13"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">14</td>
														<td colspan="3" align="center"><input type="text" name="A14"></td>
														<td colspan="3" align="center"><input type="text" name="B14"></td>
														<td colspan="3" align="center"><input type="text" name="C14"></td>
														<td colspan="3" align="center"><input type="text" name="D14"></td>
														<td colspan="3" align="center"><input type="text" name="E14"></td>
														<td colspan="3" align="center"><input type="text" name="F14"></td>
														<td colspan="3" align="center"><input type="text" name="G14"></td>
														<td colspan="3" align="center"><input type="text" name="H14"></td>
														<td colspan="3" align="center"><input type="text" name="I14"></td>
														<td colspan="3" align="center"><input type="text" name="J14"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">15</td>
														<td colspan="3" align="center"><input type="text" name="A15"></td>
														<td colspan="3" align="center"><input type="text" name="B15"></td>
														<td colspan="3" align="center"><input type="text" name="C15"></td>
														<td colspan="3" align="center"><input type="text" name="D15"></td>
														<td colspan="3" align="center"><input type="text" name="E15"></td>
														<td colspan="3" align="center"><input type="text" name="F15"></td>
														<td colspan="3" align="center"><input type="text" name="G15"></td>
														<td colspan="3" align="center"><input type="text" name="H15"></td>
														<td colspan="3" align="center"><input type="text" name="I15"></td>
														<td colspan="3" align="center"><input type="text" name="J15"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">16</td>
														<td colspan="3" align="center"><input type="text" name="A16"></td>
														<td colspan="3" align="center"><input type="text" name="B16"></td>
														<td colspan="3" align="center"><input type="text" name="C16"></td>
														<td colspan="3" align="center"><input type="text" name="D16"></td>
														<td colspan="3" align="center"><input type="text" name="E16"></td>
														<td colspan="3" align="center"><input type="text" name="F16"></td>
														<td colspan="3" align="center"><input type="text" name="G16"></td>
														<td colspan="3" align="center"><input type="text" name="H16"></td>
														<td colspan="3" align="center"><input type="text" name="I16"></td>
														<td colspan="3" align="center"><input type="text" name="J16"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">17</td>
														<td colspan="3" align="center"><input type="text" name="A17"></td>
														<td colspan="3" align="center"><input type="text" name="B17"></td>
														<td colspan="3" align="center"><input type="text" name="C17"></td>
														<td colspan="3" align="center"><input type="text" name="D17"></td>
														<td colspan="3" align="center"><input type="text" name="E17"></td>
														<td colspan="3" align="center"><input type="text" name="F17"></td>
														<td colspan="3" align="center"><input type="text" name="G17"></td>
														<td colspan="3" align="center"><input type="text" name="H17"></td>
														<td colspan="3" align="center"><input type="text" name="I17"></td>
														<td colspan="3" align="center"><input type="text" name="J17"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">18</td>
														<td colspan="3" align="center"><input type="text" name="A18"></td>
														<td colspan="3" align="center"><input type="text" name="B18"></td>
														<td colspan="3" align="center"><input type="text" name="C18"></td>
														<td colspan="3" align="center"><input type="text" name="D18"></td>
														<td colspan="3" align="center"><input type="text" name="E18"></td>
														<td colspan="3" align="center"><input type="text" name="F18"></td>
														<td colspan="3" align="center"><input type="text" name="G18"></td>
														<td colspan="3" align="center"><input type="text" name="H18"></td>
														<td colspan="3" align="center"><input type="text" name="I18"></td>
														<td colspan="3" align="center"><input type="text" name="J18"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">19</td>
														<td colspan="3" align="center"><input type="text" name="A19"></td>
														<td colspan="3" align="center"><input type="text" name="B19"></td>
														<td colspan="3" align="center"><input type="text" name="C19"></td>
														<td colspan="3" align="center"><input type="text" name="D19"></td>
														<td colspan="3" align="center"><input type="text" name="E19"></td>
														<td colspan="3" align="center"><input type="text" name="F19"></td>
														<td colspan="3" align="center"><input type="text" name="G19"></td>
														<td colspan="3" align="center"><input type="text" name="H19"></td>
														<td colspan="3" align="center"><input type="text" name="I19"></td>
														<td colspan="3" align="center"><input type="text" name="J19"></td>
													</tr>
													<tr>
														<td colspan="3" align="center">20</td>
														<td colspan="3" align="center"><input type="text" name="A20"></td>
														<td colspan="3" align="center"><input type="text" name="B20"></td>
														<td colspan="3" align="center"><input type="text" name="C20"></td>
														<td colspan="3" align="center"><input type="text" name="D20"></td>
														<td colspan="3" align="center"><input type="text" name="E20"></td>
														<td colspan="3" align="center"><input type="text" name="F20"></td>
														<td colspan="3" align="center"><input type="text" name="G20"></td>
														<td colspan="3" align="center"><input type="text" name="H20"></td>
														<td colspan="3" align="center"><input type="text" name="I20"></td>
														<td colspan="3" align="center"><input type="text" name="J20"></td>
													</tr>
													<tr>
														<td colspan="11" align="right">
														
															<!-- 팀 번호를 받아서 넘기는 곳 -->
															<input type="submit" value="저장" style="color: #DB631F">		
														</td>
													</tr>
												</table>
											</form>
												
										</c:when>
										
										
										<c:otherwise>
											<table class="styled-table">
												<colgroup>
													<col width="50">
													<col width="300">
													<col width="300">
													<col width="300">
													<col width="300">
													<col width="300">
													<col width="300">
													<col width="300">
													<col width="300">
													<col width="300">
													<col width="300">
												</colgroup>
												<thead>
												<tr>
													<th></th>
													<th>A</th>
													<th>B</th>
													<th>C</th>
													<th>D</th>
													<th>E</th>
													<th>F</th>
													<th>G</th>
													<th>H</th>
													<th>I</th>
													<th>J</th>
												</tr>
												</thead>
												<tbody>
											<c:forEach items="${list }" var="dto" varStatus="status">
												<tr>
													<td>${status.count }</td>
													<td>${dto.colA }</td>
													<td>${dto.colB }</td>
													<td>${dto.colC }</td>
													<td>${dto.colD }</td>
													<td>${dto.colE }</td>
													<td>${dto.colF }</td>
													<td>${dto.colG }</td>
													<td>${dto.colH }</td>
													<td>${dto.colI }</td>
													<td>${dto.colJ }</td>
												</tr>
											</c:forEach>
												</tbody>
												<tr>
													<td colspan="11" align="right">
														<form action="shareDocumentUpdateForm.do">
															<!-- 팀번호 받아넘김 -->
															<input type="button" id="btnExcelDown" name="btnExcelDown" value="엑셀다운" onclick="location.href='excelDown.do'" style="color: #DB631F">	
															<input type="submit" name="checkVal"value="문서작성" style="color: #DB631F">	
														</form>
													</td>
												</tr>
												
										</table>
										</c:otherwise>
									</c:choose>
							</div>
						</div>
						
						
						
						<div class="tab-pane fade" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">

						</div>
						
						<div class="ab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab" >
							
							
						</div>
						
						
						<div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
						
						</div>
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