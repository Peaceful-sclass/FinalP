<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	 	<title>게시판</title>
	</head>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "shareBoardupdateView.do");
				formObj.attr("method", "get");
				formObj.submit();				
			});
			
			// 삭제
			$(".delete_btn").on("click", function(){
				formObj.attr("action", "shareBoardDelete.do");
				formObj.attr("method", "post");
				formObj.submit();
			});
			
			// 목록
			$(".list_btn").on("click", function(){
			location.href = "shareBoardList.do?page=${scri.page}"
			+"&perPageNum=${scri.perPageNum}"
			+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
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
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<nav>
			  홈 - 글 작성
			</nav>
			<hr />
			
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="bno" name="bno" value="${dto.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<input type="hidden" id="FILE_NO" name="FILE_NO">
				</form>
				<table>
					<tbody>
						<tr>
							<td>
								<label for="title">제목</label><input type="text" id="title" name="title" value="${dto.title}" readonly="readonly" />
							</td>
						</tr>	
						<tr>
							<td>
								<label for="content">내용</label><textarea id="content" name="content" readonly="readonly"><c:out value="${dto.content}" /></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${dto.writer}"  readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="regdate">작성날짜</label>
								<fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd" />					
							</td>
						</tr>		
					</tbody>			
				</table>
				<span>파일 목록</span>
				<div class="form-group" style="border: 1px solid">
					<c:forEach var="file" items="${file }">
						<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME }</a>(${file.FILE_SIZE}kb)<br>
					</c:forEach>
				</div>
				<div>
					<button type="submit" class="update_btn">수정</button>
					<button type="submit" class="delete_btn">삭제</button>
					<button type="submit" class="list_btn">목록</button>	
				</div>
				
				<!-- 댓글 -->
				<div id="comment">
					<ol class="commentList">
						<c:forEach items="${commentList}" var="commentList">
							<li>
								<p>
								작성자 : ${commentList.writer}<br>
								작성 날짜 : <fmt:formatDate value="${commentList.regdate}" pattern="yyyy-MM-dd"/>
								</p>
								<p>${commentList.content }</p>
								<button type="button" class="commentDelte" data-rno="${commentList.rno }">삭제</button>
							</li>
						</c:forEach>
					</ol>
				</div>
				
				<form action="SBCommentWrite.do" name="commentForm" method="post">
					<input type="hidden" id="bno" name="bno" value="${dto.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
  					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
  					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
  					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
  					
  					<div>
  						<label for="content">댓글 내용</label><input type="text" id="content" name="content" />
  						
  					</div>
  					<div>
  						<button type="submit" value="작성">작성</button>
  					</div>
				</form>
			</section>
			<hr />
		</div>
		<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
	</body>
</html>