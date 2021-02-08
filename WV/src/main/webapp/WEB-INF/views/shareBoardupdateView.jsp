<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
 	<title>게시판</title>
</head>
<style>
	.clearfix::after{clear:both;content:'';display:block;}
	#fileIndex input[type="file"] {
	  position: absolute;
	  width: 0;
	  height: 0;
	  padding: 0;
	  overflow: hidden;
	  border: 0;
	}
	#fileIndex label {
	  display: inline-block;
	  padding: 3px 10px 0px 10px;
	  color: #999;
	  vertical-align: middle;
	  background-color: #fdfdfd;
	  cursor: pointer;
	  border: 1px solid #ebebeb;
	  border-radius: 5px;
	}
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
				
				var title = $("#title").val();
				var content = CKEDITOR.instances.content.getData();
				
				if(title == null|| title == ""){
					alert("제목을 입력해 주세요")
					return false;
				}else if(content == null|| content==""){
					alert("내용을 입력해 주세요")
					return false;
				}else{
				formObj.attr("action", "shareBoardupdate.do");
				formObj.attr("method", "post");
				formObj.submit();
				}
			})
			
			CKEDITOR.replace('content', {width:'800px',height: '500px',filebrowserUploadUrl:'SBImageUpload.do'});
		})
		function changename(index) {
			var cur=$("#file_"+index+"").val().split('/').pop().split('\\').pop();
		    $("#filename_"+index+"").text(cur);
		}
			
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
				$("#fileIndex").append("<div class='clearfix'><a href='#' id='filename_"+(++fileIndex)+"' onclick='return false;'><a><label for='file_"+(fileIndex)+"'>파일선택</label><input id='file_"+(fileIndex)+"' type='file' style='float:left;' name='file_"+(fileIndex)+"' onchange='changename("+fileIndex+")'>"+"<button type='button' class='btn btn-primary' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
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
                
                <td><input type="hidden" id="writer" name="writer" value="${dto.writer }">${dto.writer}</td>
                <td><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd" /></td>
            </tr>
            <tr>
                <td colspan="3"><input type="text"  class="form-control" id="title" name="title" value="${dto.title}" ></td>
            </tr>
             
            
             
            <tr>
                <td colspan="3"><textarea id="content" name="content" class="form-control" >${dto.content}</textarea></td>
            </tr>
            
            <tr>
                <td class="danger"><button type="button" class="fileAdd_btn btn btn-primary">파일추가</button></td>
                <td colspan="3" id="fileIndex">
					<c:forEach var="file" items="${file}" varStatus="var">
					<div>
						<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO }">
						<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
						<a href="#" id="fileName" style="float:left;" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
						<button id="fileDel" class='btn btn-primary' onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" style="float:right;" type="button">삭제</button>
						<div class='clearfix'></div>
					</div>
					</c:forEach>
					  <!--   <input type="text" class="upload-name" id="filename" value="" readonly="readonly">
					<label for="file">파일선택</label> 
  					<input type="file" name="file" id="file"> -->
				</td>
            </tr>
            <tr>  
                <td colspan="4"  class="text-center">
                    <button type="submit" class="update_btn btn btn-primary">저장</button>
					<button type="submit" class="cancel_btn btn btn-primary">취소</button>
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

	
	<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</body>
</html>