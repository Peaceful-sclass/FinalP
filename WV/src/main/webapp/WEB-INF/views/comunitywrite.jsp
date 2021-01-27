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
    <title>comunity write</title>  
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="css/comunity.css">
	


	<style>
	  body > #standalone-container {
	    margin: 50px auto;
	    max-width: 720px;
	  }
	  #editor-container {
	    height: 350px;
	    border: 1px solid rgba(239, 204, 135, 0.8);
	  }
	  #toolbar-container{
	  	border: 1px solid rgba(239, 204, 135, 0.8);
	  }
	</style>
	


</head>

<body>
<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />
	<!-- Start -->
	<div class="menu-box" style="padding: 150px 0 50px 0px;">
		<!-- write container Start -->
		<div class="container">
			<div class="row">
				<!-- 본문 상단 내용 -->
			</div>
			
			<!-- 본문 중단 시작 -->
			<div class="row">
				<div class="col-1"></div>
				
				<div class="col-10 dv-border">
					<!-- 제목 입력 -->
					<div class="dv-header">
						<input class="dv-subject" type="text" name="title" value="${dto.title}" placeholder="제목을 입력해 주세요." style="border: 1px solid rgba(239, 204, 135, 1); width: 95%;"/>
					</div>
					<!-- Category 입력 -->
					<div class="dv-category">
						<select name="category" style="border: 1px solid rgba(239, 204, 135, 1);" >
							<option value="" <c:out value="${dto.category == null ? 'selected':''}" />>카테고리를 선택해주세요</option>
							<option value="자유" ${dto.category eq'자유'? 'selected':''} >자유</option>
							<option value="Q&A" <c:out value="${dto.category eq'Q&A'? 'selected':''}" />>Q&A</option>
						</select>
					</div>
					<!-- 내용 입력-->
					<div class="dv-middle">
						<div class="dv-writeform">
							
							<div id="standalone-container">
								  <div id="toolbar-container">
								    <span class="ql-formats">
								      <select class="ql-font"></select>
								      <select class="ql-size"></select>
								    </span>
								    <span class="ql-formats">
								      <button class="ql-bold"></button>
								      <button class="ql-italic"></button>
								      <button class="ql-underline"></button>
								      <button class="ql-strike"></button>
								    </span>
								    <span class="ql-formats">
								      <select class="ql-color"></select>
								      <select class="ql-background"></select>
								    </span>
								    <span class="ql-formats">
								      <button class="ql-script" value="sub"></button>
								      <button class="ql-script" value="super"></button>
								    </span>
								    <span class="ql-formats">
								      <button class="ql-header" value="1"></button>
								      <button class="ql-header" value="2"></button>
								      <button class="ql-blockquote"></button>
								      <button class="ql-code-block"></button>
								    </span>
								    <span class="ql-formats">
								      <button class="ql-list" value="ordered"></button>
								      <button class="ql-list" value="bullet"></button>
								      <button class="ql-indent" value="-1"></button>
								      <button class="ql-indent" value="+1"></button>
								    </span>
								    <span class="ql-formats">
								      <button class="ql-direction" value="rtl"></button>
								      <select class="ql-align"></select>
								    </span>
								    <span class="ql-formats">
								      <button class="ql-link"></button>
								      <button class="ql-image"></button>
								      <button class="ql-video"></button>
								      <button class="ql-formula"></button>
								    </span>
								    <span class="ql-formats">
								      <button class="ql-clean"></button>
								    </span>
								  </div>
								  <div id="editor-container"></div>
							</div>
							

							  

							
						</div>
						
						<!-- <textarea class="dv-textarea" name="dv-content-ta" cols="300" rows="900"></textarea> -->
					</div>

					<div class="dv-foot">
						<input class="bt-write" type="button" value="취소" onclick="location.href='comunity.do?category=전체&currentPage=1'">
						<input class="bt-write" type="button" value="작성완료" onclick="cmwrite();">
					</div>

				</div>
				
				<div class="col-1"></div>
			</div>
			<div class="row">
				<!-- 본문 하단 내용 -->
			</div>
		</div>
		<!-- write container End -->
			
			
	</div>
	<!-- End -->
<!-- 	<form id="writeform" action="" method="get">
		<input type="hidden" name="title" id="q-title">
		<input type="hidden" name="content" id="q-content">
	</form> -->
	<script src="js/comunity.js"></script>
	<script>
		/* window.addEventListener("load", function() {
	
		}, false) ; */
	
			hljs.configure({
				  languages: ['javascript', 'ruby', 'python', 'java', 'html', 'css', 'cpp']
				});
				
				var quill = new Quill('#editor-container', {
				    modules: {
				      formula: true,
				      syntax: true,
				      toolbar: '#toolbar-container'
				    },
				    placeholder: '내용을 입력해 주세요.',
				    theme: 'snow'
				});

				let ctt1 = JSON.stringify(${dto.content});
				let	ctt2 = JSON.parse(ctt1);
				console.log(ctt2);
				//const delta = quill.clipboard.convert(ctt);
				
				quill.setContents(ctt2, 'silent');
		
	</script>
	<input type="hidden" name="member_no" id="memberno" value="${member.member_no }" />
	<input type="hidden" name="member_id" id="memberid" value="${member.member_id }" />
	<input type="hidden" name="category" id="category" value="${dto.category }" />
	<input type="hidden" name="cno" id="cno" value="${dto.cno }" />
<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</body>
</html>