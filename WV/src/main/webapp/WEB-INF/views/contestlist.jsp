<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="css/contest.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/headerfooter/header.jsp"
		flush="false" />
	<div class="menu-box">
		<div class="container">
			<div class="ms-menu" onclick="location.href='contestinsert.do'">
				<h4 class="ms-tit">공모전 등록하기</h4>
			</div>
			<div class="aside">
				<h3 class="blind">공모전</h3>
				<ul class="aside-cat">
					<li class="compe on"><span>공모전 분류</span></li>
				</ul>
				<div class="cat-area">
					<div id="cat-list1" class="cat-list" style="display: block;">
						<h4 class="cat-tit">분야별</h4>
						<ul class="cat">
							<li><a href="contestlist.do">전체</a></li>
							<li><a href="fieldlist.do?category='기획/아이디어'">기획/아이디어</a></li>
							<li><a href="fieldlist.do?category='광고/마케팅'">광고/마케팅</a></li>
							<li><a href="fieldlist.do?category='논문/리포트'">논문/리포트</a></li>
							<li><a href="fieldlist.do?category='영상/UCC/사진'">영상/UCC/사진</a></li>
							<li><a href="fieldlist.do?category='디자인/캐릭터/웹툰'">디자인/캐릭터/웹툰</a></li>
							<li><a href="fieldlist.do?category='웹/모바일/플래시'">웹/모바일/플래시</a></li>
							<li><a href="fieldlist.do?category='게임/소프트웨어'">게임/소프트웨어</a></li>
							<li><a href="fieldlist.do?category='과학/공학'">과학/공학</a></li>
							<li><a href="fieldlist.do?category='문학/글/시나리오'">문학/글/시나리오</a></li>
							<li><a href="fieldlist.do?category='건축/건설/인테리어'">건축/건설/인테리어</a></li>
							<li><a href="fieldlist.do?category='네이밍/슬로건'">네이밍/슬로건</a></li>
							<li><a href="fieldlist.do?category='예체능/미술/음악'">예체능/미술/음악</a></li>
							<li><a href="fieldlist.do?category='대외활동/서포터즈'">대외활동/서포터즈</a></li>
							<li><a href="fieldlist.do?category='봉사활동'">봉사활동</a></li>
							<li><a href="fieldlist.do?category='취업/창업'">취업/창업</a></li>
							<li><a href="fieldlist.do?category='해외'">해외</a></li>
							<li><a href="fieldlist.do?category='기타'">기타</a></li>
						</ul>
						<h4 class="cat-tit">응시대상자</h4>
						<ul class="cat">
							<li><a href="contestlist.do?">전체</a></li>
							<li><a href="targetlist.do?category='제한없음'">제한없음</a></li>
							<li><a href="targetlist.do?category='일반인'">일반인</a></li>
							<li><a href="targetlist.do?category='대학생'">대학생</a></li>
							<li><a href="targetlist.do?category='청소년'">청소년</a></li>
							<li><a href="targetlist.do?category='어린이'">어린이</a></li>
							<li><a href="targetlist.do?category='기타'">기타</a></li>
						</ul>
						<h4 class="cat-tit">주최사</h4>
						<ul class="cat">
							<li><a href="contestlist.do?">전체</a></li>
							<li><a href="companylist.do?category='정부/공공기관'">정부/공공기관</a></li>
							<li><a href="companylist.do?category='공기업'">공기업</a></li>
							<li><a href="companylist.do?category='대기업'">대기업</a></li>
							<li><a href="companylist.do?category='신문/방송/언론'">신문/방송/언론</a></li>
							<li><a href="companylist.do?category='외국계기업'">외국계기업</a></li>
							<li><a href="companylist.do?category='중견/중소/벤처기업'">중견/중소/벤처기업</a></li>
							<li><a href="companylist.do?category='비영리/협회/재단'">비영리/협회/재단</a></li>
							<li><a href="companylist.do?category='해외'">해외</a></li>
							<li><a href="companylist.do?category='기타'">기타</a></li>
						</ul>
						<h4 class="cat-tit">시상내역</h4>
						<ul class="cat">
							<li><a href="contestlist.do?">전체</a></li>
							<li><a href="rewardlist.do?category='5천만원이상'">5천만원이상</a></li>
							<li><a href="rewardlist.do?category='5천만원~3천만원'">5천만원~3천만원</a></li>
							<li><a href="rewardlist.do?category='3천만원~1천만원'">3천만원~1천만원</a></li>
							<li><a href="rewardlist.do?category='1천만원이하'">1천만원이하</a></li>
							<li><a href="rewardlist.do?category='취업특전'">취업특전</a></li>
							<li><a href="rewardlist.do?category='입사시가산점'">입사시가산점</a></li>
							<li><a href="rewardlist.do?category='인턴채용'">인턴채용</a></li>
							<li><a href="rewardlist.do?category='정직원채용'">정직원채용</a></li>
							<li><a href="rewardlist.do?category='기타'">기타</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="main-section">
				<div class="ms-list">
					<ul class="list">
						<li class="top">
							<div class="tit">공모전명</div>
							<div class="organ">주최사</div>
							<div class="day">현재현황</div>
						</li>
						<c:forEach items="${Clist }" var="contest" varStatus="status">
							<fmt:parseDate value="${contest.contestend}" pattern="yyyy-MM-dd" var="end_date" />
							<fmt:parseNumber value="${end_date.time / (1000*60*60*24)}" integerOnly="true" var="endday" />
							<fmt:parseDate value="${contest.conteststart}" pattern="yyyy-MM-dd" var="start_date" />
							<fmt:parseNumber value="${start_date.time / (1000*60*60*24)}" integerOnly="true" var="startday" />
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowp" />
							<fmt:parseDate value="${nowp}" pattern="yyyy-MM-dd" var="now3" />
							<fmt:parseNumber value="${now3.time / (1000*60*60*24)}" integerOnly="true" var="today" />
							<c:set value="${today - endday}" var="datesum"></c:set>
							<c:choose>
								<c:when test="${status.index %2 == 0}">
									<li>
										<div class="tit">
											<a href="contestDetail.do?contestnum=${contest.contestnum }">${contest.contestname }</a>
											<div class="sub-tit">분야 : ${contest.contestfield }</div>
										</div>
										<div class="organ">${contest.contestagent }	${contest.contestsupervision }</div>
										<div class="day">
											<c:choose>
												<c:when test="${today - endday > 0}">    								
													D+${today - endday }
													<span class="dday end">마감</span>
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${today - endday == 0 || today - endday >=-7}">
    															D<c:if test="${today - endday == 0}">-</c:if>${today - endday }
    															<span class="dday soon">마감임박</span>
														</c:when>
														<c:otherwise>
															<c:choose>
																<c:when test="${today - startday > 0 }">
    																D${today - endday }
    																<span class="dday ing">접수중</span>
																</c:when>
																<c:otherwise>
    																D${today - endday }
    																<span class="dday future">접수예정</span>
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
										<div class="organ">${contest.contestagent }
											${contest.contestsupervision }</div>
										<div class="day">
											<c:choose>
												<c:when test="${today - endday > 0}">    								
													D+${today - endday }
													<span class="dday end">마감</span>
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${today - endday == 0 || today - endday >=-7}">
    														D<c:if test="${today - endday == 0}">-</c:if>${today - endday }
    														<span class="dday soon">마감임박</span>
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
					<div class="list-navi">
						<c:if test="${paging.startPage != 1 }">
							<a href="contestlist.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage }<c:if test="${ null ne paging.category }">&category=${paging.category }</c:if><c:if test="${ null ne catTitle}">&catTitle=${catTitle }</c:if>">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<a class="on" style="color: #fff; background: #d65106;">${p }</a>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a href="contestlist.do?nowPage=${p }&cntPerPage=${paging.cntPerPage }<c:if test="${ null ne paging.category }">&category=${paging.category }</c:if><c:if test="${ null ne catTitle}">&catTitle=${catTitle }</c:if>">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a href="contestlist.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage }<c:if test="${ null ne paging.category }">&category=${paging.category }</c:if><c:if test="${ null ne catTitle}">&catTitle=${catTitle }</c:if>">&gt;</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false" />
</body>
</html>