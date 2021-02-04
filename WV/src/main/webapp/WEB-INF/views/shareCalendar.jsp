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