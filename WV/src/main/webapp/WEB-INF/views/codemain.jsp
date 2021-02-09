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
							<div class="col-3">
								<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
									<a class="nav-link" id="v-pills-asd-tab" data-toggle="pill" href="#v-pills-asd" role="tab" aria-controls="v-pills-profile" aria-selected="false">모두보기</a>
									<a class="nav-link" id="v-pills-asd-tab1" data-toggle="pill" href="#v-pills-asd1" role="tab" aria-controls="v-pills-profile" aria-selected="false">Dao</a>
									<a class="nav-link" id="v-pills-asd-tab2" data-toggle="pill" href="#v-pills-asd2" role="tab" aria-controls="v-pills-profile" aria-selected="false">Dto</a>
									<a class="nav-link" id="v-pills-asd-tab3" data-toggle="pill" href="#v-pills-asd3" role="tab" aria-controls="v-pills-profile" aria-selected="false">Biz</a>
									<a class="nav-link" id="v-pills-asd-tab4" data-toggle="pill" href="#v-pills-asd4" role="tab" aria-controls="v-pills-profile" aria-selected="false">Controller</a>
									<a class="nav-link" id="v-pills-asd-tab5" data-toggle="pill" href="#v-pills-asd5" role="tab" aria-controls="v-pills-profile" aria-selected="false">Sql</a>
									<a class="nav-link" id="v-pills-asd-tab6" data-toggle="pill" href="#v-pills-asd6" role="tab" aria-controls="v-pills-profile" aria-selected="false">Js</a>
									<a class="nav-link" id="v-pills-asd-tab7" data-toggle="pill" href="#v-pills-asd7" role="tab" aria-controls="v-pills-profile" aria-selected="false">Css</a>
									<a class="nav-link" id="v-pills-asd-tab8" data-toggle="pill" href="#v-pills-asd8" role="tab" aria-controls="v-pills-profile" aria-selected="false">Views</a>
									
								</div>
							</div>
						</div>
						
												<div class="tab-pane fade" id="v-pills-asd" role="tabpanel" aria-labelledby="v-pills-asd-tab">			
			<div class="row inner-menu-box justify-content-center">
				<div class="col-10">
					<!-- <form name="tableform1" action="cmdetail.do" method="get"> -->
						<input type="hidden" name="category" value="${cpdto.category}" />
						<table class="table table-sm table-striped table-hover">
						  <thead>
						    <tr>
						      <th scope="col" style="width: 10%;">NO</th>
						      <th scope="col" style="width: 15%;">카테고리</th>
						      <th scope="col" style="width: 50%;">제목</th>
						      <th scope="col" style="width: 10%;">작성자</th>
						      <th scope="col" style="width: 10%;">등록일</th>
						    </tr>
						  </thead>
						  <tbody>
							<c:if test="${empty listcode }">
								<tr><td colspan="12" class="cm-txt-center"><p>글이 없습니다.</p></td></tr>
							</c:if>
							
						  	<c:forEach var="dto" items="${listcode}" varStatus="status">
							    <tr>

							      <th scope="row" class="cm-txt-center">${status.count } </th>

							      <c:choose>
							      	<c:when test="${dto.myco eq '1'}">
							      		<td class="cm-txt-center">Dao</td>
							      	</c:when>
							      	<c:when test="${dto.myco eq '2'}">
							      		<td class="cm-txt-center">Dto</td>
							      	</c:when>
							      	<c:when test="${dto.myco eq '3'}">
							      		<td class="cm-txt-center">Biz</td>
							      	</c:when>
							      	<c:when test="${dto.myco eq '4'}">
							      		<td class="cm-txt-center">Controller</td>
							      	</c:when>
							      	<c:when test="${dto.myco eq '5'}">
							      		<td class="cm-txt-center">Sql</td>
							      	</c:when>
							      	<c:when test="${dto.myco eq '6'}">
							      		<td class="cm-txt-center">Js</td>
							      	</c:when>
							      	<c:when test="${dto.myco eq '7'}">
							      		<td class="cm-txt-center">Css</td>
							      	</c:when>
							      	<c:when test="${dto.myco eq '8'}">
							      		<td class="cm-txt-center">Views</td>
							      	</c:when>
							      </c:choose>
							      <td class="cm-title"><a href="detail.do?myno=${dto.myno}&&myco=${dto.myco}">${dto.mytitle }</a></td>
							      <td class="cm-txt-center">${dto.myname}</td>
							      <td class="cm-txt-center"><fmt:formatDate value="${dto.mydate}" pattern="yyyy.MM.dd" /></td>
							    </tr>
						  		
						  	</c:forEach>
						  	
						  </tbody>
						  <tfoot>
						    <tr>
						      <td colspan="9">
						      	  <input class="btn-primary" style="color: white; background-color: #f57936;" type="button" value="목록" onclick="location.href='codemain.do'">
						      </td>
						    </tr>
						  	
						  </tfoot>
						</table>
					<!-- </form> -->
				</div>
				</div>
				</div>
						
						<div class="tab-pane fade" id="v-pills-asd1" role="tabpanel" aria-labelledby="v-pills-asd-tab1">			
			<div class="row inner-menu-box justify-content-center">
				<div class="col-10">
					<!-- <form name="tableform1" action="cmdetail.do" method="get"> -->
						<input type="hidden" name="category" value="${cpdto.category}" />
						<table class="table table-sm table-striped table-hover">
						  <thead>
						    <tr>
						      <th scope="col" style="width: 10%;">NO</th>
						      <th scope="col" style="width: 15%;">카테고리</th>
						      <th scope="col" style="width: 50%;">제목</th>
						      <th scope="col" style="width: 10%;">작성자</th>
						      <th scope="col" style="width: 10%;">등록일</th>
						    </tr>
						  </thead>
						  <tbody>
							<c:if test="${empty listcode1 }">
								<tr><td colspan="12" class="cm-txt-center"><p>글이 없습니다.</p></td></tr>
							</c:if>
							
						  	<c:forEach var="dto" items="${listcode1}" varStatus="status">
							    <tr>
							      <th scope="row" class="cm-txt-center">${status.count } </th>
							      <td class="cm-txt-center">Dao</td>
							      <td class="cm-title"><a href="detail.do?myno=${dto.myno}&&myco=${dto.myco}">${dto.mytitle }</a></td>
							      <td class="cm-txt-center">${dto.myname}</td>
							      <td class="cm-txt-center"><fmt:formatDate value="${dto.mydate}" pattern="yyyy.MM.dd" /></td>
							    </tr>
						  		
						  	</c:forEach>
						  	
						  </tbody>
						  <tfoot>
						    <tr>
						      <td colspan="9">
						      	 <input class="btn-primary" style="color: white; background-color: #f57936;" type="button" value="목록" onclick="location.href='codemain.do'">
								  <input class="btn-primary" style="color: white; background-color: #f57936;" type="button" value="글 작성" onclick="location.href='insertform.do?mycode=1'">
						      </td>
						    </tr>
						  	
						  </tfoot>
						</table>
					<!-- </form> -->
				</div>
				</div>
				</div>
						
						
						
						<div class="tab-pane fade" id="v-pills-asd2" role="tabpanel" aria-labelledby="v-pills-asd-tab2">			
			<div class="row inner-menu-box justify-content-center">
				<div class="col-10">
					<!-- <form name="tableform1" action="cmdetail.do" method="get"> -->
						<input type="hidden" name="category" value="${cpdto.category}" />
						<table class="table table-sm table-striped table-hover">
						  <thead>
						    <tr>
						      <th scope="col" style="width: 10%;">NO</th>
						      <th scope="col" style="width: 15%;">카테고리</th>
						      <th scope="col" style="width: 50%;">제목</th>
						      <th scope="col" style="width: 10%;">작성자</th>
						      <th scope="col" style="width: 10%;">등록일</th>
						    </tr>
						  </thead>
						  <tbody>
							<c:if test="${empty listcode2 }">
								<tr><td colspan="12" class="cm-txt-center"><p>글이 없습니다.</p></td></tr>
							</c:if>
							
						  	<c:forEach var="dto" items="${listcode2}" varStatus="status">
							    <tr>
							      <th scope="row" class="cm-txt-center">${status.count } </th>
							      <td class="cm-txt-center">Dto</td>
							      <td class="cm-title"><a href="detail.do?myno=${dto.myno}&&myco=${dto.myco}">${dto.mytitle }</a></td>
							      <td class="cm-txt-center">${dto.myname}</td>
							      <td class="cm-txt-center"><fmt:formatDate value="${dto.mydate}" pattern="yyyy.MM.dd" /></td>
							    </tr>
						  		
						  	</c:forEach>
						  	
						  </tbody>
						  <tfoot>
						    <tr>
						      <td colspan="9">
						      	 <input class="btn-primary" style="color: white; background-color: #f57936;" type="button" value="목록" onclick="location.href='codemain.do'">
								  <input class="btn-primary" style="color: white; background-color: #f57936;" type="button" value="글 작성" onclick="location.href='insertform.do?mycode=2'">
						      </td>
						    </tr>
						  	
						  </tfoot>
						</table>
					<!-- </form> -->
				</div>
				</div>
				</div>
						
						<div class="tab-pane fade" id="v-pills-asd3" role="tabpanel" aria-labelledby="v-pills-asd-tab3">			
			<div class="row inner-menu-box justify-content-center">
				<div class="col-10">
					<!-- <form name="tableform1" action="cmdetail.do" method="get"> -->
						<input type="hidden" name="category" value="${cpdto.category}" />
						<table class="table table-sm table-striped table-hover">
						  <thead>
						    <tr>
						      <th scope="col" style="width: 10%;">NO</th>
						      <th scope="col" style="width: 15%;">카테고리</th>
						      <th scope="col" style="width: 50%;">제목</th>
						      <th scope="col" style="width: 10%;">작성자</th>
						      <th scope="col" style="width: 10%;">등록일</th>
						    </tr>
						  </thead>
						  <tbody>
							<c:if test="${empty listcode3 }">
								<tr><td colspan="12" class="cm-txt-center"><p>글이 없습니다.</p></td></tr>
							</c:if>
							
						  	<c:forEach var="dto" items="${listcode3}" varStatus="status">
							    <tr>
							      <th scope="row" class="cm-txt-center">${status.count } </th>
							      <td class="cm-txt-center">Biz</td>
							      <td class="cm-title"><a href="detail.do?myno=${dto.myno}&&myco=${dto.myco}">${dto.mytitle }</a></td>
							      <td class="cm-txt-center">${dto.myname}</td>
							      <td class="cm-txt-center"><fmt:formatDate value="${dto.mydate}" pattern="yyyy.MM.dd" /></td>
							    </tr>
						  		
						  	</c:forEach>
						  	
						  </tbody>
						  <tfoot>
						    <tr>
						      <td colspan="9">
						      	 <input class="btn-primary" style="color: white; background-color: #f57936;" type="button" value="목록" onclick="location.href='codemain.do'">
								  <input class="btn-primary" style="color: white; background-color: #f57936;" type="button" value="글 작성" onclick="location.href='insertform.do?mycode=3'">
						      </td>
						    </tr>
						  	
						  </tfoot>
						</table>
					<!-- </form> -->
				</div>
				</div>
				</div>
						
						<div class="tab-pane fade" id="v-pills-asd4" role="tabpanel" aria-labelledby="v-pills-asd-tab4">			
			<div class="row inner-menu-box justify-content-center">
				<div class="col-10">
					<!-- <form name="tableform1" action="cmdetail.do" method="get"> -->
						<input type="hidden" name="category" value="${cpdto.category}" />
						<table class="table table-sm table-striped table-hover">
						  <thead>
						    <tr>
						      <th scope="col" style="width: 10%;">NO</th>
						      <th scope="col" style="width: 15%;">카테고리</th>
						      <th scope="col" style="width: 50%;">제목</th>
						      <th scope="col" style="width: 10%;">작성자</th>
						      <th scope="col" style="width: 10%;">등록일</th>
						    </tr>
						  </thead>
						  <tbody>
							<c:if test="${empty listcode4 }">
								<tr><td colspan="12" class="cm-txt-center"><p>글이 없습니다.</p></td></tr>
							</c:if>
							
						  	<c:forEach var="dto" items="${listcode4}" varStatus="status">
							    <tr>
							      <th scope="row" class="cm-txt-center">${status.count } </th>
							      <td class="cm-txt-center">Controller</td>
							      <td class="cm-title"><a href="detail.do?myno=${dto.myno}&&myco=${dto.myco}">${dto.mytitle }</a></td>
							      <td class="cm-txt-center">${dto.myname}</td>
							      <td class="cm-txt-center"><fmt:formatDate value="${dto.mydate}" pattern="yyyy.MM.dd" /></td>
							    </tr>
						  		
						  	</c:forEach>
						  	
						  </tbody>
						  <tfoot>
						    <tr>
						      <td colspan="9">
						      	 <input class="btn-primary" style="color: white; background-color: #f57936;" type="button" value="목록" onclick="location.href='codemain.do'">
								  <input class="btn-primary" style="color: white; background-color: #f57936;" type="button" value="글 작성" onclick="location.href='insertform.do?mycode=4'">
						      </td>
						    </tr>
						  	
						  </tfoot>
						</table>
					<!-- </form> -->
				</div>
				</div>
				</div>
						
						<div class="tab-pane fade" id="v-pills-asd5" role="tabpanel" aria-labelledby="v-pills-asd-tab5">			
			<div class="row inner-menu-box justify-content-center">
				<div class="col-10">
					<!-- <form name="tableform1" action="cmdetail.do" method="get"> -->
						<input type="hidden" name="category" value="${cpdto.category}" />
						<table class="table table-sm table-striped table-hover">
						  <thead>
						    <tr>
						      <th scope="col" style="width: 10%;">NO</th>
						      <th scope="col" style="width: 15%;">카테고리</th>
						      <th scope="col" style="width: 50%;">제목</th>
						      <th scope="col" style="width: 10%;">작성자</th>
						      <th scope="col" style="width: 10%;">등록일</th>
						    </tr>
						  </thead>
						  <tbody>
							<c:if test="${empty listcode5 }">
								<tr><td colspan="12" class="cm-txt-center"><p>글이 없습니다.</p></td></tr>
							</c:if>
							
						  	<c:forEach var="dto" items="${listcode5}" varStatus="status">
							    <tr>
							      <th scope="row" class="cm-txt-center">${status.count } </th>
							      <td class="cm-txt-center">Sql</td>
							      <td class="cm-title"><a href="detail.do?myno=${dto.myno}&&myco=${dto.myco}">${dto.mytitle }</a></td>
							      <td class="cm-txt-center">${dto.myname}</td>
							      <td class="cm-txt-center"><fmt:formatDate value="${dto.mydate}" pattern="yyyy.MM.dd" /></td>
							    </tr>
						  		
						  	</c:forEach>
						  	
						  </tbody>
						  <tfoot>
						    <tr>
						      <td colspan="9">
						      	 <input class="btn-primary" style="color: white; background-color: #f57936;" type="button" value="목록" onclick="location.href='codemain.do'">
								  <input class="btn-primary" style="color: white; background-color: #f57936;" type="button" value="글 작성" onclick="location.href='insertform.do?mycode=5'">
						      </td>
						    </tr>
						  	
						  </tfoot>
						</table>
					<!-- </form> -->
				</div>
				</div>
				</div>
						
						<div class="tab-pane fade" id="v-pills-asd6" role="tabpanel" aria-labelledby="v-pills-asd-tab6">			
			<div class="row inner-menu-box justify-content-center">
				<div class="col-10">
					<!-- <form name="tableform1" action="cmdetail.do" method="get"> -->
						<input type="hidden" name="category" value="${cpdto.category}" />
						<table class="table table-sm table-striped table-hover">
						  <thead>
						    <tr>
						      <th scope="col" style="width: 10%;">NO</th>
						      <th scope="col" style="width: 15%;">카테고리</th>
						      <th scope="col" style="width: 50%;">제목</th>
						      <th scope="col" style="width: 10%;">작성자</th>
						      <th scope="col" style="width: 10%;">등록일</th>
						    </tr>
						  </thead>
						  <tbody>
							<c:if test="${empty listcode6 }">
								<tr><td colspan="12" class="cm-txt-center"><p>글이 없습니다.</p></td></tr>
							</c:if>
							
						  	<c:forEach var="dto" items="${listcode6}" varStatus="status">
							    <tr>
							      <th scope="row" class="cm-txt-center">${status.count } </th>
							      <td class="cm-txt-center">Js</td>
							      <td class="cm-title"><a href="detail.do?myno=${dto.myno}&&myco=${dto.myco}">${dto.mytitle }</a></td>
							      <td class="cm-txt-center">${dto.myname}</td>
							      <td class="cm-txt-center"><fmt:formatDate value="${dto.mydate}" pattern="yyyy.MM.dd" /></td>
							    </tr>
						  		
						  	</c:forEach>
						  	
						  </tbody>
						  <tfoot>
						    <tr>
						      <td colspan="9">
						      	 <input class="btn-primary" style="color: white; background-color: #f57936;" type="button" value="목록" onclick="location.href='codemain.do'">
								  <input class="btn-primary" style="color: white; background-color: #f57936;" type="button" value="글 작성" onclick="location.href='insertform.do?mycode=6'">
						      </td>
						    </tr>
						  	
						  </tfoot>
						</table>
					<!-- </form> -->
				</div>
				</div>
				</div>
						
						<div class="tab-pane fade" id="v-pills-asd7" role="tabpanel" aria-labelledby="v-pills-asd-tab7">			
			<div class="row inner-menu-box justify-content-center">
				<div class="col-10">
					<!-- <form name="tableform1" action="cmdetail.do" method="get"> -->
						<input type="hidden" name="category" value="${cpdto.category}" />
						<table class="table table-sm table-striped table-hover">
						  <thead>
						    <tr>
						      <th scope="col" style="width: 10%;">NO</th>
						      <th scope="col" style="width: 15%;">카테고리</th>
						      <th scope="col" style="width: 50%;">제목</th>
						      <th scope="col" style="width: 10%;">작성자</th>
						      <th scope="col" style="width: 10%;">등록일</th>
						    </tr>
						  </thead>
						  <tbody>
							<c:if test="${empty listcode7 }">
								<tr><td colspan="12" class="cm-txt-center"><p>글이 없습니다.</p></td></tr>
							</c:if>
							
						  	<c:forEach var="dto" items="${listcode7}" varStatus="status">
							    <tr>
							      <th scope="row" class="cm-txt-center">${status.count } </th>
							      <td class="cm-txt-center">Css</td>
							      <td class="cm-title"><a href="detail.do?myno=${dto.myno}&&myco=${dto.myco}">${dto.mytitle }</a></td>
							      <td class="cm-txt-center">${dto.myname}</td>
							      <td class="cm-txt-center"><fmt:formatDate value="${dto.mydate}" pattern="yyyy.MM.dd" /></td>
							    </tr>
						  		
						  	</c:forEach>
						  	
						  </tbody>
						  <tfoot>
						    <tr>
						      <td colspan="9">
						      	 <input class="btn-primary" style="color: white; background-color: #f57936;" type="button" value="목록" onclick="location.href='codemain.do'">
								  <input class="btn-primary" style="color: white; background-color: #f57936;" type="button" value="글 작성" onclick="location.href='insertform.do?mycode=7'">
						      </td>
						    </tr>
						  	
						  </tfoot>
						</table>
					<!-- </form> -->
				</div>
				</div>
				</div>
						
						<div class="tab-pane fade" id="v-pills-asd8" role="tabpanel" aria-labelledby="v-pills-asd-tab8">			
			<div class="row inner-menu-box justify-content-center">
				<div class="col-10">
					<!-- <form name="tableform1" action="cmdetail.do" method="get"> -->
						<input type="hidden" name="category" value="${cpdto.category}" />
						<table class="table table-sm table-striped table-hover">
						  <thead>
						    <tr>
						      <th scope="col" style="width: 10%;">NO</th>
						      <th scope="col" style="width: 15%;">카테고리</th>
						      <th scope="col" style="width: 50%;">제목</th>
						      <th scope="col" style="width: 10%;">작성자</th>
						      <th scope="col" style="width: 10%;">등록일</th>
						    </tr>
						  </thead>
						  <tbody>
							<c:if test="${empty listcode8 }">
								<tr><td colspan="12" class="cm-txt-center"><p>글이 없습니다.</p></td></tr>
							</c:if>
							
						  	<c:forEach var="dto" items="${listcode8}" varStatus="status">
							    <tr>
							      <th scope="row" class="cm-txt-center">${status.count } </th>
							      <td class="cm-txt-center">Views</td>
							      <td class="cm-title"><a href="detail.do?myno=${dto.myno}&&myco=${dto.myco}">${dto.mytitle }</a></td>
							      <td class="cm-txt-center">${dto.myname}</td>
							      <td class="cm-txt-center"><fmt:formatDate value="${dto.mydate}" pattern="yyyy.MM.dd" /></td>
							    </tr>
						  		
						  	</c:forEach>
						  	
						  </tbody>
						  <tfoot>
						    <tr>
						      <td colspan="9">
						      	 <input class="btn-primary" style="color: white; background-color: #f57936;" type="button" value="목록" onclick="location.href='codemain.do'">
								  <input class="btn-primary" style="color: white; background-color: #f57936;" type="button" value="글 작성" onclick="location.href='insertform.do?mycode=8'">
						      </td>
						    </tr>
						  	
						  </tfoot>
						</table>
					<!-- </form> -->
				</div>
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
	
	
<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</body>
</html>