<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<style>
	.clearfix::after{clear:both;content:'';display:block;}
</style>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "shareBoardWrite.do");
				formObj.attr("method", "post");
				formObj.submit();
			});
			fn_addFile();
			
			CKEDITOR.replace('content', {width:'800px',height: '500px'});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
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
		
		
		
</script>
<body>

	<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />
	<br><br><br><br><br><br><br><br>
	<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h2 class="text-center">게시글 작성</h2><p>&nbsp;</p>
        <form name="writeForm" action="shareBoardWrite.do" method="post" enctype="multipart/form-data">
        <input type="hidden" id="writer" name="writer" value="${member.member_id }" >
            <div class="table table-responsive">
                      <table class="table table-striped">
            <tr>
                <td class="danger"><h3 class="text-center">제목</h3></td>
                <td colspan="3"><input type="text" id="title" name="title" class="form-control"></td>
            </tr>
             
            <tr>
                <td class="danger"><h3 class="text-center">내용</h3></td>
                <td colspan="3"><textarea  id="content" name="content" class="form-control"></textarea></td>
            </tr>
            
            <tr>
                <td class="danger"><button class="fileAdd_btn" type="button">파일추가</button></td>
                <td colspan="3" id="fileIndex"></td>
            </tr>
             
            <tr>  
                <td colspan="4"  class="text-center">
                    <button class="write_btn btn btn-warning" type="submit" >작성</button>
                </td>
            </tr>
          </table>
         
     
            </div>
        </form>   
    </div>
</div>
	
	<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</body>
</html>