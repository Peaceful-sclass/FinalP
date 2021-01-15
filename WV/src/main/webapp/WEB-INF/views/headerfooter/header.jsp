<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
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
    <title>header1</title>  
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">    
	<!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">    
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<!-- Start header -->
	<header class="top-navbar">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container">
				<a class="navbar-brand" href="index.html">
					<img src="images/fake.png" alt="" />
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
				  <span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbars-rs-food">
					<ul class="navbar-nav ml-auto">
					     
						<li class="nav-item active"><a class="nav-link" href="home.do">홈</a></li>
						<li class="nav-item"><a class="nav-link" href="sidemenuex.do">팀메뉴</a></li>
						<li class="nav-item"><a class="nav-link" href="#">커뮤니티</a></li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">의뢰</a>
							<div class="dropdown-menu" aria-labelledby="dropdown-a">
								<a class="dropdown-item" href="123.jsp">의뢰보기</a>
								<a class="dropdown-item" href="456.jsp">신청현황</a>
								<a class="dropdown-item" href="123.jsp">ex3</a>
							</div>
						</li>

						<li class="nav-item"><a class="nav-link" href="contact.html">모임장소</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<span style="z-index: 105; position: fixed; right: 20px;"><a href="registerform.do">회원가입</a></span>
		<span style="z-index: 105; position: fixed; right: 90px;"><a href="login.do">로그인</a></span>
	</header>
	<!-- End header -->
	
	<!-- Modal -->
    <div class="modal fade" id="placeModal" role="dialog">
        <div class="modal-dialog" style="max-width: 100%; max-height:100%; width: 80%; height: 80%;">
            <div class="modal-content">
                <div class="modal-header">
                 	<h4 id="modal-title" class="modal-title"></h4>                	
                    <button type="button" class="close" id="close" data-dismiss="modal">x</button>                  
                </div>
                <div class="modal-body">
					<div class="map_wrap">
					    <div id="map" style="width:100%; height:100%; position:relative;overflow:hidden;"></div>					
					    <div id="menu_wrap" class="bg_white">
					        <div class="option">
					            <div>
					                <form onsubmit="searchPlaces(); return false;">
					                    	검색 : <input type="text" value="서울역" id="keyword" size="15"> 
					                    <button type="submit">검색하기</button> 
					                </form>
					            </div>
					        </div>
					        <hr>
					        <ul id="placesList"></ul>
					        <div id="pagination"></div>
					    </div>
					    <div style="display:inline-block">
					        <form>
					        	<table>
					       			<tr>
					       				<th>장소이름 </th>
					       				<td><input type="text" name="ptitle" id="ptitle"></td>
					       			</tr>
					       			<tr>
					       				<th>모임장소소개</th>
					       				<td><textarea id="pcontent"></textarea></td>
					       			</tr>
					       			<tr>
					       				<th>구비사항 </th>
					       				<td></td>
					       			</tr>
									<tr>
					       				<th>콘센트여부</th>
					       				<td><input type="radio" name="soket" value="Y">있음 <input type="radio" name="soket" value="N">없음</td>
					       			</tr>
					       			<tr>
					       				<th>컴퓨터 사용가능 여부</th>
					       				<td><input type="radio" name="com" value="Y">사용가능 <input type="radio" name="com" value="N">사용불가</td>
					       			</tr>
					       			<tr>
					       				<th>수용 가능 인원</th>
					       				<td><input type="radio" name="people" value="max4">2~4인 <input type="radio" name="people" value="max8">5~8인 <input type="radio" name="people" value="max">8인이상</td>
					       			</tr>
					        	</table>
					        	<input type="hidden" name="lat" id="lat" value="">
					        	<input type="hidden" name="lng" id="lng" value="">
					        </form>
					    </div>
					</div>
                </div>
                <div class="modal-footer" id="modal-footer">
                	<button type='button' class='placeinsertform' id='placeinsertform'>모임장소글쓰기</button>
                	<button type='button' class='placeinsertform' id='placeinsert' onclick="placesubmit()">글작성</button>
                	<button type='button' id='close' data-dismiss='modal'>Close</button>
                </div>
            </div>
        </div>
    </div>
	

	

	
	

	


	

	
	<a href="#" id="back-to-top" title="Back to top" style="display: none;"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></a>

	<!-- ALL JS FILES -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
	<script src="js/jquery.superslides.min.js"></script>
	<script src="js/images-loded.min.js"></script>
	<script src="js/isotope.min.js"></script>
	<script src="js/baguetteBox.min.js"></script>
	<script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/custom.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1056e51774c015f0b972ae144cc7411f&libraries=services"></script>
    <script src="js/place.js"></script>
</body>
</html>