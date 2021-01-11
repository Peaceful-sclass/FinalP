<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
		
</script>
<body>
	
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
			<form name="writeForm" action="shareBoardWrite.do" method="post" enctype="multipart/form-data">
				<table>
					<tbody>
						<tr>
							<td>
								<label for="title">제목</label><input type="text" id="title" name="title" />
							</td>
						</tr>	
						<tr>
							<td>
								<label for="content">내용</label><textarea id="content" name="content" ></textarea>
							</td>
						</tr>
						<tr>
							<td id="fileIndex">
							</td>
						</tr>
						<tr>
							<td>						
								<button class="write_btn" type="submit">작성</button>
								<button class="fileAdd_btn" type="button">파일추가</button>
							</td>
						</tr>			
					</tbody>			
				</table>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>