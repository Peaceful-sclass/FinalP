<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	request.setCharacterEncoding("UTF-8"); %>
<% 	response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%-- %@ page session="false" %> --%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<link rel="stylesheet" href="css/contest.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />
	<div class="menu-box">
	<div class="container">
	<div class="main-section">
	<div class="ms-list">
		<ul class="list">
			<li class="top">
				<div class="tit">
					공모전명
				</div>
				<div class="organ">주최사</div>
				<div class="day">
					현재현황
				</div>
			</li>	
				<c:forEach items="${Clist }" var="contest" varStatus="status">
					<fmt:parseDate value="${contest.contestend}" pattern="yyyy-MM-dd" var="end_date"/>
					<fmt:parseNumber value="${end_date.time / (1000*60*60*24)}" integerOnly="true" var="endday" />
					<fmt:parseDate value="${contest.conteststart}" pattern="yyyy-MM-dd" var="start_date"/>
					<fmt:parseNumber value="${start_date.time / (1000*60*60*24)}" integerOnly="true" var="startday" />
					<jsp:useBean id="now" class="java.util.Date" />
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowp" />
					<fmt:parseDate value="${nowp}" pattern="yyyy-MM-dd" var="now3"/>
					<fmt:parseNumber value="${now3.time / (1000*60*60*24)}" integerOnly="true" var="today"/>
					<c:set value="${today - endday}" var="datesum"></c:set>
				<c:choose>
				<c:when test="${status.index %2 == 0}">
					<li>
						<div class="tit">
							<a href="contestDetail.do?contestnum=${contest.contestnum }">${contest.contestname }</a>
							<div class="sub-tit">분야 : ${contest.contestfield }</div>
						</div>
						<div class="organ">${contest.contestagent } ${contest.contestsupervision }</div>
						<div class="day">
							<c:choose>
								<c:when test="${today - endday > 0}">    								
									D+${today - endday }<span class="dday end">마감</span>	
								</c:when>
								<c:otherwise>
									<c:choose>
    									<c:when test="${today - endday == 0 || today - endday >=-7}">
    										D<c:if test="${today - endday == 0}">-</c:if>${today - endday }<span class="dday soon">마감임박</span>
    									</c:when>
    									<c:otherwise>
    										<c:choose>
    											<c:when test="${today - startday > 0 }">
    												D${today - endday }<span class="dday ing">접수중</span>
    											</c:when>
    											<c:otherwise>
    												D${today - endday }<span class="dday future">접수예정</span>
    											</c:otherwise>
    										</c:choose>
    									</c:otherwise>
    								</c:choose>
								</c:otherwise>
							</c:choose>
						</div>
					</li>
				</c:when>
				<c:otherwise>
					<li class="bg">
						<div class="tit">
							<a href="contestDetail.do?contestnum=${contest.contestnum }">${contest.contestname }</a>
							<div class="sub-tit">분야 : ${contest.contestfield }</div>
						</div>
						<div class="organ">${contest.contestagent } ${contest.contestsupervision }</div>
						<div class="day">
							<c:choose>
								<c:when test="${today - endday > 0}">    								
									D+${today - endday }<span class="dday end">마감</span>	
								</c:when>
								<c:otherwise>
									<c:choose>
    									<c:when test="${today - endday == 0 || today - endday >=-7}">
    										D<c:if test="${today - endday == 0}">-</c:if>${today - endday }<span class="dday soon">마감임박</span>
    									</c:when>
    									<c:otherwise>
    										<c:choose>
    											<c:when test="${today - startday > 0 }">
    												D${today - endday }<span class="dday ing">접수중</span>
    											</c:when>
    											<c:otherwise>
    												D${today - endday }<span class="dday future">접수예정</span>
    											</c:otherwise>
    										</c:choose>
    									</c:otherwise>
    								</c:choose>
								</c:otherwise>
							</c:choose>
						</div>
					</li>
				</c:otherwise>
				</c:choose>
				</c:forEach>					
		</ul>
		<div class="list-navi"><a><b>&lt;</b></a> <a href="?c=find&amp;s=1&amp;gp=1" class="on">1</a> <a href="?c=find&amp;s=1&amp;gp=2">2</a> <a href="?c=find&amp;s=1&amp;gp=3">3</a> <a href="?c=find&amp;s=1&amp;gp=4">4</a> <a href="?c=find&amp;s=1&amp;gp=5">5</a> <a href="?c=find&amp;s=1&amp;gp=6">6</a> <a href="?c=find&amp;s=1&amp;gp=7">7</a> <a href="?c=find&amp;s=1&amp;gp=8">8</a> <a href="?c=find&amp;s=1&amp;gp=9">9</a> <a href="?c=find&amp;s=1&amp;gp=10">10</a> <a href="?c=find&amp;s=1&amp;gp=2"><b>&gt;</b></a> </div>
	</div>
</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false" />
</body>
</html>