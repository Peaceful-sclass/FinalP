<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
				var content = $("#CommentContent").val();
				if(content == null || content==""){
					alert("댓글을 입력해주세요. ");
					
				}else{
				var formObj = $("form[name='commentForm']");
				formObj.attr("action", "SBCommentWrite.do");
				formObj.submit();
				}
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
		
		//팀 사이드 메뉴 클릭 시 동작 설정  << 각자 적기 
    	function teamSide(param){
    		let session = "${member.member_id}"; //session login 확인
    		window.sessionTeamInfo = window.sessionStorage.getItem("teamInfo");
    		let textcon = $(param).text();
    		console.log("textcon: "+ textcon);
    		console.log("sessionTeamInfo: "+ window.sessionTeamInfo);
    		console.log("TeamInfo.team_no: ${teamInfo.team_no}");
    		
    		
    		
    		if(session == null || session == "" ||session == undefined ){
    			location.href = "home.do"; //<<<공모전홈 이름 설정필요.
    		}else if(sessionTeamInfo == null||sessionTeamInfo == ""||sessionTeamInfo == undefined){
    			toastr.error("팀을 선택해주세요.", "팀선택 필요!", {tiemOut: 5000});
    			return false;
    		}//ajax로 다시 세션의 갱신된 값을 가져오기. 로그아웃시 css초기화 <== 로그아웃시 세션번호값 초기화 하면 ajax작업안해도된다!
    		
/*     		<c:if test="${teamInfo.team_no == null }">
	    		else if(true){
				toastr.error("팀을 선택해주세요.", "팀선택 필요!", {tiemOut: 5000});
				return false;	    			
	    		}
			</c:if> */

    		
    		
    		if(textcon == "팀메인"){
    			$("<form></form>").attr("method","post").attr("action","team.do").append($('<input/>',{type:'hidden',name:'member_no',value:'${member.member_no}'})).appendTo('body').submit();
    		} else if(textcon == "일정"){
    			location.href="shareCalendarList.do";
    		} else if(textcon == "시트"){
    			location.href="shareDocumentList.do";
    		} else if(textcon == "코드"){
    			location.href="codemain.do";
    		} else if(textcon == "저장소"){
    			location.href="shareBoardList.do";
    		}
    		
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
						<a class="nav-link" id="team-main-tab" data-toggle="pill" href="#" role="tab" aria-controls="team-pills-main" aria-selected="true" onclick="teamSide(this); return false;">팀메인</a>
						<a class="nav-link" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="false" onclick="teamSide(this); return false;">일정</a>
						<a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false" onclick="teamSide(this); return false;">시트</a>
						<a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false" onclick="teamSide(this); return false;">코드</a>
						<a class="nav-link active" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false" onclick="teamSide(this); return false;">저장소</a>
					</div>
				</div>
				
				<div class="col-9">
					<div id="container">
					
					<div id="boardmain">
					<form name="readForm" role="form" method="post">
        			<input type="hidden" id="bno" name="bno" value="${dto.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<input type="hidden" id="FILE_NO" name="FILE_NO">
					</form>
					
					<h2>${dto.title}</h2>
					<hr>
					<div>
					<div style="float:left;"><h4>&nbsp;&nbsp;<c:out value="${dto.writer}" /></h4></div>
					<div style="float:right;"><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd" /></div>
					<div style="clear:both;"></div>
					</div>
					<hr>
					<textarea id="content" name="content" class="form-control" readonly="readonly"><c:out value="${dto.content}" /></textarea>
					<hr>
					<c:forEach var="file" items="${file }">
					<h6><a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME }</a>(${file.FILE_SIZE}kb)</h6><br>
					</c:forEach>
					<hr>
					<c:if test="${dto.writer eq member.member_id }">
					<button type="submit" id="update_btn" class="update_btn btn btn-primary">수정</button>
					<button type="submit" id="delete_btn" class="delete_btn btn btn-primary">삭제</button>
					</c:if>
					<button type="submit" id="list_btn" class="list_btn btn btn-primary">목록</button>
					
					</div>
					
					<hr />
					
					<div id="boardcomment">
					<div style="padding-bottom:10px">댓글</div>
					<c:if test="${empty commentList }">
						<div class="cm-txt-center"><p>작성된 댓글이 없습니다.</p></div>
					</c:if>
					<c:forEach items="${commentList}" var = "commentList">
					
					<div id="commenttop" style="background-color:#F5D0A9; border-radius: 8px">
						<div style="float:left; padding:10px 10px 0px 10px;">
						<h5><img width="25px" height="25px" src="${commentList.member_photo }" alt="sunil">&nbsp;&nbsp;<c:out value="${commentList.writer}" /></h5>
						</div>
						<div style="float:right; padding:10px 10px 0px 10px;"><h5><fmt:formatDate value="${commentList.regdate}" pattern="yyyy-MM-dd"/></h5></div>
						<div style="clear:both;"></div>
					</div>
					<div id="commentcontent" style="padding:5px 10px 0px 10px;">
						<div style="float:right;">
						<c:if test="${commentList.writer eq member.member_id }">
						<input type="button" id="commentDelte" class="commentDelte btn btn-primary" data-rno="${commentList.rno }" value="삭제">
						</c:if>
						</div>
						<div >&nbsp;&nbsp;<c:out value="${commentList.content }" /></div>
					</div>
					<div style="clear:both;"></div>
					<br>
					</c:forEach>
					</div>
					<hr>
					
					<form action="SBCommentWrite.do" name="commentForm" method="post" >
					<input type="hidden" id="bno" name="bno" value="${dto.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
  					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
  					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
  					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
  					<input type="hidden" id="writer" name="writer" value="${member.member_id }">
					<div id="commentWrite">
					&nbsp;&nbsp;<input type="text" id="CommentContent" name="content" size=50 placeholder="댓글을 입력해 주세요">
					<div  style="float:right; padding-right:30px;"><input id="commentWriteBtn" class="replyWriteBtn btn btn-primary" type="button" value="작성"></div>
					</div>
					</form>

	
				
			</div>

				</div><!-- col-9 end -->

			</div><!-- main Row End -->
			
		</div><!-- Container End -->
	</div>
	<!-- End Menu Box -->
			
		
		<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
	</body>
</html>