<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
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
    <!-- toastr CSS : 알림(alert) 대체 -->
    <link rel="stylesheet" href="css/toastr.min.css" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">
    <!-- place CSS -->
    <link rel="stylesheet" href="css/place.css">
    
	<script src="js/jquery-3.2.1.min.js"></script>
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<script type="text/javascript">
		function tab_click(param){
			if(param=='comunity'){
				location.href = "comunity.do?category=전체&currentPage=1";
			}
		};
		
	</script>		
</head>
<!-- 로그인 스크립트 -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#outBtn").on("click", function(){
			location.href="logout.do";

		})
		
		$("#registerBtn").on("click", function(){
			location.href="register.do";
		})
		
		$("#memberUpdateBtn").on("click", function(){
			location.href="test.do";
		})    
		
		$("#memberDeleteBtn").on("click", function(){
			location.href="dest.do";
		})  
	});
</script>
<body>
	<!-- Start header -->
	<header class="top-navbar">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container">
				<a class="navbar-brand" href="index.html">
					<img src="images/we.png" alt="" />
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
				  <span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbars-rs-food">
					<ul class="navbar-nav ml-auto">
					     
						<li class="nav-item"><a class="nav-link" href="home.do">홈</a></li>
						<li class="nav-item"><a class="nav-link" href="sidemenuex.do">팀메뉴</a></li>
						<li class="nav-item"><a class="nav-link" href="shareDocumentList.do">팀메뉴2</a></li>
						<li class="nav-item"><a class="nav-link" href="javascript:void(0);" onclick="tab_click('comunity'); return false;">커뮤니티</a></li>
						<li class="nav-item"><a class="nav-link" href="out.do">의뢰</a></li>
						<li class="nav-item"><a class="nav-link" onclick="placemodalshow()">모임장소</a></li>
					</ul>
		
		<!-- 로그인// -->
		<form name='homeForm' method="post" action="login.do">
		<c:if test="${member == null}">
			<div>
				<label for="member_id"></label>
				<input type="text" id="userId" name="member_id">
			</div>
			<div>
				<label for="member_pw"></label>
				<input type="password" id="userPass" name="member_pw">
			</div>
			<div>
				  <span><a href="login.do"><button type="submit">로그인</button></a></span>
				      <span><a href="register.do"><button type="button">회원가입</button></a></span>  
				<!--<button type="submit">로그인</button>
				<button id="registerBtn" type="button">회원가입</button>-->
				
			</div>
		</c:if>
		<c:if test="${member != null }">
			<div>
				<p>${member.member_id}님 환영 합니다.</p>
				<button id="memberUpdateBtn" type="button">회원정보수정</button>
				<!-- function빼고 해보기 
				<span><a href="memberUpdateView"><button type="button">회원정보수정</button></a></span>-->
				<button id="memberDeleteBtn" type="button">회원탈퇴</button>
				<button id="outBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
	</form>
				</div>
			</div>
		</nav>
		

	</header>
	<!-- End header -->
	

	<!-- 모임장소 Modal -->
    <div class="modal fade" id="placeModal" role="dia">
        <div class="modal-dialog" style="max-width: 100%; max-height:100%; width: 80%; height: 80%;">
            <div class="modal-content">
                <div class="modal-header">
                 	<h4 id="modal-title" class="modal-title"></h4>                 	             	
                    <button type="button" class="close" data-dismiss="modal">x</button>                  
                </div>
                <div class="modal-body">
                	<div id="placeListAll">
                	</div>
                	<div id="placeDetail">
                	</div>
					<div class="map_wrap">
					    <div id="map" style="width:100%; height:100%; position:relative;overflow:hidden;"></div>					
					    <div id="menu_wrap" class="bg_white">
					        <div class="option">
					            <div>
					                <form onsubmit="searchPlaces(); return false;">
					                    	검색 : <input type="text" value="KH정보교육원" id="keyword" size="15"> 
					                    <button type="submit">검색하기</button>
					                </form>
					            </div>
					        </div>
					        <hr>
					        <ul id="placesList"></ul>
					        <div id="pagination"></div>
					    </div>					    
					</div>
					<div id="placeform" style="float: right">
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
					       				<td><input type="radio" name="soket" value="있음">있음 <input type="radio" name="soket" value="없음">없음</td>
					       			</tr>
					       			<tr>
					       				<th>컴퓨터 사용가능 여부</th>
					       				<td><input type="radio" name="com" value="사용가능">사용가능 <input type="radio" name="com" value="사용불가">사용불가</td>
					       			</tr>
					       			<tr>
					       				<th>수용 가능 인원</th>
					       				<td><input type="radio" name="people" value="2~4인">2~4인 <input type="radio" name="people" value="5~8인">5~8인 <input type="radio" name="people" value="8인이상">8인이상</td>
					       			</tr>
					        	</table>
					        	<input type="hidden" name="lat" id="lat" value="">
					        	<input type="hidden" name="lng" id="lng" value="">
					    </div>
					    <div id="commentinsertdiv" style="padding-top: 10px; display:none;">
							<div class="row">
								<div class="col-sm-10">
									<textarea class="form-control" rows="3" id="placecomment" placeholder="댓글을 입력해 주세요"></textarea>
								</div>
								<div class="col-sm-2">
									<button type="button" class="btn btn-sm btn-primary" id="Pcommentsubmit" style="width: 80%; margin-top: 10px"> 저 장 </button>
								</div>
							</div>
						</div>
						<div id="pcomments" class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px; display:none;">
							<div id="pcommentsList"></div>							
						</div>
                </div>
                <div class="modal-footer" id="modal-footer">
                	<button type='button' id='placeinsertform'>모임장소글쓰기</button>
                	<button type='button' id="allListShow" onclick='allListShow();'>목록으로</button>
                	<button type='button' id='placeinsert' onclick="placesubmit()">글작성</button>
                	<button type='button' data-dismiss='modal'>Close</button>
                </div>
            </div>
        </div>
    </div>




	

	

	
	

	


	

	
	<a href="#" id="back-to-top" title="Back to top" style="display: none;"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></a>

	<!-- ALL JS FILES -->
	
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
	<script src="js/jquery.superslides.min.js"></script>
	<script src="js/images-loded.min.js"></script>
	<script src="js/isotope.min.js"></script>
	<script src="js/baguetteBox.min.js"></script>
	<script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/toastr.min.js"></script>
    <script src="js/custom.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1056e51774c015f0b972ae144cc7411f&libraries=services"></script>
    <script src="js/place.js"></script>
</body>
</html>