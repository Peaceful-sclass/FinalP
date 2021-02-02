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
				<c:forEach items="${callist }" var="caldto">
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
			<c:out value="${row1.colA }"></c:out>
			
			<div class="row inner-menu-box">
				<div class="col-3">
					<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<a class="nav-link active" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">달력</a>
						<a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">코드협업</a>
						<a class="nav-link" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">문서협업</a>
						<a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">공유</a>
					</div>
				</div>
				
				<div class="col-9">
					<div class="tab-content" id="v-pills-tabContent">
						<div class="tab-pane fade" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
							<div class="row">
									<c:choose>
										<c:when test="${!empty check}">
											<form action="shareDocumentUpdate.do"  method="post">
												<table border="1" class="document">
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
														<td colspan="11" align="right">
														
															<!-- 팀 번호를 받아서 넘기는 곳 -->
															<input name="teamNo" value="1" hidden="true">
															<input type="submit" value="저장">	
															<input type="button" value="취소" onclick="location.href='shareDocumentList.do'">	
														</td>
													</tr>
												</table>
											</form>										
										</c:when>
									
									
									
										<c:when test="${empty list }">
											<form action="shareDocumentInsert.do"  method="post">
												<table border="1" class="document">
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
														<td colspan="11" align="right">
														
															<!-- 팀 번호를 받아서 넘기는 곳 -->
															<input name="teamNo" value="1" hidden="true">
															<input type="submit" value="저장">		
														</td>
													</tr>
												</table>
											</form>
												
										</c:when>
										
										
										<c:otherwise>
											<table border="1" class="document">
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
												<tr>
													<td colspan="11" align="right">
														<form action="shareDocumentUpdateForm.do">
															<!-- 팀번호 받아넘김 -->
															<input name="teamNo" value="1" hidden="true">
															<input type="button" id="btnExcelDown" name="btnExcelDown" value="엑셀다운" onclick="location.href='excelDown.do'">	
															<input type="submit" name="checkVal"value="문서작성">	
														</form>
													</td>
												</tr>
										</table>
										</c:otherwise>
									</c:choose>
							</div>
						</div>
						
						
						
						<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
							<div class="row">
								
							</div>
						</div>
						
						<div class="ab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab" >
							
						
								<div id='calendar'></div>
						
							
						</div>
						
						
						
						<div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
							<div class="row">
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