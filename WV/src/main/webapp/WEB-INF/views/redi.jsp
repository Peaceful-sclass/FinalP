<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	request.setCharacterEncoding("UTF-8"); %>
<% 	response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- %@ page session="false" %> --%>

<!DOCTYPE html>
<html lang="ko"><!-- Basic -->
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
 
<title>redirect</title>
<script>
		let email = "${msg}"
		<c:set var="emailv" value="${msg}"></c:set>
		<c:if test="${'' ne emailv}">
			if(email != null||email != ""||email != undefined){
				alert(email);
			}
		</c:if>
		alert("로그인을 위해 홈으로 이동합니다.");
		sessionStorage.setItem("teamInfo","");
		window.sessionStorage.clear();
		location.href="homeClist.do";
</script>
</head>
<body>
	<%-- <jsp:forward page="./home.jsp"></jsp:forward>--%>
</body>
</html>