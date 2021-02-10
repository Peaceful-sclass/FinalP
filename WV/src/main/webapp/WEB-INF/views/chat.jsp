
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">

<style type="text/css">
.container{max-width:600px; margin:auto;}
img{ max-width:100%;}

.inbox_msg {
  border: 1px solid #c4c4c4;
  clear: both;
  overflow: hidden;
}

.incoming_msg_img {
  display: inline-block;
  width: 6%;
}
.received_msg {
  display: inline-block;
  padding: 0 0 0 10px;
  vertical-align: top;
  width: 92%;
 }
 .received_withd_msg p {
  background: #ebebeb none repeat scroll 0 0;
  border-radius: 3px;
  color: #646464;
  font-size: 14px;
  margin: 0;
  padding: 5px 10px 5px 12px;
  width: 100%;
}
.time_date {
  color: #747474;
  display: block;
  font-size: 12px;
  margin: 8px 0 0;
}
.received_withd_msg { width: 57%;}
.mesgs {
  float: left;
  padding: 30px 15px 0 25px;
  width: 100%;
}

 .sent_msg p {
  background: #05728f none repeat scroll 0 0;
  border-radius: 3px;
  font-size: 14px;
  margin: 0; color:#fff;
  padding: 5px 10px 5px 12px;
  width:100%;
}
.outgoing_msg{ overflow:hidden; margin:26px 0 26px;}
.sent_msg {
  float: right;
  width: 46%;
}
.input_msg_write input {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  color: #4c4c4c;
  font-size: 15px;
  min-height: 48px;
  width: 100%;
}

.type_msg {border-top: 1px solid #c4c4c4;position: relative;}
.msg_send_btn {
  background: #05728f none repeat scroll 0 0;
  border: medium none;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  font-size: 17px;
  height: 33px;
  position: absolute;
  right: 0;
  top: 11px;
  width: 33px;
}
.messaging { padding: 0 0 50px 0;}
.msg_history {
  height: 516px;
  overflow-y: auto;
}</style>


<script type="text/javascript">


var date = 0;
$(document).ready(function() {
	$("#content").keydown(function(key) {
		if(key.keyCode == 13){
			msg_send_btn_click();
		}
	});
	
	setInterval(readAjax, 300);
	
	scrollDown();
	
	var d= new Date();
	date = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
});

function msg_send_btn_click() {
    
    var data = {};
    
    data["chatting_no"] = $("#chatting_no").val();
    data["member_id"] = $("#member_id").val();
    data["content"] = $("#content").val();
    
	
    //console.log(data);
    
    $.ajax({
    	contentType : 'application/json',
    	url : 'msg_send.do',
    	data : JSON.stringify(data),
    	type : 'post',
    	dataType : 'json',
    	success : function() {
    		
		},
		error : function(){
			
		}
    });
    
    $("#content").val('');

}

function readAjax(){
	var loginid= $("#member_id").val();
	var chatting_no = $("#chatting_no").val();
    
	//console.log(date);
    var data = {};
    
    data["chatting_no"] = chatting_no;
    data["date"] = date;
    
    $.ajax({
    	contentType : 'application/json',
    	url : 'read_ajax.do',
    	data : JSON.stringify(data),
    	type : 'post',
    	dataType : 'json',
    	success : function(data) {
    		//console.log(data.length);
    		
    		//console.log("chatting_no: "+ chatting_no);
    		//console.log("team_no:"+data[0].team_no);
    		console.log("id = "+data[0].member_id);
    		
    		if(loginid != data[0].member_id){
    			CloseWindow();
    		}
    		
    		if(data.length == 1){
    			
    			return;
    		}else{
    			
    			for(var i=1; i<data.length; i++){
    				if(data[i].member_id == loginid){
    					$(".msg_history").append(
    						"<div class='outgoing_msg'>"+
  				              "<div class='sent_msg'>"+
  				                "<p>"+data[i].content+"</p>"+
  				                "<span class='time_date'>"+data[i].regdate+"</span> </div>"+
  				            "</div>"
    					);
    					
    				}else{
    					$(".msg_history").append(
    						"<div class='incoming_msg'>"+
  				              "<div class='incoming_msg_img'> <img src='"+data[i].member_photo+"' alt='sunil'> </div>"+data[i].member_id+
  				              "<div class='received_msg'>"+
  				                "<div class='received_withd_msg'>"+
  				                  "<p>"+data[i].content+"</p>"+
  				                  "<span class='time_date'>"+data[i].regdate+"</span></div>"+
  				              "</div>"+
  				            "</div>"
    					);
    				}	
    				scrollDown();
    			}
    			var d= new Date();
				date = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();	
    		}
    		
		},
		error : function(){
			CloseWindow();
		}
    });
    
    
    
    
}

function scrollDown(){
	$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
}

function CloseWindow(){
	//window.colse();
	self.close();
	//window.opener = window.location.href; self.close();
	//window.open('about:blank','_self').close();
}



</script>

<title>Insert title here</title>
</head>
<body>

<div class="container">
<h3 class="text-center"><c:out value="${teamInfo.team_name } 채팅방"></c:out></h3>
<div class="messaging">

      <div class="inbox_msg"> 
        <div class="mesgs">
          <div class="msg_history">
          
          <!--  
            <div class="incoming_msg">
              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div> 이름임
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p>Test which is a new approach to have all
                    solutions</p>
                  <span class="time_date"> 11:01 AM    |    June 9</span></div>
              </div>
            </div>
            
            
            <div class="outgoing_msg">
              <div class="sent_msg">
                <p>Test which is a new approach to have all
                  solutions</p>
                <span class="time_date"> 11:01 AM    |    June 9</span> </div>
            </div>
            -->
            
            <c:forEach items="${chatList}" var = "chatList">
            
            <c:set var="id" value="${chatList.member_id}"></c:set>
            <c:set var="loginid" value="${member.member_id }"></c:set>
            	<c:choose>
            		
            		<c:when test="${id eq loginid }">
            			<div class="outgoing_msg">
			              <div class="sent_msg">
			                <p><c:out value="${chatList.content}"></c:out></p>
			                <span class="time_date"><fmt:formatDate value="${chatList.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/></span> </div>
			            </div>
            		</c:when>
            		
            		<c:otherwise>
            			<div class="incoming_msg">
            			
            			
            			
			              <div class="incoming_msg_img">
			              <c:choose>
			              <c:when test="${empty chatList.member_photo }">
			              <img alt="sunil" src="images/user-profile.png">
			              </c:when>
			              <c:otherwise>
			               <img src="${chatList.member_photo }" alt="sunil"> 
			               </c:otherwise>
			               </c:choose>
			               </div> 
			               <c:out value="${chatList.member_id}"></c:out>
			              <div class="received_msg">
			                <div class="received_withd_msg">
			                  <p><c:out value="${chatList.content}"></c:out></p>
			                  <span class="time_date"><fmt:formatDate value="${chatList.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/></span></div>
			              </div>
			            </div>
            		</c:otherwise>
            	
            	</c:choose>
            
            </c:forEach>
            
          </div>
          
          <div class="type_msg">
            <div class="input_msg_write">
            	<!-- 들어온 채팅방번호,아이디 넣어줌 -->
            	<input type="hidden" id="chatting_no" value="${teamInfo.team_no }">
            	<input type="hidden" id="member_id" value="${member.member_id }">
            	
              <input type="text" id="content" class="write_msg" placeholder="메시지를 입력하세요." />
              <button class="msg_send_btn" type="button" id="sendBtn" onclick="msg_send_btn_click();" ><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
              
            </div>
          </div>
          
        </div>
      </div>
      
    
      
    </div></div>



</body>
</html>