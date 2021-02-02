<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	request.setCharacterEncoding("UTF-8"); %>
<% 	response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- %@ page session="false" %> --%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />
<br />
<br />
<br />
<br />
<br />
<br />
<h1>
		
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />

<!-- 아래부분은 게시판테스트로 나중에 삭제!! -->
<hr>
아래는 테스트부분 나중에 삭제<br>
<a href="shareBoardwriteView.do">파일게시판글작성test</a>
<br>
<a href="shareBoardList.do">게시판 리스트</a>
<br>
<a href="Chatting.do">chat</a>

<div style="position: fixed; right: 50px; bottom: 85px">

<img src="images/chat.png" width="70px" height="70px" alt="chat" onclick="openchat();">

</div>
<script type="text/javascript">
function openchat(){
	window.open("Chatting.do","채팅창","width=600, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=no");
}
</script>

<!-- 요기까지 -->

<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</body>
</html>
