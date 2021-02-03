<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<title>게시판</title>
</head>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$("#update_btn").on("click", function(){
				formObj.attr("action", "shareBoardupdateView.do");
				formObj.attr("method", "get");
				formObj.submit();				
			});
			
			// 삭제
			$("#delete_btn").on("click", function(){
				var con_delete = confirm("정말 삭제하시겠습니까??");
				
				if(con_delete==true){
					formObj.attr("action", "shareBoardDelete.do");
					formObj.attr("method", "post");
					formObj.submit();
				}
				else{}
			});
			
			// 목록
			$("#list_btn").on("click", function(){
			location.href = "shareBoardList.do?page=${scri.page}"
			+"&perPageNum=${scri.perPageNum}"
			+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			});
			
			//댓글 작성
			$("#commentWriteBtn").on("click", function(){
				var formObj = $("form[name='commentForm']");
				formObj.attr("action", "SBCommentWrite.do");
				formObj.submit();
			});
			
			//댓글 삭제
			$(".commentDelte").on("click",function(){
				var con_delete = confirm("정말 삭제하시겠습니까??");
				
				if(con_delete==true){
					location.href = "SBCommentDelete.do?bno=${dto.bno}"
						+ "&page=${scri.page}"
						+ "&perPageNum=${scri.perPageNum}"
						+ "&searchType=${scri.searchType}"
						+ "&keyword=${scri.keyword}"
						+ "&rno="+$(this).attr("data-rno");
				}
				else{
					
				}
			});
			
			CKEDITOR.replace('content', {width:'800px',height: '500px'});
		})
		function fn_fileDown(fileNo){
			var formObj = $("form[name='readForm']");
			$("#FILE_NO").attr("value", fileNo);
			formObj.attr("action", "SBFileDown.do");
			formObj.submit();
		}
		
		
	</script>
	
<body>
<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />

<!-- Start Menu -->
	<div class="menu-box">
		<div class="container">
			
			<div class="row inner-menu-box">
				<div class="col-3">
					<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<a class="nav-link active" id="team-main-tab" data-toggle="pill" href="#" role="tab" aria-controls="team-pills-main" aria-selected="true" onclick="teamSide(this); return false;">팀메인</a>
						<a class="nav-link" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="false" onclick="teamSide(this); return false;">일정</a>
						<a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false" onclick="teamSide(this); return false;">시트</a>
						<a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false" onclick="teamSide(this); return false;">코드</a>
						<a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false" onclick="teamSide(this); return false;">저장소</a>
					</div>
				</div>
				
				<div class="col-9">
					<div id="container">
		
		<div class="row">
    
    <div >
        <form name="readForm" role="form" method="post">
        <input type="hidden" id="bno" name="bno" value="${dto.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<input type="hidden" id="FILE_NO" name="FILE_NO">
		</form>
            <div class="table table-responsive">
                      <table class="table table-striped">
            <tr>
                <td class="danger">작성자</td>
                <td>${dto.writer}</td>
                <td class="danger">작성일</td>
                <td><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd" /></td>
            </tr>
            <tr>
                <td class="danger">제목</td>
                <td colspan="3"><input type="text"  class="form-control" id="title" name="title" value="${dto.title}"  readonly="readonly"></td>
            </tr>
             
            
             
            <tr>
                <td class="danger">내용</td>
                <td colspan="3"><textarea id="content" name="content" class="form-control" readonly="readonly"><c:out value="${dto.content}" /></textarea></td>
            </tr>
            
            <tr>
                <td class="danger">파일</td>
                <td colspan="3">
                <c:forEach var="file" items="${file }">
					<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME }</a>(${file.FILE_SIZE}kb)<br>
				</c:forEach>
				</td>
            </tr>
            <tr>  
                <td colspan="4"  class="text-center">
                    <c:if test="${dto.writer eq member.member_id }">
					<button type="submit" id="update_btn" class="update_btn btn btn-warning">수정</button>
					<button type="submit" id="delete_btn" class="delete_btn btn btn-danger">삭제</button>
					</c:if>
					<button type="submit" id="list_btn" class="list_btn btn btn-primary">목록</button>
                </td>
            </tr>
          </table>
         
     
            </div>  
    </div>
	</div>
	 
	
				
				<br>
				<div >
				<table class="table table-hover">
					<c:if test="${empty commentList }">
						<tr><td colspan="10" class="cm-txt-center"><p>작성된 댓글이 없습니다.</p></td></tr>
					</c:if>
					
					<c:forEach items="${commentList}" var = "commentList">
						<tr>
							<td ><c:out value="${commentList.content }" /></td>
							<td><c:out value="${commentList.writer}" /></td>
							<td><fmt:formatDate value="${commentList.regdate}" pattern="yyyy-MM-dd"/></td>
							<td>
								<c:if test="${commentList.writer eq member.member_id }">
								<button type="button" id="commentDelte" class="commentDelte btn btn-danger" data-rno="${commentList.rno }">삭제</button>
								</c:if> 
							</td>
						</tr>
					</c:forEach>		
				</table>
				</div>
				
				<form action="SBCommentWrite.do" name="commentForm" method="post" >
					<input type="hidden" id="bno" name="bno" value="${dto.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
  					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
  					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
  					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
  					<input type="hidden" id="writer" name="writer" value="${member.member_id }">
  					
  					<table class="table table-hover">
  					<tr>
  						<td>댓글</td>
  						<td><div class="col-sm-8"><input type="text" id="content" name="content" class="form-control"/></div></td>
  						<td><button type="button" id="commentWriteBtn" class="replyWriteBtn btn btn-success">작성</button></td>
  					</tr>
  					</table>
				</form>
	
				
			<hr />
			</div>

				</div><!-- col-9 end -->

			</div><!-- main Row End -->
			
		</div><!-- Container End -->
	</div>
	<!-- End Menu Box -->
			
		
		<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
	</body>
</html>