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
<style>
	.clearfix::after{clear:both;content:'';display:block;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(document).on("click","#fileDel", function(){
				$(this).parent().remove();
			})
			
			fn_addFile();
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "shareBoardDetail.do?bno=${dto.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "shareBoardupdate.do");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			CKEDITOR.replace('content', {width:'800px',height: '500px'});
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
 		function fn_addFile(){
			var fileIndex = 1;
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div class='clearfix'><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
 		var fileNoArry = new Array();
 		var fileNameArry = new Array();
 		function fn_del(value, name){
 			
 			fileNoArry.push(value);
 			fileNameArry.push(name);
 			$("#fileNoDel").attr("value", fileNoArry);
 			$("#fileNameDel").attr("value", fileNameArry);
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
    
    <div>
        <form name="updateForm" role="form" method="post" action="shareBoardupdate.do" enctype="multipart/form-data">
        		<input type="hidden" id="bno" name="bno" value="${dto.bno}" />
				<input type="hidden" id="page" name="page" value="${scri.page}"> 
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				<input type="hidden" id="fileNoDel" name="fileNoDel[]" value="">
				<input type="hidden" id="fileNameDel" name="fileNameDel[]" value="">
		
            <div class="table table-responsive">
                      <table class="table table-striped">
            <tr>
                <td class="danger">작성자</td>
                
                <td><input type="hidden" id="writer" name="writer" value="${dto.writer }">${dto.writer}</td>
                <td class="danger">작성일</td>
                <td><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd" /></td>
            </tr>
            <tr>
                <td class="danger">제목</td>
                <td colspan="3"><input type="text"  class="form-control" id="title" name="title" value="${dto.title}" ></td>
            </tr>
             
            
             
            <tr>
                <td class="danger">내용</td>
                <td colspan="3"><textarea id="content" name="content" class="form-control" >${dto.content}</textarea></td>
            </tr>
            
            <tr>
                <td class="danger"><button type="button" class="fileAdd_btn">파일추가</button></td>
                <td colspan="3" id="fileIndex">
					<c:forEach var="file" items="${file}" varStatus="var">
					<div>
						<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO }">
						<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
						<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
						<button id="fileDel" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button">삭제</button><br>
					</div>
					</c:forEach>
				</td>
            </tr>
            <tr>  
                <td colspan="4"  class="text-center">
                    <button type="submit" class="update_btn">저장</button>
					<button type="submit" class="cancel_btn">취소</button>
                </td>
            </tr>
          </table>
         
     
            </div>
            </form>  
    </div>
	</div>
	</div>

				</div><!-- col-9 end -->

			</div><!-- main Row End -->
			
		</div><!-- Container End -->
	</div>
	<!-- End Menu Box -->

<!-- 
	<br><br><br><br><br><br><br><br>
		<div id="container">
		
		<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <form name="updateForm" role="form" method="post" action="shareBoardupdate.do" enctype="multipart/form-data">
        		<input type="hidden" id="bno" name="bno" value="${dto.bno}" />
				<input type="hidden" id="page" name="page" value="${scri.page}"> 
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				<input type="hidden" id="fileNoDel" name="fileNoDel[]" value="">
				<input type="hidden" id="fileNameDel" name="fileNameDel[]" value="">
		
            <div class="table table-responsive">
                      <table class="table table-striped">
            <tr>
                <td class="danger">작성자</td>
                
                <td><input type="hidden" id="writer" name="writer" value="${dto.writer }">${dto.writer}</td>
                <td class="danger">작성일</td>
                <td><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd" /></td>
            </tr>
            <tr>
                <td class="danger">제목</td>
                <td colspan="3"><input type="text"  class="form-control" id="title" name="title" value="${dto.title}" ></td>
            </tr>
             
            
             
            <tr>
                <td class="danger">내용</td>
                <td colspan="3"><textarea id="content" name="content" class="form-control" >${dto.content}</textarea></td>
            </tr>
            
            <tr>
                <td class="danger"><button type="button" class="fileAdd_btn">파일추가</button></td>
                <td colspan="3" id="fileIndex">
					<c:forEach var="file" items="${file}" varStatus="var">
					<div>
						<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO }">
						<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
						<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
						<button id="fileDel" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button">삭제</button><br>
					</div>
					</c:forEach>
				</td>
            </tr>
            <tr>  
                <td colspan="4"  class="text-center">
                    <button type="submit" class="update_btn">저장</button>
					<button type="submit" class="cancel_btn">취소</button>
                </td>
            </tr>
          </table>
         
     
            </div>
            </form>  
    </div>
	</div>
	</div>
	 -->
	
	<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</body>
</html>