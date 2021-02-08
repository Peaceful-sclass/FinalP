<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
		<title>게시판</title>
<style type="text/css">
	.pagination{width: 400px;
  				margin-left: auto;
 				margin-right: auto;}
	.page-item {list-style: none; float: left; padding: 8px;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

//$(function(){
	//$('#searchBtn').click(function() {
		//self.location = "shareBoardList.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" +j $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
    //});
	

	//$('#writeBtn').click(function(){
		//self.location = "shareBoardwriteView.do";
	//});
//}); 


</script>
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
						<a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false" onclick="teamSide(this); return false;">코드</a>
						<a class="nav-link active" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false" onclick="teamSide(this); return false;">저장소</a>
					</div>
				</div>
				
				<div class="col-9">
					<section id="container">
			<form role="form" method="get">
				<table class="table table-hover">
					<tr><th scope="col" style="width: 5%; text-align: center;">번호</th>
					<th scope="col" style="width: 30%; text-align: center;">제목</th>
					<th scope="col" style="width: 10%; text-align: center;">작성자</th>
					<th scope="col" style="width: 10%; text-align: center;">등록일</th>
					<th scope="col" style="width: 10%; text-align: center;">조회수</th></tr>
					<c:if test="${empty list }">
						<tr><td colspan="10" class="cm-txt-center"><p>작성된 글이 없습니다.</p></td></tr>
					</c:if>
					
					<c:forEach items="${list}" var = "list">
						<tr>
							<td style="text-align: center;"><c:out value="${list.bno}" /></td>
							<td ><a href="shareBoardDetail.do?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">&nbsp;&nbsp;<c:out value="${list.title}" /></a></td>
							<td style="text-align: center;"><c:out value="${list.writer}" /></td>
							<td style="text-align: center;"><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
							<td style="text-align: center;"><c:out value="${list.views }"></c:out> </td>
						</tr>
					</c:forEach>
						
				</table>
				<div class="search row">
				 <div class="col-xs-2 col-sm-2">
				  <select name="searchType" class="form-control">
				    <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
				    <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
				    <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
				    <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
				    <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
				  </select>
				 </div>
				 
				 <div class="col-xs-9 col-sm-9">
				  <div class="input-group">
				   <input type="text" name="keyword" id="keywordInput" size="20" value="${scri.keyword}" class="form-control"/>
				   <span class="input-group-btn">
				   <button id="searchBtn" type="button" class="btn btn-primary" >검색</button>
				   <script>
				      $(function(){
				        $('#searchBtn').click(function() {
				          self.location = "shareBoardList.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
				        });
				      });   
				   </script>
				   <button type="button" class="btn btn-default" style="visibility:hidden;"></button>
				   <button id="writeBtn" type="button" class="btn btn-primary" onclick="self.location='shareBoardwriteView.do'">글쓰기</button>
				   </span>
				  </div>
				 </div>
				 
				</div>
				
				<div class="col-md-offset-3">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a href="shareBoardList.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if> 
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="shareBoardList.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li class="page-item"><a href="shareBoardList.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
						</ul>
					</div>
			</form>
		</section>
				</div><!-- col-9 end -->

			</div><!-- main Row End -->
			
		</div><!-- Container End -->
	</div>
	<!-- End Menu Box -->

	 
	<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</body>
</html>