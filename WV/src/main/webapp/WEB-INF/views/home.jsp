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

<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</body>
</html>
