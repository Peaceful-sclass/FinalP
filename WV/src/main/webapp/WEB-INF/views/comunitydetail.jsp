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
 
     <!-- Site Metas -->
    <title>comunity detail</title>  
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="css/comunity.css">
</head>

<body>
<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />
	<!-- Start -->
	<div class="menu-box">
		<div class="container">
			
			<div class="row">
				<div class="col-2 offset-md-1" style="margin-bottom: 1rem;">
					Category
				</div>
			</div>
			<div class="row inner-menu-box justify-content-center">
				<div class="col-1">
				</div>
				<div class="col-10">
					<table class="table table-sm table-striped table-hover">
					  <thead>
					    <tr>
					      <th scope="col" style="width: 5%;">test</th>
					      <th scope="col" style="width: 10%;">카테고리</th>
					      <th scope="col" style="width: 50%;">제목</th>
					      <th scope="col" style="width: 10%;">작성자</th>
					      <th scope="col" style="width: 10%;">등록일</th>
					      <th scope="col" style="width: 10%;">조회수</th>
					    </tr>
					  </thead>
					  <tbody>
						<c:if test="${empty list }">
							<p>글이 없습니다.</p>
						</c:if>
						
					  	<c:forEach var="dto" items="${list}">
						    <tr>
						      <th scope="row" class="cm-txt-center">1 </th>
						      <td class="cm-txt-center">${dto.category}</td>
						      <td class="cm-title">${dto.title}</td>
						      <td class="cm-txt-center">${dto.memberid}관리자</td>
						      <td class="cm-txt-center"><fmt:formatDate value="${dto.regdate}" pattern="yyyy.MM.dd" /></td>
						      <td class="cm-txt-center">${dto.views}</td>
						    </tr>
					  		
					  	</c:forEach>
					  	
					  </tbody>
					  <tfoot>
					    <tr>
					      <td colspan="12">footer</td>
					    </tr>
					  	
					  </tfoot>
					</table>
				</div>
				<div class="col-1">
				</div>
			</div>
			
		</div>
	</div>
	<!-- End -->
	
	
<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</body>
</html>