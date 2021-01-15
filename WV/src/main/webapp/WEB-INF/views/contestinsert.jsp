<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	request.setCharacterEncoding("UTF-8"); %>
<% 	response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function onlyNumber() {
		if(event.keyCode<48 || event.keyCode>57){
            event.returnValue=false;
         }
	}
	function selectemail() {
		var select = document.getElementById("email_domain");
		console.log(select);
		document.getElementById("email2").value = select.options[select.selectedIndex].value;
	}
	function insert() {
		var contestfieldb = [];
		var contesttargetb = [];
		var	contestcompanyb = [];
		var	contestrewardb = [];
		
		for(var i=0; i<document.getElementsByName("contestfieldb").length; i++){
			if(document.getElementsByName("contestfieldb")[i].checked == true){
					contestfieldb.push(document.getElementsByName("contestfieldb")[i].value);
					console.log(contestfieldb);
				}
		}
		for(var i=0; i<document.getElementsByName("contesttargetb").length; i++){
			if(document.getElementsByName("contesttargetb")[i].checked == true){
					contesttargetb.push(document.getElementsByName("contesttargetb")[i].value);
					console.log(contesttargetb);
				}
		}
		for(var i=0; i<document.getElementsByName("contestcompanyb").length; i++){
			if(document.getElementsByName("contestcompanyb")[i].checked == true){
					contestcompanyb.push(document.getElementsByName("contestcompanyb")[i].value);
					console.log(contestcompanyb);
				}
		}
		for(var i=0; i<document.getElementsByName("contestrewardb").length; i++){
			if(document.getElementsByName("contestrewardb")[i].checked == true){
					contestrewardb.push(document.getElementsByName("contestrewardb")[i].value);
					console.log(contestrewardb);
				}
		}
		
		var contestfield = contestfieldb.join(',');
		var contesttarget = contesttargetb.join(',');
		var	contestcompany = contestcompanyb.join(',');
		var	contestreward = contestrewardb.join(',');
		var phone = document.getElementById("phone1").value+"-"+document.getElementById("phone2").value+"-"+document.getElementById("phone3").value;
		var email = document.getElementById("email1").value+"@"+document.getElementById("email2").value;
		console.log(phone);
		document.getElementById("contestfield").value = contestfield;
		document.getElementById("contesttarget").value = contesttarget;
		document.getElementById("contestcompany").value = contestcompany;
		document.getElementById("contestreward").value = contestreward;
		document.getElementById("contestemail").value = email;
		document.getElementById("contestphone").value = phone;
		
		
		oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
		document.getElementById("frm").submit();
	}
</script>
</head>
<body>
	<form action="insertContest.do" method="post" id="frm" enctype="multipart/form-data">
		<p>공모전명 <input type="text" name="contestname"></p>
		<p>주최사 <input type="text" name="contestagent">
		     주관사 <input type="text" name="contestsupervision">
		     후원/협찬 <input type="text" name="contesupport"></p>
		<div>공모분야 <span>분야별</span><br>		
			<input type="checkbox" name="contestfieldb" value="1">기획/아이디어
			<input type="checkbox" name="contestfieldb" value="2">광고/마케팅	
			<input type="checkbox" name="contestfieldb" value="3">논문/리포트<br>	
			<input type="checkbox" name="contestfieldb" value="4">영상/UCC/사진	
			<input type="checkbox" name="contestfieldb" value="5">디자인/캐릭터/웹툰
			<input type="checkbox" name="contestfieldb" value="6">웹/모바일/플래시<br>	
			<input type="checkbox" name="contestfieldb" value="7">게임/소프트웨어	
			<input type="checkbox" name="contestfieldb" value="8">과학/공학
			<input type="checkbox" name="contestfieldb" value="9">문학/글/시나리오<br>	
			<input type="checkbox" name="contestfieldb" value="10">건축/건설/인테리어
			<input type="checkbox" name="contestfieldb" value="11">네이밍/슬로건	
			<input type="checkbox" name="contestfieldb" value="12">예체능/미술/음악<br>	
			<input type="checkbox" name="contestfieldb" value="13">대외활동/서포터즈	
			<input type="checkbox" name="contestfieldb" value="14">봉사활동
			<input type="checkbox" name="contestfieldb" value="15">취업/창업<br>	
			<input type="checkbox" name="contestfieldb" value="16">해외	
			<input type="checkbox" name="contestfieldb" value="17">기타	
			<input type="hidden" name="contestfield" id="contestfield" value="">		
		</div>	
		<div><span>응시대상자</span><br>
			<input type="checkbox" name="contesttargetb" value="1">제한없음
			<input type="checkbox" name="contesttargetb" value="2">일반인
			<input type="checkbox" name="contesttargetb" value="3">대학생<br>
			<input type="checkbox" name="contesttargetb" value="4">청소년
			<input type="checkbox" name="contesttargetb" value="5">어린이
			<input type="checkbox" name="contesttargetb" value="6">기타
			<input type="hidden" name="contesttarget" id="contesttarget" value="">
		</div>
		<div><span>주최사</span><br>
			<input type="checkbox" name="contestcompanyb" value="1">정부/공공기관
			<input type="checkbox" name="contestcompanyb" value="2">공기업
			<input type="checkbox" name="contestcompanyb" value="3">대기업<br>
			<input type="checkbox" name="contestcompanyb" value="4">신문/방송/언론
			<input type="checkbox" name="contestcompanyb" value="5">외국계기업
			<input type="checkbox" name="contestcompanyb" value="6">중견/중소/벤처기업<br>
			<input type="checkbox" name="contestcompanyb" value="7">비영리/협회/재단
			<input type="checkbox" name="contestcompanyb" value="8">해외
			<input type="checkbox" name="contestcompanyb" value="9">기타
			<input type="hidden" name="contestcompany" id="contestcompany" value="">
		</div>
		<div><span>시상내역</span><br>
			<input type="checkbox" name="contestrewardb" value="1">5천만원이상
			<input type="checkbox" name="contestrewardb" value="2">5천만원~3천만원
			<input type="checkbox" name="contestrewardb" value="3">3천만원~1천만원<br>
			<input type="checkbox" name="contestrewardb" value="4">1천만원이하
			<input type="checkbox" name="contestrewardb" value="5">취업특전
			<input type="checkbox" name="contestrewardb" value="6">입사시가산점<br>
			<input type="checkbox" name="contestrewardb" value="7">인턴채용
			<input type="checkbox" name="contestrewardb" value="8">정직원채용
			<input type="checkbox" name="contestrewardb" value="9">기타
			<input type="hidden" name="contestreward" id="contestreward" value="">
		</div>
		<p>접수기간 <input type="date" name="conteststart">~<input type="date" name="contestend"></p>
		<p>공모요강 <textarea name="contestcontent" id="smartEditor"></textarea></p>
		<p>포스터 <input type="file" name="file"></p>
		<p>첨부파일 <input type="file" name="poster"></p>
		<p>홈페이지 <input type="text" name="contestpage"></p>
		<hr>
		<p>담당자 <input type="text" name="contestperson"></p>
		<p>연락처
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
			</select>- 
			<input type="text" name="phone2" id="phone2" maxlength="4" onkeypress="onlyNumber();">-<input type="text" name="phone3" id="phone3" maxlength="4" onkeypress="onlyNumber();"><input type="hidden" name="contestphone" id="contestphone" value=""></p>
		<p>이메일 <input type="text" name="email1" id="email1">@<input type="text" name="email2" id="email2">
			<select name="email_domain" id="email_domain" onchange="selectemail()">
			<option value="gmail.com">구글(G메일)</option><option value="naver.com">네이버</option><option value="nate.com">네이트</option><option value="daum.net">다음(한메일)</option><option value="dreamwiz.com">드림위즈</option><option value="lycos.co.kr">라이코스</option><option value="yahoo.co.kr">야후! 코리아</option><option value="yahoo.com">야후! yahoo.com</option><option value="paran.com">파란닷컴</option><option value="hotmail.com">핫메일</option><option value="msn.com">MSN</option><option value="" selected="">직접입력</option></select>
			<input type="hidden" name="contestemail" id="contestemail" value="">
		</p>
		<hr>
		<div>주최사인터뷰 <span>주최사를 소개해주세요</span><br>
			<textarea rows="10" cols="40"></textarea>	
		</div>
		<div> <span>본 공모전의 취지 및 목적을 적어주세요</span><br>
			<textarea rows="10" cols="40"></textarea>	
		</div>	
		<div> <span>주최사가 원하는 공모작 형태 또는 예시는</span><br>
			<textarea rows="10" cols="40"></textarea>	
		</div>	
		<div> <span>심사과정 중 가장 중요시 하는 요소는?</span><br>
			<textarea rows="10" cols="40"></textarea>	
		</div>
		<div> <span>공모전 도전자들에게 전하고 싶은 말은?</span><br>
			<textarea rows="10" cols="40"></textarea>	
		</div>
		
		<hr>
		<div>개인정보 수집 및 이용에 대한 안내</div>		
		<div>1. 수집 개인정보 항목 : 담당자명, 메일 주소, 전화번호	</div>
		<div>2. 개인정보의 수집 및 이용목적 : 컨텐츠 등록에 따른 본인확인 및 원활한 의사소통 경로 확보</div>
		<div>3. 개인정보의 이용기간 : 공모전 기간 및 이용자의 조회를 위하여 보관되며 요청시 즉시 파기합니다.</div>
		<div>※ 공모전, 대외활동, 이벤트 등 등록은 무료이며 관리자 검수, 수정, 승인 후 등록됩니다.(내부 규정에 따라 등록되지 않을 수 있습니다.)</div>
		<span><input type="radio" name="agree" value="y">동의</span><span><input type="radio" name="agree" value="n">동의하지 않음</span>
		<br><div>
		<input type="button" value="등록" onclick="insert();">
		<input type="button" value="취소">
		</div>
		</form>
		<script type="text/javascript">
		var oEditors = []; 
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors, elPlaceHolder : "smartEditor", 
				sSkinURI : "se2/SmartEditor2Skin.html",
				fCreator : "createSEditor2", 
				htParams : { 
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseToolbar : true, 
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseVerticalResizer : true, 
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseModeChanger : false 
					} 
			});			
		</script>
</body>
</html>

