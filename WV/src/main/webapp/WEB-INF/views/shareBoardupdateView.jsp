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
			
		$(".cancel_btn").on("click", function(){
			event.preventDefault();
			location.href = "shareBoardList.do";
		})
	})
	
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
			<form name="updateForm" role="form" method="post" action="shareBoardupdate.do">
				<input type="hidden" name="bno" value="${dto.bno}" readonly="readonly"/>
				<table>
					<tbody>
						<tr>
							<td>
								<label for="title">제목</label><input type="text" id="title" name="title" value="${dto.title}"/>
							</td>
						</tr>	
						<tr>
							<td>
								<label for="content">내용</label><textarea id="content" name="content"><c:out value="${dto.content}" /></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${dto.writer}" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="regdate">작성날짜</label>
								<fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd"/>					
							</td>
						</tr>		
					</tbody>			
				</table>
				<div>
					<button type="submit" class="update_btn">저장</button>
					<button type="submit" class="cancel_btn">취소</button>
				</div>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>