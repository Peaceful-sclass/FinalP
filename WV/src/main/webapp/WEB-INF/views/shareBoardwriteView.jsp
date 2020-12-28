<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
</head>
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
			<form action="shareBoardWrite.do" method="post">
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
							<td>						
								<button type="submit">작성</button>
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