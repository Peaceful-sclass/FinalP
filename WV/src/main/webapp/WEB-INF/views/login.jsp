<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#loginChk").hide();
	});
	function login() {
        var memberid= $("#memberid").val().trim();
        var memberpw= $("#memberpw").val().trim();
	    console.log(memberid+"/"+memberpw);
	    
	    var loginVal = {
	    	"memberid":memberid,
	    	"memberpw":memberpw
	    };
	    
	    if(memberid==null || memberid=="" ||memberpw==null||memberpw==""){
	    	alert("ID �� pw�� Ȯ���� �ּ���");
	    }else{
	    	$.ajax({
	    		type:"post",
	    		url:"ajaxlogin.do",
	    		data:JSON.stringify(loginVal),
	    		contentType:"application/json",
	    		dataType:"json",
	    		success:function(msg){
	    			if(msg.check==true){
	    				location.href="list.do";
	    			}else{
                       alert("�߸�");
                       $("#loginChk").show();
                       $("#loginChk").html("ID Ȥ�� PW�� �߸��Ǿ����ϴ�.");
	    			}
	    		},
	    		error:function(){
	    			alert("��Ž���");
	    		}
	    		
	    	});
	    }
	}
</script>
</head>
<body>
	<table>
		<tr>
			<th>ID</th>
			<td><input type="text" id="memberid"></td>
		</tr>
		<tr>
			<th>PW</th>
			<td><input type="password" id="memberpw"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="login"
				onclick="login();"></td>
		</tr>
		<tr>
			<td colspan="2" align="center" id="loginChk"></td>
		</tr>
	</table>
</body>
</html>