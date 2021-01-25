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
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
     <!-- Site Metas -->
    <title>comunity</title>  
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="css/comunity.css">
	<script src="js/comunity.js"></script>
 	<script type="text/javascript">
 	window.onload = function(){ 
 	    console.log("test comunity.js");
 	    let currentPage = document.getElementsByName("currentPage")[1].value;
 	    console.log("test currentPage : "+currentPage);
 	    let selectedPage = document.getElementsByName(currentPage)[0]; //atag임
 	    console.log("test selectedPage : "+selectedPage);
 	    selectedPage.classList.add('test1css');
 	    
 	    //글성공실패시 - test
 	    let result = "${res}";
 	    console.log("result: "+result);
 	    if(result > 0){
 	    	toastr.info("성공","글작성",{timeOut:5000});
 	    } else if(result = 0){
 	    	toastr.error("실패","글작성",{timeOut:5000});
 	    }
 	    
 	 	//카테고리/검색 자동선택
	    let categorySelectTag = document.getElementsByName("category")[0];
	    categorySelectTag.value = "${cpdto.category}";
	    let searchSelectTag = document.getElementsByName("searchselect")[0];
	    searchSelectTag.value = "${schdto.searchsel}";
	    console.log("searchSelectTag.value: "+searchSelectTag.value)
 	}
 	
 	let cmwriteform = (no) => {
 		if(no != null && no != "" && no != undefined){ //로긴전 기초검증
 			location.href='cmwriteform.do';
 		} else{
 			toastr.error("글쓰기 전에 로그인을 해주세요.", "로그인 필요!", {timeOut: 5000});
 		}
 	}
 	
	</script>
</head>

<body>
<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />
	<!-- Start -->
	<div class="menu-box">
		<!-- Detail container Start -->
		<div class="container dv-toggle" id="dv-ct">
			<div class="row">
				<!-- 본문 상단 내용 -->
			</div>
			<!-- 본문 중단 시작 -->
			<div class="row">
				<div class="col-1"></div>
				
				<div class="col-10 dv-border">
					<!-- 제목 -->
					<div class="dv-header">
						<div class="dv-subject2">
							<span> </span> &nbsp; 
							<span>작성자</span> &nbsp;| &nbsp;
							<span>날짜</span> &nbsp;| &nbsp;
							<span>조회수</span> 
							<span>조회수</span>
						</div>
						<h1 class="dv-subject">제목 테스트~!!!!!</h1>
					</div>
					<!-- 내용 -->
					<div class="dv-middle">
						<div class="dv-content ql-editor"></div>
						<!-- <textarea class="dv-textarea" name="dv-content-ta" cols="300" rows="900"></textarea> -->
					</div>
					<!-- 삭제버튼 -->
					<div class="dv-delbt dv-toggle">
						<input type="button" value="글수정" id="updatebt" data-cno="" onclick="updateContent(this);" />
						<input type="button" value="글삭제" id="delbt" data-cno="" onclick="deleteContent(this);" />
					</div>
				</div>
				
				<div class="col-1"></div>
			</div>
			<div class="row" style="margin-top: 10px;">
				<div class="col-1"></div>
				<!-- 본문 하단 내용 -->
				<div class="col-10 dv-border">
					<div id="cmt">
					<!-- <div class="dv-relative">
						    <div class="row dv-cmt-bg">
								<span class="dv-cmtL">idididid</span>
								<span class="dv-cmt">testestsesetsetstsetaskdfjkasdfjksdajf<br>sals</span>
								<span class="dv-cmtR-date">2021-1-23 14:25</span>
								<a href="#" class="dv-cmtR-repl">답변</a>
								<a href="#" class="dv-cmtR-del">삭제</a>
							</div>
						</div> -->

					</div>
					<div class="dv-reply">
						<textarea name="dv-reply-ta" id="dv-reply-ta" cols="75" rows="1" placeholder="댓글을 입력해주세요."></textarea>
						<a href="#" class="dv-reply-bt" data-cmtcmd="3" onclick="cmtReply(this); return false;">댓글</a>
						<a href="#" class="dv-reply-canclebt" data-cmtcmd="3" onclick="cmtReplycancle(this); return false;">취소</a>
					</div>
				</div>
				<div class="col-1"></div>
			</div>
			<input type="hidden" id="sessioninfo" value="${member.member_id}" />
		</div>
		<!-- Detail container End -->
		
		
		<div><br></div>
		
		
		<!-- 목록 시작!!! -->
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
						      <th scope="col" style="width: 5%;">NO</th>
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
							      <td class="cm-title"><a href="#" name="cno" value="${dto.cno}" data-cno="${dto.cno}" data-mid="${member.member_id}"  data-mno="${member.member_no}" onclick="titleClick(this); return false;">${dto.title}</a></td>
							      <td class="cm-txt-center">${dto.member_id}</td>
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
						      	<input type="button" class="bt-write" value="글쓰기" onclick="cmwriteform('${member.member_no}');"/>
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
						<input type="hidden" name="currentPage" value="${cpdto.currentPage}" /><!-- currentPage[1]번 -->
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
			
		</div> <!-- 목록 container end -->
	</div>
	<!-- MenuBox End -->

	
<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</body>
</html>