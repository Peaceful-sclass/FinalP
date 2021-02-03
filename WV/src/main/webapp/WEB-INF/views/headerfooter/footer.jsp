<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%	request.setCharacterEncoding("UTF-8"); %>
<% 	response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html lang="ko"><!-- Basic -->
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
   
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
 
     <!-- Site Metas -->
    <title>footer1</title>  
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

</head>

<body>


		<!-- Start Footer -->
		<footer class="footer-area bg-f">
		
		
			<script type="text/javascript">
			
			function openchat(){
				objtestchat= window.open("Chatting.do","testchat","width=500, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=no");
			}

			</script>
		
		
			<div class="copyright">
				<div class="container">
				
				<c:if test="${not empty teamInfo }">
					<div style="position: fixed; right: 50px; bottom:100px">
					<img src="images/chat.png" width="70px" height="70px" alt="chat" onclick="openchat();">
					</div>
				</c:if>
				
					<div class="row">
						<div class="col-lg-12">
							<p class="company-name">All Rights Reserved. &copy; 2020 - <a href="#">WORKINGVILLAGE</a> -
						<a href="https://html.design/"></a>WV</p>
						</div>
					</div>
				</div>
			</div>
			
		</footer>
		<!-- End Footer -->

</body>
</html>