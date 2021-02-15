<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	request.setCharacterEncoding("UTF-8"); %>
<% 	response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<h3 class="content-tit">
        	공모전 대외활동 정보  <button class="btn btn-sm btn-primary" onclick="location.href='contestlist.do'" style="margin-left: 3%;">목록</button>
		</h3>
		<div class="contest-detail">
		<div class="tit-area">
			<h6 class="tit">${contest.contestname }</h6>
		</div>
		<div class="cd-area">
			<div class="img">
				<div class="thumb">
					<img src="images/${contest.contestposter}" height="350" onerror="this.src='images/logobackup.png'" alt="${contest.contestname }">
				</div>
				<div class="tac">
				</div>
			</div>
		</div>
		<div class="info">
			<ul class="cd-info-list">
				<li>
					<span class="tit">분야</span>${contest.contestfield }
				</li>
				<li>
					<span class="tit">응모대상</span>${contest.contesttarget }
				</li>
				<li>
					<span class="tit">주최/주관</span>${contest.contestagent } / ${contest.contestsupervision }
				</li>
				<li>
					<span class="tit">후원/협찬</span>${contest.contesupport }
				</li>
				<li class="dday-area">
					<span class="tit">접수기간</span>
					${contest.conteststart} ~ ${contest.contestend}
				</li>
				<li>
					<span class="tit">총 상금</span>${contest.contestreward }
				</li>
				<li>
					<span class="tit">1등 상금</span>
				</li>
				<li>
					<span class="tit">홈페이지</span>
					<c:if test="${ null ne contest.contestpage}">
					<a href="${contest.contestpage }" target="_blank">${contest.contestpage }</a>
					</c:if>
				</li>
				<li>
					<span class="tit">첨부파일</span><c:if test="${ null ne contest.contestorifilename}">
					<form action="downcontestfile.do?" method="post">
						${contest.contestorifilename }
						<input type="hidden" name="name" value="${contest.contestsvaefilename }">
						<input type="submit" value="Download" class="btn btn-sm btn-primary" style="padding: 0px 5px;font-size: 14px;font-weight: 300; text-transform: none; margin-left: 5px;">
					</form>
					</c:if><c:if test="${ null eq contest.contestorifilename}">파일없음</c:if>
				</li>
				<li class="sns">
					<span class="tit"></span>
					<div class="cd-sns">
					</div>
				</li>
			</ul>
		</div>
		<div class="clear"></div>
		<div class="article">
			<div class="tit">상세내용</div>
			<div class="comm-desc" id="viewContents">
				<p>${contest.contestcontent }</p>
				<p><c:if test="${null ne contest.contestposter}"><img src="images/${contest.contestposter}" style="width: 60%; margin-left: 10%; margin-right: 10%"><br style="clear:both;">&nbsp;</c:if></p></div>
		</div>
		<div class="event-notice conte">
			<div>
			본 정보의 내용은 주최사의 사정에 따라 변경될 수 있습니다. <br>
			반드시 주최사 공모요강을 확인하시기 바랍니다.
			</div>
		</div>
		<div class="article sns-share">
			<a class="btn btn-sm btn-primary" href="contestlist.do">목록</a>
			<c:if test="${contest.memberno eq member.member_no}"><a class="btn btn-sm btn-primary" href="contestUpdateForm.do?contestnum=${contest.contestnum }">수정</a></c:if>
			<c:if test="${contest.memberno eq member.member_no}"><a class="btn btn-sm btn-primary" href="contestDelete.do?contestnum=${contest.contestnum }">삭제</a></c:if>
		</div>
	</div>
	</div>
	</div>
<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false" />
</body>
</html>