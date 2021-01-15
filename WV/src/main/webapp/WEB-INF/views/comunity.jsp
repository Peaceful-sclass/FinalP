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
    <title>comunity</title>  
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="css/comunity.css">
	<script src="js/comunity.js"></script>
 	<script type="text/javascript">
 	window.onload = function(){ //카테고리/검색 자동선택
	    let seltag = document.getElementsByName("category")[0];
	    seltag.value = "${cpdto.category}";
	    let seltag2 = document.getElementsByName("searchselect")[0];
	    seltag2.value = "${schdto.searchsel}";
	    console.log("seltag2.value: "+seltag2.value)
 	}
	</script>
</head>

<body>
<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />
	<!-- Start -->
	<div class="menu-box">
		<div class="container">
			<div class="row">
				본문 상단
			</div>
			<div class="row">
				본문 중단
			</div>
			<div class="row">
				본문 하단
			</div>

		</div>

		<div class="container">
			<div class="row">
				<div id="test1" style="display: none; border: 1px solid gray;">
					
				</div>
			</div>
			<div class="row">
				<div class="col-2 offset-md-1" style="margin-bottom: 1rem;">
					<form action="comunity.do" method="get" name="selectform1">
						<input type="hidden" name="currentPage" value="1">
						<select name="category" onchange="cmpageChange(this.form);">
							<option value="전체">전체</option>
							<option value="자유">자유</option>
							<option value="Q&A">Q&A</option>
						</select>
					</form>
				</div>
			</div>
			
			<div class="row inner-menu-box justify-content-center">
				<div class="col-1">
				</div>
				<div class="col-10">
					<form name="tableform1" action="cmdetail.do" method="get">
						<input type="hidden" name="category" value="${cpdto.category}" />
						<table class="table table-sm table-striped table-hover">
						  <thead>
						    <tr>
						      <th scope="col" style="width: 5%;">test</th>
						      <th scope="col" style="width: 10%;">카테고리</th>
						      <th scope="col" style="width: 50%;">제목</th>
						      <th scope="col" style="width: 10%;">작성자</th>
						      <th scope="col" style="width: 10%;">등록일</th>
						      <th scope="col" style="width: 10%;">조회수</th>
						    </tr>
						  </thead>
						  <tbody>
							<c:if test="${empty list }">
								<tr><td colspan="12" class="cm-txt-center"><p>글이 없습니다.</p></td></tr>
							</c:if>
							
						  	<c:forEach var="dto" items="${list}">
							    <tr>
							      <th scope="row" class="cm-txt-center">${dto.cno} </th>
							      <td class="cm-txt-center">${dto.category}</td>
							      <td class="cm-title"><a href="#" name="cno" value="${dto.cno}" onclick="titleClick(); return false;">${dto.title}</a></td>
							      <td class="cm-txt-center">${dto.memberid}관리자</td>
							      <td class="cm-txt-center"><fmt:formatDate value="${dto.regdate}" pattern="yyyy.MM.dd" /></td>
							      <td class="cm-txt-center">${dto.views}</td>
							    </tr>
						  		
						  	</c:forEach>
						  	
						  </tbody>
						  <tfoot>
						    <tr>
						      <td colspan="3">
							      
							      	<select name="searchselect" id="" >
							      		<option value="subject">제목</option>
							      		<option value="subjectcontent">제목+내용</option>
							      		<option value="writer">작성자</option>
									</select>
									<input type="text" class="a-search-input" name="word" value="${cpdto.search.word }">  
							      	<input type="button" class="bt-search" value="검색" onclick="cmpageChange(this);" />
						      </td>
						      <td colspan="9">
						      	<input type="button" class="bt-write" value="글쓰기" onclick="cmwrite();"/>
						      </td>
						    </tr>
						  	
						  </tfoot>
						</table>
					</form>
				</div>
				<div class="col-1">
				</div>
			</div>
			<!-- <form action="comunity.do" name="searchform"></form> -->
			
			<div class="row justify-content-center">
				<div>
					<form action="comunity.do" method="get" name="cmpagechange">
						<input type="hidden" name="category" value="${cpdto.category }" />
						<input type="hidden" name="currentPage" value="${cpdto.currentPage}" />
						<input type="hidden" name="searchsel" value="${schdto.searchsel}" />
						<!-- paging 필요변수 준비 -->
						<c:set var="first" value="${cpdto.first }"></c:set>
						<c:set var="last" value="${cpdto.last }"></c:set>
						<c:if test="${last > cpdto.totalPage }">
							<c:set var="last" value="${cpdto.totalPage }"></c:set>
						</c:if>
						
						<!-- paging start -->						
						<c:if test="${cpdto.prev > 0 }">
							<a href="#" name="prev" value="${cpdto.prev }" onclick="cmpageChange(this); return false;"><이전</a>
						</c:if>
						<c:forEach var="i" begin="${first }" end="${last }" >
							<c:if test="${i > 0 }">
							
							</c:if>
								<a href="#" class="pagelink" name="${i }" value="${i }" onclick="cmpageChange(this); return false;">${i}</a>
						
						</c:forEach>
						<c:if test="${cpdto.last < cpdto.totalPage  }">
							<a href="#" name="next" value="${cpdto.next }" onclick="cmpageChange(this); return false;">다음></a>
						</c:if>
						<!-- paging end -->					
					</form>
				</div>
			</div><!-- paging row end -->
			
		</div> <!-- container end -->
	</div>
	<!-- End -->
	
	
<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</body>
</html>