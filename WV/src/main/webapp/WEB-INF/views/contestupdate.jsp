<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	request.setCharacterEncoding("UTF-8"); %>
<% 	response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/contest.css">
<script type="text/javascript" src="se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function onlyNumber() {
		if(event.keyCode<48 || event.keyCode>57){
            event.returnValue=false;
         }
	}
	function update() {
		if(!$('input[name=contestname]').val().trim()){
			alert("공모전명: 필수 입력항목 입니다");
			$('input[name=contestname]').focus();
			return;
		}
		if(!$('input[name=contestagent]').val().trim()){
			alert("주최사: 필수 입력항목 입니다");
			$('input[name=contestagent]').focus();
			return;
		}
		if(!$("input:checkbox[name='contestfieldb']").is(":checked")){
			alert("공모분야-분야별: 필수 입력항목 입니다");
			$('input[name=contestfieldb]').focus();
			return;
		}
		if(!$("input:checkbox[name='contesttargetb']").is(":checked")){
			alert("공모분야-응시대상자: 필수 입력항목 입니다");
			$('input[name=contesttargetb]').focus();
			return;
		}
		if(!$("input:checkbox[name='contestcompanyb']").is(":checked")){
			alert("공모분야-주최사: 필수 입력항목 입니다");
			$('input[name=contestcompanyb]').focus();
			return;
		}
		if(!$("input:checkbox[name='contestrewardb']").is(":checked")){
			alert("공모분야-시상내역: 필수 입력항목 입니다");
			$('input[name=contestrewardb]').focus();
			return;
		}
		if(!$('input[name=conteststart]').val()){
			alert("접수기간을 확인해 주세요");
			$('input[name=conteststart]').focus();
			return;
		}
		if(!$('input[name=contestend]').val()){
			alert("접수기간을 확인해 주세요");
			$('input[name=contestend]').focus();
			return;
		}
		oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
        var contenteval = $("#smartEditor").val();
        if( contenteval == ""  || contenteval == null || contenteval == '&nbsp;' || contenteval == '<p>&nbsp;</p>' || contenteval == '<br>')  {
            alert("공모요강: 필수 입력항목 입니다");
            $("#smartEditor").focus();
            oEditors.getById["smartEditor"].exec("FOCUS");
            return;
        }
        if(!$('input[name=contestperson]').val()){
			alert("담당자: 필수 입력항목 입니다");
			$('input[name=contestperson]').focus();
			return;
		}
        var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        if(!$('input[name=email1]').val()){
			alert("이메일: 필수 입력항목 입니다");
			$('input[name=email1]').focus();
			return;
		}
        if(!$('input[name=email2]').val()){
			alert("이메일: 필수 입력항목 입니다");
			$('input[name=email2]').focus();
			return;
		}
		var email = document.getElementById("email1").value+"@"+document.getElementById("email2").value;
        if(!emailRule.test(email)){
        	alert('올바르지 않은 이메일입니다.');
        	$('input[name=email2]').focus();
			return;
		}
		document.getElementById("contestemail").value = email;
		console.log($('#phone1 > option:selected').val());
		if($('#phone1 > option:selected').val()=="----") {			
		    alert("연락처를 확인해 주세요");
		    return;
		}
		if(!$('input[name=phone2]').val()){
			alert("연락처를 확인해 주세요");
			$('input[name=phone2]').focus();
			return;
		}
		if(!$('input[name=phone3]').val()){
			alert("연락처를 확인해 주세요");
			$('input[name=phone3]').focus();
			return;
		}
		var phone = document.getElementById("phone1").value+"-"+document.getElementById("phone2").value+"-"+document.getElementById("phone3").value;

		var contestfieldb = [];
		var contesttargetb = [];
		var	contestcompanyb = [];
		var	contestrewardb = [];
		
		for(var i=0; i<document.getElementsByName("contestfieldb").length; i++){
			if(document.getElementsByName("contestfieldb")[i].checked == true){
					contestfieldb.push(document.getElementsByName("contestfieldb")[i].value);
				}
		}
		for(var i=0; i<document.getElementsByName("contesttargetb").length; i++){
			if(document.getElementsByName("contesttargetb")[i].checked == true){
					contesttargetb.push(document.getElementsByName("contesttargetb")[i].value);
				}
		}
		for(var i=0; i<document.getElementsByName("contestcompanyb").length; i++){
			if(document.getElementsByName("contestcompanyb")[i].checked == true){
					contestcompanyb.push(document.getElementsByName("contestcompanyb")[i].value);
				}
		}
		for(var i=0; i<document.getElementsByName("contestrewardb").length; i++){
			if(document.getElementsByName("contestrewardb")[i].checked == true){
					contestrewardb.push(document.getElementsByName("contestrewardb")[i].value);
				}
		}
		
		var contestfield = contestfieldb.join(',');
		var contesttarget = contesttargetb.join(',');
		var	contestcompany = contestcompanyb.join(',');
		var	contestreward = contestrewardb.join(',');

		document.getElementById("contestfield").value = contestfield;
		document.getElementById("contesttarget").value = contesttarget;
		document.getElementById("contestcompany").value = contestcompany;
		document.getElementById("contestreward").value = contestreward;
		document.getElementById("contestphone").value = phone;
		
		
		
		document.getElementById("frm").submit();
	}
	$(document).ready(function(){
		  $("#poster").on('change', function(){ 
		      var cur=$("#poster").val().split('/').pop().split('\\').pop();
		    $("#postername").val(cur);
		  });
		  $("#file").on('change', function(){ 
		      var cur=$("#file").val().split('/').pop().split('\\').pop();
		    $("#filename").val(cur);
		  }); 
	}); 
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />
	<div class="menu-box">
	<div class="container">
	<div class="contest-insert">
	<form action="updateContest.do" method="post" id="frm" enctype="multipart/form-data">
	<sup><span style="color: #d65106; font-size: 14px; font-weight: 600;">*</span> 필수 입력항목</sup>
	<ul class="write-list">
		<li>
			<span class="tit">
				공모전명
				<span class="need">*</span>
			</span>
			<span class="ipt long">
				<input type="text" name="contestname" value="${contest.contestname }">
			</span>
		</li>
		<li>
			<span class="tit">
				주최사
				<span class="need">*</span>
			</span>
			<span class="ipt">
				<input type="text" name="contestagent" value="${contest.contestagent }">
			</span>
			<span class="ipt bold">
				주관사
			</span>
			<span class="ipt">
				<input type="text" name="contestsupervision" value="${contest.contestsupervision }">
			</span>
			<span class="ipt bold">
				후원/협찬
			</span>
			<span class="ipt">
				<input type="text" name="contesupport" value="${contest.contesupport }">
			</span>
		</li>
		<li>
			<span class="tit">
				공모분야
				<span class="need">*</span>
			</span>
			<div class="notice-bg">분야별</div>
				<div class="write-kind-area">
					<span><input type="checkbox" name="contestfieldb" value="기획/아이디어"> 기획/아이디어</span>	
					<span><input type="checkbox" name="contestfieldb" value="광고/마케팅"> 광고/마케팅</span>	
					<span><input type="checkbox" name="contestfieldb" value="논문/리포트"> 논문/리포트</span>	
					<span><input type="checkbox" name="contestfieldb" value="영상/UCC/사진"> 영상/UCC/사진</span>	
					<span><input type="checkbox" name="contestfieldb" value="디자인/캐릭터/웹툰"> 디자인/캐릭터/웹툰</span>	
					<span><input type="checkbox" name="contestfieldb" value="웹/모바일/플래시"> 웹/모바일/플래시</span>	
					<span><input type="checkbox" name="contestfieldb" value="게임/소프트웨어"> 게임/소프트웨어</span>	
					<span><input type="checkbox" name="contestfieldb" value="과학/공학"> 과학/공학</span>	
					<span><input type="checkbox" name="contestfieldb" value="문학/글/시나리오"> 문학/글/시나리오</span>	
					<span><input type="checkbox" name="contestfieldb" value="건축/건설/인테리어"> 건축/건설/인테리어</span>	
					<span><input type="checkbox" name="contestfieldb" value="네이밍/슬로건"> 네이밍/슬로건</span>	
					<span><input type="checkbox" name="contestfieldb" value="예체능/미술/음악"> 예체능/미술/음악</span>	
					<span><input type="checkbox" name="contestfieldb" value="대외활동/서포터즈"> 대외활동/서포터즈</span>	
					<span><input type="checkbox" name="contestfieldb" value="봉사활동"> 봉사활동</span>	
					<span><input type="checkbox" name="contestfieldb" value="취업/창업"> 취업/창업</span>	
					<span><input type="checkbox" name="contestfieldb" value="해외"> 해외</span>	
					<span><input type="checkbox" name="contestfieldb" value="기타"> 기타</span>	
					<input type="hidden" name="contestfield" id="contestfield" value="">
				</div>
			<div class="notice-bg">응시대상자</div>
				<div class="write-kind-area">
					<span><input type="checkbox" name="contesttargetb" value="제한없음"> 제한없음</span>
					<span><input type="checkbox" name="contesttargetb" value="일반인"> 일반인</span>
					<span><input type="checkbox" name="contesttargetb" value="대학생"> 대학생</span>
					<span><input type="checkbox" name="contesttargetb" value="청소년"> 청소년</span>
					<span><input type="checkbox" name="contesttargetb" value="어린이"> 어린이</span>
					<span><input type="checkbox" name="contesttargetb" value="기타"> 기타</span>
					<input type="hidden" name="contesttarget" id="contesttarget" value="">
				</div>
			<div class="notice-bg">주최사</div>
				<div class="write-kind-area">
					<span><input type="checkbox" name="contestcompanyb" value="정부/공공기관"> 정부/공공기관</span>	
					<span><input type="checkbox" name="contestcompanyb" value="공기업"> 공기업</span>	
					<span><input type="checkbox" name="contestcompanyb" value="대기업"> 대기업</span>	
					<span><input type="checkbox" name="contestcompanyb" value="신문/방송/언론"> 신문/방송/언론</span>	
					<span><input type="checkbox" name="contestcompanyb" value="외국계기업"> 외국계기업</span>	
					<span><input type="checkbox" name="contestcompanyb" value="중견/중소/벤처기업"> 중견/중소/벤처기업</span>	
					<span><input type="checkbox" name="contestcompanyb" value="비영리/협회/재단"> 비영리/협회/재단</span>	
					<span><input type="checkbox" name="contestcompanyb" value="해외"> 해외</span>	
					<span><input type="checkbox" name="contestcompanyb" value="기타"> 기타</span>
					<input type="hidden" name="contestcompany" id="contestcompany" value="">	
				</div>
			<div class="notice-bg">시상내역</div>
				<div class="write-kind-area">
					<span><input type="checkbox" name="contestrewardb" value="5천만원이상"> 5천만원이상</span>	
					<span><input type="checkbox" name="contestrewardb" value="5천만원~3천만원"> 5천만원~3천만원</span>	
					<span><input type="checkbox" name="contestrewardb" value="3천만원~1천만원"> 3천만원~1천만원</span>	
					<span><input type="checkbox" name="contestrewardb" value="1천만원이하"> 1천만원이하</span>	
					<span><input type="checkbox" name="contestrewardb" value="취업특전"> 취업특전</span>	
					<span><input type="checkbox" name="contestrewardb" value="입사시가산점"> 입사시가산점</span>	
					<span><input type="checkbox" name="contestrewardb" value="인턴채용"> 인턴채용</span>	
					<span><input type="checkbox" name="contestrewardb" value="정직원채용"> 정직원채용</span>	
					<span><input type="checkbox" name="contestrewardb" value="기타"> 기타</span>	
				</div>
			<input type="hidden" name="contestreward" id="contestreward" value="">
		</li>
		<li>
			<span class="tit">
				접수기간
				<span class="need">*</span>
			</span>
			<span class="ipt">
				<input type="date" name="conteststart" value="${contest.conteststart }">
			</span>
			<span class="ipt"> 
				 ~ 
			</span>
			<span class="ipt">
				<input type="date" name="contestend" value="${contest.contestend }">
			</span>
		</li>
		<li>
			<span class="tit">
				공모요강
				<span class="need">*</span>
			</span>
			<div class="ta-area">
				<textarea name="contestcontent" id="smartEditor">${contest.contestcontent }</textarea>
				<script type="text/javascript">
					var oEditors = []; 
					nhn.husky.EZCreator.createInIFrame({ 
						oAppRef : oEditors, elPlaceHolder : "smartEditor",  
						sSkinURI : "se2/SmartEditor2Skin.html", 
						fCreator : "createSEditor2", 
						htParams : {
							bUseToolbar : true,
							bUseVerticalResizer : true,  
							bUseModeChanger : false 
						}
					});
					
				</script>
			</div>
		</li>
		<li>
			<span class="tit">
				포스터
			</span>
			<span class="filebox">
				<input type="text" class="upload-name" id="postername" value="">
  				<label for="poster">파일선택</label> 
  				<input type="file" name="poster" id="poster"  accept="image/*">  				
			</span>
		</li>
		<li>
			<span class="tit">
				첨부파일
			</span>
			<span class="filebox">
				<input type="text" class="upload-name" id="filename" value="">
  				<label for="file">파일선택</label> 
  				<input type="file" name="file" id="file">  				
			</span>
		</li>
		<li>
			<span class="tit">
				홈페이지
			</span>
			<span class="ipt long">
				<input type="text" name="contestpage" value="${contest.contestpage }">
			</span>
		</li>
		<li class="line">
			<span class="tit">
				담당자
				<span class="need">*</span>                        
			</span>
			<span class="ipt">
				<input type="text" name="contestperson" value="${contest.contestperson }">
			</span>
		</li>
		<li>
			<span class="tit">
				연락처
				<span class="need">*</span>
			</span>
			<span class="ipt">
				<select name="phone1" id="phone1">
				<option>----</option>
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
				<option value="0130">0130</option>
				<option value="02">02</option>
				<option value="031">032</option>
				<option value="032">032</option>
				<option value="033">033</option>
				<option value="041">041</option>
				<option value="042">042</option>
				<option value="043">043</option>				 
				<option value="043">043</option> 
				<option value="051">051</option> 
				<option value="052">052</option> 
				<option value="053">053</option> 
				<option value="054">054</option> 
				<option value="055">055</option> 
				<option value="061">061</option> 
				<option value="062">062</option> 
				<option value="063">063</option> 
				<option value="064">064</option> 
				<option value="070">070</option> 
				<option value="0502">0502</option> 
				<option value="0503">0503</option> 
				<option value="0505">0505</option> 
				<option value="0506">0506</option> 								
			</select>
			</span> -
			<span class="ipt">
				<c:set var="TextValue" value="${fn:split(contest.contestphone, '-')}"/>
				<input type="text" class="short" name="phone2" id="phone2" maxlength="4" onkeypress="onlyNumber();" value="${TextValue[1]}">
			</span> -
			<span class="ipt">
				<input type="text" class="short" name="phone3" id="phone3" maxlength="4" onkeypress="onlyNumber();" value="${TextValue[2]}"><input type="hidden" name="contestphone" id="contestphone" value="">
			</span>
		</li>
		<li>
			<span class="tit">
				이메일
				<span class="need">*</span>   
			</span>
			<span class="ipt">
			<c:set var="emailValue" value="${fn:split(contest.contestemail, '@')}"/>
				<input type="text" name="email1" id="email1" style="ime-mode:disabled" value="${emailValue[0] }">
			</span>
			@
			<span class="ipt">
				<input type="text" name="email2" id="email2" style="ime-mode:disabled " value="${emailValue[1] }">				
			</span>
			<span class="ipt">
				<select name="email_domain" id="email_domain" class="selectbox" onchange="selectemail()">
					<option value="gmail.com">구글(G메일)</option><option value="naver.com">네이버</option><option value="nate.com">네이트</option><option value="daum.net">다음(한메일)</option><option value="dreamwiz.com">드림위즈</option><option value="lycos.co.kr">라이코스</option><option value="yahoo.co.kr">야후! 코리아</option><option value="yahoo.com">야후! yahoo.com</option><option value="paran.com">파란닷컴</option><option value="hotmail.com">핫메일</option><option value="msn.com">MSN</option><option value="직접입력" selected="">직접입력</option>				</select>
				<script type="text/javascript">
				function selectemail() {
					var select = document.getElementById("email_domain");
					
					if (select.options[select.selectedIndex].value=="직접입력") {
						$("#email2").attr("readonly", false); 
						document.getElementById("email2").value = "";
					}else{
						$("#email2").attr("readonly", true);
						document.getElementById("email2").value = select.options[select.selectedIndex].value;
					}
				}
				try{
					var obj = $("#email_domain"); 
					if (obj.val()=="직접입력") {
						$("#email_name").attr("readonly", false); 
					}
				} catch (e) { }
				</script>
				<input name="ct_m_email" type="hidden" value="">
				<input type="hidden" name="contestemail" id="contestemail" value="">
				<input type="hidden" name="contestnum" value="${contest.contestnum }">
			</span>
		</li>
		
	</ul></form>
	<div class="agree-btn">		
		<input type="button" class="btn btn-sm btn-primary" value="수정" onclick="update();">
		<input type="button" class="btn btn-sm btn-primary" value="취소" onClick="location.href='contestDetail.do?contestnum=${contest.contestnum }'"></div>
		</div>

		</div></div>
		<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</body>
</html>

