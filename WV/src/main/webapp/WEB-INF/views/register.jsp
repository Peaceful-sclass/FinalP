<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<!-- Basic -->

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원가입</title>

<style>
#userId:hover {
	background: #DB631F;
	color: white;
}

#userPass:hover {
	background: #DB631F;
	color: white;
}

#userPassC:hover {
	background: #DB631F;
	color: white;
}

#userEmail:hover {
	background: #DB631F;
	color: white;
}

#userGrade:hover {
	background: #DB631F;
	color: white;
}

#submit:hover {
	background: #DB631F;
	color: white;
	border-radius: 2px;
}

#cc:hover {
	background: #bebebe;
	color: #f8f9fa;
	border-radius: 2px;
}

#dm:hover {
	background: #DB631F;
	color: white;
	border-radius: 2px;
}
#idChk:hover {
	background: #DB631F;
	color: white;
	border-radius: 2px;
}

#userId {
	width: 200px;
	border-radius: 2px;
}

#userPass {
	width: 200px;
	border-radius: 2px;
}

#userPassC {
	width: 200px;
	border-radius: 2px;
}

#userEmail {
	width: 200px;
	border-radius: 2px;
}
#userEmail2 {
	width: 200px;
	border-radius: 2px;
}

#member_pfname {
	width: 200px;
	border-radius: 2px;
	float: left;
}

#userGrade {
	width: 140px;
	border-radius: 2px;
}

#container {
	position: relative;
	left: 400px;
	top: 30px;
	border-radius: 2px;
}

#submit {
	background-color: white;
	color: #DB631F;
	font-weight: bold;
	border-style: solid;
	border-color: #DB631F;
	border-radius: 2px;
}

#cc {
	border-style: #DB631F;
	background-color: #f8f9fa;
	font-weight: bold;
	border-style: solid;
	border-radius: 2px;
}
#idChk{
    background-color: white;
	color: #DB631F;   
	font-weight: bold;
	border-style: solid;
	border-color: #DB631F;
	border-radius: 2px;
}

#f {
	color: #DB631F;
	font-weight: bold;
}

.col-8 {
	left: 220px;
}
input[type="file"] {
  position: absolute;
  width: 0;
  height: 0;
  padding: 0;
  overflow: hidden;
  border: 0;
}
.filelabel{
	display: inline-block;
    padding: 1px 6px;
    vertical-align: middle;
    cursor: pointer;    
    background-color: white;
    color: #DB631F;
    font-weight: bold;
    border: 2px solid #DB631F;
    border-radius: 2px;
    margin: 1% 0px 0px 1%;
}
.filelabel:hover {
	background: #DB631F;
	color: white;
	border-radius: 2px;
}
</style>


</head>

<body>
	<jsp:include page="/WEB-INF/views/headerfooter/header.jsp"
		flush="false" />

	<script type="text/javascript">
		$(document).ready(function() {
			// 취소
			$("#cc").on("click", function() {

				location.href = "/root";

			})
			//아이디 입력확인
			$("#submit").on("click", function() {
				if ($("#userId").val() == "") {
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}

				//비번입력확인
				if ($("#userPass").val() == "") {
					alert("패스워드를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				//비번체크확인
				if ($("#userPassC").val() == "") {
					alert("패스워드확인을 입력해주세요.");
					$("#userPassC").focus();
					return false;
				}				
				//이메일입력확인
				if ($("#userEmail").val() == "") {
					alert("이메일을 입력해주세요.");
					$("#userEmail").focus();
					return false;
				}
				
				//도메인선택확인
				if ($("#dm").val() == "") {
					alert("도메인을 선택해주세요.");
					$("dm").focus();
					return false;
				}
				//아이디 중복확인
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("중복확인을 해주세요.");
					return false;
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
				}
			});
			
			//프로필 이미지 변경
			$("#member_pfimg").on('change', function(){ 
				var imgname = $("#member_pfimg").val().split('/').pop().split('\\').pop();
			    $("#member_pfname").val(imgname);
			});
		})

		//비밀번호확인
		function tocheckpw() {
			var member_pw = document.getElementById("userPass").value;
			var member_pwC = document.getElementById("userPassC").value;

			if (member_pw != member_pwC) {
				document.getElementById('pwsame').innerHTML = '비밀번호가다릅니다 다시입력해서주세요'
				return false;
			}
		}
		//아이디중복
		function fn_idChk(){
			$.ajax({
				url : "idChk.do",
				type : "post",
				data : {"member_id" : $("#userId").val()},    //data{"member-mapper해당이름": $("해당부분").val()}
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			});
		}
		//이메일도메인가져오기
		$(function(){	

			$(document).ready(function(){

				$('select[name=emailSelection]').change(function() {

					if($(this).val()=="1"){

						$('#userEmail2').val("");

					} else {

						$('#userEmail2').val($(this).val());

						$("#userEmail2").attr("readonly", true);
					}
				});
			});
		});
		
		 //한글입력 안되게 처리
		$(document).ready(function(){

			  $("input[class=form-control]").keyup(function(event){ 

			   if (!(event.keyCode >=37 && event.keyCode<=40)) {

			    var inputVal = $(this).val();

			    $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));

			   }

			  });

			});

		}	
		
	</script>


	<div class="menu-box">

		<div class="container">


			<form action="register.do" onsubmit="return tocheckpw()"
				data-ajax="false" method="post" id="regForm" enctype="multipart/form-data">
				<!-- onsubmit="return tocheckpw()" data-ajax="false" 해당function이 맞으면 submit 아니면 페이지그대로-->

				<div class="row">
					<div class="col-2"></div>
					<div class="col-8">
						<h1>회원가입</h1>
						<br>
						<div class="form-group has-feedback">
							<label class="control-label" for="member_id" id="f">아이디</label><!-- for는 member-mapper부분 -->
							<div>
							<input class="form-control" type="text" id="userId" style="display:inline-block"
								name="member_id" maxlength="8" placeholder="8자이내 영문,숫자 입력" required> <!-- required : 반드시입력되어야한다는 필드 -->
						    <button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>  
						    </div>  
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="member_pw" id="f">패스워드</label>
							<input class="form-control" type="password" id="userPass"
								name="member_pw" maxlength="8" placeholder="8자이내 영문,숫자 입력" />
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="member_pwC" id="f">패스워드확인
								</label> <input class="form-control" type="password" id="userPassC"
								name="member_pw2" maxlength="8"  placeholder="8자이내 영문,숫자 입력" />
							<p id="pwsame" style="color: red;"></p>
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="member_email" id="f">이메일</label> 
							<div>
							<input class="form-control" type="text" id="userEmail"
								name="member_email" placeholder="이메일 입력" style="display:inline-block;"/>@
							<input class="form-control" type="text" id="userEmail2"
								name="member_email" placeholder="도메인" style="display:inline-block;"/>							 
                                 <select id="emailSelection" name="emailSelection">
	                      	    	<option value="1" selected="selected">직접입력</option>
	                    	 	    <option value="gmail.com">gmail.com</option>
	                      		    <option value="naver.com">naver.com</option>
		                         	<option value="hanmail.net">hanmail.net</option>
		                         	<option value="yahoo.com">yahoo.com</option>
		                         	<option value="daum.net">daum.net</option>
		                         	<option value="nate.com">nate.com</option>
		                         	<option value="dreamwiz.com">dreamwiz.com</option>
	                          	</select>
                            </div>
                            
						</div>
						<div class="form-group has-feedback">
							<div class="control-label" id="f" style="margin-bottom: .5rem;">프로필사진</div> 
							<input type="text" class="form-control" id="member_pfname" value="" readonly="readonly">
							<label for="member_pfimg" class="filelabel">파일선택</label> 
  							<input type="file" name="member_pfimg" id="member_pfimg"  accept="image/*">  
						</div>
						
						<div class="form-group has-feedback" style="display: none">
							<!-- 아직 사용안하는부분이라 숨김 -->
							<label class="control-label" for="member_grade" id="f">회원등급</label>
							<select class="form-control" id="userGrade" name="member_grade">
								<option>일반회원</option>
							</select>
						</div>
						<div class="form-group has-feedback">
							<button type="submit" id="submit">회원가입</button>
							<button type="button" id="cc">취소</button>
						</div>

					</div>
					<!-- col-8 end -->
					<div class="col-2"></div>

				</div>
				<!-- row -->
			</form>


		</div>
		<!-- container -->
	</div>
	<!-- menu박스 -->
	<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp"
		flush="false"></jsp:include>
</body>

</html>