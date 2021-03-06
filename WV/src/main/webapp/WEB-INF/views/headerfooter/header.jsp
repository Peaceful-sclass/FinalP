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
    <!-- quill CSS -->
    <link rel="canonical" href="https://quilljs.com/standalone/full/">
	<link type="application/atom+xml" rel="alternate" href="https://quilljs.com/feed.xml" title="Quill - Your powerful rich text editor" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.7.1/katex.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/monokai-sublime.min.css" />
	<link rel="stylesheet" href="css/quill.snow.css" />

	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/toastr.min.js"></script>
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
		
		// team 	
		function chkHasTeam() { //회원이 팀을 가진지 확인.
			let login = "${member.member_id}";
			if(login == null || login == "" || login == undefined){
				toastr.warning("로그인이 필요합니다.", "로그인",{tiemOut:5000});
				return false;
			}
			let form = document.createElement("form");
			let sessioninfo = "${team[0].team_no}";
			$(form).append($('<input/>', {type: 'hidden', name: 'member_no', value:'${member.member_no}' }));
			$(form).append($('<input/>', {type: 'hidden', name: 'member_id', value:'${member.member_id}' }));
			form.method = "post";
			if(sessioninfo == null || sessioninfo == "" || sessioninfo == undefined){
				form.action = 'teamcreateform.do';
			}else{
				form.action = 'team.do';
			}
			document.body.appendChild(form);
			console.log("formAction: "+ form.action);
			form.submit();
		}
		
		function unload() {
		    if (self.screenTop > 9000) {
		      // 브라우저 닫힘
		      $("#outBtn").click();
		      location.href="logout.do";
		      window.open ( "google.com" )
		    } else {
		        if (document.readyState == "complete") {
		            // 새로고침
		        } else  if (document.readyState == "loading") {
		           // 다른 사이트로 이동
		        }
		    }
		}
/* 		window.onbeforeunload = function(e) {
			$("#outBtn").click();
		      location.href="logout.do";
		      window.open ( "google.com" )
		};  */

	</script>	


	
	<style type="text/css">
	      #logbt:hover{
	          background:#DB631F;
	          color: white;
	          border-radius: 2px;
	      }
	      #regibt:hover{
	          background:#DB631F;
	          color: white;
	          border-radius: 2px;
	      }
	      #findbt:hover{
	          background:#DB631F;
	          color: white;
	          border-radius: 2px;
	      }		   
	      #userId:hover{
	          background:#DB631F;
	          color: white;
	      }	   
		  #userPass:hover{
	          background:#DB631F;
	          color: white;
	      }	
	      #memberUpdateBtn:hover{
	          background:#DB631F;
	          color: white;
	          border-radius: 2px;
	      }
	      #outBtn:hover{
	          background:#DB631F;
	          color: white;
	          border-radius: 2px;
	      }
	      #lo{
	          width: 60px;
	          height: 30px;
	          font-size: 10px;
	      }

		   
		   #uId{
		         width:80px;
		         height: 25px;
		   }
		   
		   #uPass{
		         width:80px;
		         height: 25px;		   
		   }
		   
		   #logbt{
		         width:70px;
		         height: 25px;		
		         font-size: 5px;
		         border-style:none;
		         background-color:  #f8f9fa;
		         
		   }

		   
		   #regibt{
		         width:65px;
		         height: 25px;	
		         font-size: 5px;
		         border-style:none;
		         background-color:  #f8f9fa;
		   }
		   
		   #findbt{
		         width:70px;
		         height: 25px;		
		         font-size: 5px;
		         border-style:none;
		         background-color:  #f8f9fa;
		         
		   }
		   #memberUpdateBtn{
		         width:60px;
		         height: 25px;	
		         font-size: 5px;
		         border-style:none;	
		         background-color:  #f8f9fa;
		   }
	   		   
		   #outBtn{
		         width:60px;
		         height: 25px;	
		         font-size: 5px;	
		         border-style:none;
		         background-color:  #f8f9fa;
		   }    
		   
		          
		</style>
</head>
<!-- 로그인 스크립트 -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#outBtn").on("click", function(){
			teamSeSinfoRemove();
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
		
		
		
		
		
		
		
		
		//NAV BAR 선택CSS
		let cmd = window.location.pathname;
		let ulnav = document.querySelectorAll(".navbar-nav > .nav-item");
		if(cmd == "/root/team.do"||cmd == "/root/teamin.do"||cmd == "/root/teamcreate.do"
			||cmd == "/root/shareBoardList.do"
			||cmd == "/root/shareBoardDetail.do"
			||cmd == "/root/shareBoardwriteView.do"
			||cmd == "/root/shareBoardWrite.do"
			||cmd == "/root/shareBoardupdateView.do"
			||cmd == "/root/shareBoardupdate.do"
			||cmd == "/root/shareBoardDelete.do"
			||cmd == "/root/SBCommentWrite.do"
			||cmd == "/root/SBCommentDelete.do"
				||cmd == "/root/shareCalendarList.do"
					||cmd == "/root/shareCalendarInsert.do"
					||cmd == "/root/shareCalendarDelete.do"
					||cmd == "/root/shareDocumentList.do"
					||cmd == "/root/shareDocumentInsert.do"
					||cmd == "/root/shareDocumentUpdateForm.do"
					||cmd == "/root/shareDocumentUpdate.do"
					||cmd == "/root/codemain.do"
						||cmd == "/root/detail.do"
							||cmd == "/root/insertform.do"
								||cmd == "/root/insertres.do"
									||cmd == "/root/updateform.do"
										||cmd == "/root/updateres.do"
											||cmd == "/root/delete.do"){
			for(let i=0; i<ulnav.length; i++){
				ulnav[i].classList.remove('active');
				ulnav[1].classList.add('active');
			}
		}
		else if(cmd == "/root/comunity.do"||cmd == "/root/comunitywrite.do"){
			for(let i=0; i<ulnav.length; i++){
				ulnav[i].classList.remove('active');
				ulnav[2].classList.add('active');
			}
		}
		else if(cmd == "/root/home.do"){
			for(let i=0; i<ulnav.length; i++){
				ulnav[i].classList.remove('active');
				ulnav[0].classList.add('active');
			}
		}
	});//위에괄호

	
	//팀
	
	function chkHasTeam() { //회원이 팀을 가진지 확인.
		let login = "${member.member_id}";
		if(login == null || login == "" || login == undefined){
			toastr.warning("로그인이 필요합니다.", "로그인",{tiemOut:5000});
			return false;
		}
		let form = document.createElement("form");
		let sessioninfo = "${team[0].team_no}";
		$(form).append($('<input/>', {type: 'hidden', name: 'member_no', value:'${member.member_no}' }));
		$(form).append($('<input/>', {type: 'hidden', name: 'member_id', value:'${member.member_id}' }));
		form.method = "post";
		if(sessioninfo == null || sessioninfo == "" || sessioninfo == undefined){
			form.action = 'teamcreateform.do';
		}else{
			form.action = 'team.do';
		}
		document.body.appendChild(form);
		console.log("formAction: "+ form.action);
		form.submit();
	}
	
	function teamSeSinfoRemove(){ //로그아웃 시 팀세션의 번호 정보를 초기화.
		window.sessionStorage.setItem("teamInfo","");
	}


</script>
<body><!-- onunload="unload();" -->
	<!-- Start header -->
	<header class="top-navbar">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container">
				<a class="navbar-brand" href="home.do">
					<img src="images/logof.png" alt="" />
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
				  <span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbars-rs-food">
					<ul class="navbar-nav ml-auto" id="lef">
					     
						<li class="nav-item"><a class="nav-link" href="home.do">홈</a></li>
						<li class="nav-item" id="navTeam"><a class="nav-link" href="#" onclick="chkHasTeam(); return false;">팀메뉴</a></li>
						<li class="nav-item"><a class="nav-link" href="javascript:void(0);" onclick="tab_click('comunity'); return false;">커뮤니티</a></li>
						<!-- <li class="nav-item"><a class="nav-link" href="out.do">의뢰</a></li> -->
						<li class="nav-item"><a class="nav-link" onclick="placemodalshow()">모임장소</a></li>
					</ul>
		
		
				</div>
				
				      			<!-- 로그인// -->
		<form name='homeForm' method="post" action="login.do" >
		<c:if test="${member == null}">
			<div>
				<label for="member_id"></label>
				<input style="position: fixed; top: 5px; right: 303px;" type="text" id="uId" name="member_id" placeholder="ID">
			</div>
			<div>
				<label for="member_pw"></label>
				<input style="position: fixed; top: 5px; right: 218px;" type="password" id="uPass" name="member_pw" placeholder="PW">
			</div>
			<div>
				      <span style="position: fixed; top: 5px; right: 145px;"><a href="login.do"><button type="submit" id="logbt"  >로그인</button></a></span>
				      <span style="position: fixed; top: 5px; right: 75px;"><a href="findform.do"><button type="button" id="findbt"  >ID/PW 찾기</button></a></span>
				      <span style="position: fixed; top: 5px; right: 10px;"><a href="register.do"><button type="button" id="regibt">회원가입</button></a></span>  
				<!--<button type="submit">로그인</button>
				<button id="registerBtn" type="button">회원가입</button>-->
			</div>
		</c:if>
		<c:if test="${member != null }">
		    
			<div>
			<p style="position: fixed; top: 5px; right: 140px; font-size: 13px; ">${member.member_id}님 환영합니다 </p>
				<button style="position: fixed; top: 5px; right: 75px;" id="memberUpdateBtn" type="button">내정보</button>
				<!-- <button  style="position: fixed; top: 5px; right: 75px;" id="memberDeleteBtn" type="button">회원탈퇴</button> -->
				<button style="position: fixed; top: 5px; right: 10px;" id="outBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<!-- select로 바꿔서 버튼 지움 -->
           <!-- <div>
			<p style="position: fixed; top: 5px; right: 210px; font-size: 13; ">${member.member_id}님 환영합니다 </p>
				<button style="position: fixed; top: 5px; right: 140px;" id="memberUpdateBtn" type="button">회원수정</button>
				<button  style="position: fixed; top: 5px; right: 75px;" id="memberDeleteBtn" type="button">회원탈퇴</button>
				<button style="position: fixed; top: 5px; right: 10px;" id="outBtn" type="button">로그아웃</button>
			</div>  -->
			<!-- 셀렉트 안하고 페이지이동으로 바꿔서 지움 
        			<div>
			<p style="position: fixed; top: 5px; right: 170px; font-size: 13; ">${member.member_id}님 환영합니다 </p>
			    <select id="sel" onchange="window.open(value,'_self');" style="position: fixed; top: 5px; right: 80px; appearance:none; font-size: 5; border:none; width: 60; height: 25;  text-align-last: center;
                       text-align: center;
                       -ms-text-align-last: center;
                       -moz-text-align-last: center;">
	                      	    	<option selected="selected" style="display: none">내정보</option>
	                    	 	    <option value="test.do">회원수정</option>
	                      		    <option value="dest.do">회원탈퇴</option>
	                          	</select>

				<button style="position: fixed; top: 5px; right: 10px;" id="outBtn" type="button">로그아웃</button>
			</div>
			-->
               
		  <c:if test="${msg == false}">     <!-- 컨트롤러값 아이디 패스워드 틀릴시-->
		     <script type="text/javascript">
		     toastr.warning("아이디 비번 확인해주세요", {tiemOut: 5000});
		     </script>
		 </c:if>

	</form>
			</div>
			 
			 

		</nav>
		 
		 

	</header>
	<!-- End header -->
	

	<!-- 모임장소 Modal -->
    <div class="modal fade" id="placeModal" role="dia">
        <div class="modal-dialog" style="max-width: 100%; width: 70%; ">
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
					                    	검색 : <input type="text" value="KH정보교육원 강남지원 1관" id="keyword" size="15"> 
					                    <button type="submit" class="btn btn-sm btn-primary" style="margin-bottom:2px; border: 1px solid #c0bfbf;">검색하기</button>
					                </form>
					            </div>
					        </div>
					        <hr>
					        <ul id="placesList"></ul>
					        <div id="pagination"></div>
					    </div>					    
					</div>
					<div id="placeformup" style="float: right; display:none; margin-right: 25px;"></div>
					<div id="placeform" style="float: right; margin-right: 25px;">
						<h4>장소명</h4>
						<div class="input-group">
							<div class="input-box">
					    		<input type="text" name="ptitle" id="ptitle" readonly="readonly" class="ptx" onclick="alert('지도에서 장소를 선택하세요');">
					    	</div>
					    </div>
						<h4>모임장소소개</h4>
						<div class="input-group">
							<div class="input-box">
					    		<textarea id="pcontent" class="ptx" cols="28"></textarea>
					    	</div>
					    </div>
					    <h4>콘센트여부</h4>
					    <div class="input-group">
							<div class="input-box">
					    		<input type="radio" name="soket" value="있음" id="soket1" class="radio"><label for="soket1">있음</label><input type="radio" name="soket" value="없음" id="soket2" class="radio"><label for="soket2">없음</label>
					    	</div>
					    </div>
					    
						<h4>컴퓨터 사용가능 여부</h4>
						<div class="input-group">
							<div class="input-box">
								<input type="radio" name="com" value="사용가능" id="com1" class="radio"><label for="com1">사용가능</label><input type="radio" name="com" value="사용불가" id="com2" class="radio"><label for="com2">사용불가</label>							
							</div>
						</div>
						<h4>수용 가능 인원</h4>
						<div class="input-group">
							<div class="input-box">
								<input type="radio" name="people" value="2~4인" id="people1" class="radio"><label for="people1">2~4인</label><input type="radio" name="people" value="5~8인" id="people2" class="radio"><label for="people2" id="lmid">5~8인</label><input type="radio" name="people" value="8인이상" id="people3" class="radio"><label for="people3">8인이상</label>
							</div>
						</div>
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
						<input type="hidden" id="pmemberno" value="${member.member_no}">
						<input type="hidden" id="pmemberid" value="${member.member_id}">
                </div>
                <div class="modal-footer" class="btn btn-sm btn-primary" id="modal-footer">
                	<button type='button' class="btn btn-sm btn-primary" id='placeinsertform'>모임장소글쓰기</button>
                	<button type='button' class="btn btn-sm btn-primary" id="allListShow" onclick='allListShow();'>목록으로</button>
                	<button type='button' class="btn btn-sm btn-primary" id='placeinsert' onclick="placesubmit()">글작성</button>
                	<button type='button' class="btn btn-sm btn-primary" data-dismiss='modal'>Close</button>
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
    <script src="js/custom.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1056e51774c015f0b972ae144cc7411f&libraries=services"></script>
    <script src="js/place.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.7.1/katex.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>
	<script src="js/quill.min.js"></script>
    
</body>
</html>