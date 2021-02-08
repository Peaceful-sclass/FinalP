<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />
<br><br><br><br><br><br>
	<h1>Select One</h1>

	<a href="listAll.do">모두보기</a><br>
	<a href="list.do?myco=1">Dao</a><br>
	<a href="list.do?myco=2">Dto</a><br>
	<a href="list.do?myco=3">Biz</a><br>
	<a href="list.do?myco=4">Controller</a><br>
	<a href="list.do?myco=5">Sql</a><br>
	<a href="list.do?myco=6">Js</a><br>
	<a href="list.do?myco=7">Css</a><br>
	<a href="list.do?myco=8">VIEWS</a><br>
	<a href="list.do?myco=9">Others</a><br>
	
<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>


</body>
</html>