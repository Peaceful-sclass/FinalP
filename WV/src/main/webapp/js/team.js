//team js
//window.addEventListener("load",()=>{
//}, false);

let createTeam = (param) =>{
	if(param.dataset['mid'] == null||param.dataset['mid'] == ""||param.dataset['mid'] == undefined){
		toastr.warning("로그인이 필요합니다.", "로그인 필요!", {tiemOut: 5000});
		return false;
	}
	let form = document.getElementById("tcreateform");
	let teamname = document.getElementById("tn");
	//let teamintro = document.getElementById("#ti");
	if(teamname.value == null ||teamname.value == "" ||teamname.value == undefined ){
		toastr.warning("팀명을 입력해주세요.", "팀명 필요!", {tiemOut: 5000});
		teamname.focus();
		return false;
	}
	
	form.action = "teamcreate.do";
	form.submit();
};

let teamCreateBT = (param)=>{
	location.href="teamcreateBT.do?member_id="+param.dataset['mid'];
};

let teamIcon = (param)=>{
	$.ajax({
		type: 'post',
		url: "teamicon.do",
		data: JSON.stringify({team_no:param.dataset['tno'], team_name:param.dataset['tname']}),
		contentType: "application/json",
		success: function(rt){
			toastr.info(param.dataset['tname']+"팀을 선택했습니다.", "팀선택", {tiemOut: 5000});
			//location.reload();
			console.log("rt: "+rt.team_no);
			window.sessionStorage.removeItem("teamInfo");
			window.sessionStorage.setItem("teamInfo", rt.team_no);//리턴받은 값을 임시로 클라세션에 전달해준다.
			//window.sessionTeamInfo = window.sessionStorage.getItem("teamInfo");
			teamSelectionCSS();//css후처리함수
		},
		error: function(){
			toastr.error("인터넷 상태가 양호하지 않습니다.", "인터넷에러", {tiemOut: 5000});
			console.log("param.dataset['tname']: "+param.dataset['tname']);
		}
	});
};

//선택된 팀 CSS 변경함수
let teamSelectionCSS = (basicteamno)=>{
	let currTeamno = window.sessionStorage.getItem("teamInfo");
  console.log("[teamSelectionCSS]currTeamno: "+currTeamno);
	//기본팀선택CSS적용
	if(currTeamno==null||currTeamno==""||currTeamno==undefined){
		let whytext = document.querySelector("[data-tno=\'"+basicteamno+"\']");
		//let whytext = basictg.parentNode.parentNode;
		whytext.classList.add("teamselection");
		window.sessionStorage.setItem("teamInfo", basicteamno);
		return false;		
		//let basictg = $("[data-tno="+basicteamno+"]");
		//let whytext = basictg.parent().parent();
		//whytext.addClass("teamselection");
		//whytext.css({"border":"1px solid black"});
	}
	//현재선택팀의 css를 변경 
	if(currTeamno != null||currTeamno != ""||currTeamno != undefined){
		let allwhytext = document.getElementsByClassName("why-text");
		for(let i=0; i<allwhytext.length; i++){
			allwhytext[i].classList.remove("teamselection");
		}
		//let tg = document.querySelector("a[data-tno="+currTeamno+"]");
		//whytext = tg.parentNode.parentNode;
		//whytext.classList.add("teamselection");
		let whytext = $("[data-tno="+currTeamno+"]");
		//whytext = tg.parent().parent();
		whytext.addClass("teamselection");
	}
};

//사이드메뉴바 이동명령이 post일시 실행함수
let sidePost = (url,memberno)=>{
	$.ajax({
		type: 'post',
		url: url+'?member_no='+memberno,
		success: function(){
			
		},
		error:function(){
			toastr.error("인터넷상태를 확인해주세요.", "인터넷에러!", {tiemOut: 5000});
		}
	});
};


let teamInviteBT = (param)=>{ //팀메인의 버튼
	let currTeam = sessionStorage.getItem("teamInfo");
	console.log("currTeam: "+currTeam);
	if(param.dataset['mid'] == null||param.dataset['mid'] == ""||param.dataset['mid'] == undefined){
		toastr.warning("로그인을 해주십시오.", "로그인 필요!", {tiemOut: 5000});
		setTimeout(()=>{
			location.href="homd.do";
		},1500);
		return false;
	} else if(currTeam == null||currTeam == ""||currTeam == undefined){
		toastr.warning("팀을 먼저 선택해주세요.", "팀선택 필요!", {tiemOut: 5000});
		return false;
	}
	$.ajax({ //currId,teamno
		type: 'get',
		url: 'chkteamLD.do?member_id='+param.dataset['mid']+'&team_no='+currTeam,
		success: function(rt){
			if(rt==0){
				toastr.warning("팀장만이 팀원을 초대할 수 있습니다.", "초대불가", {tiemOut: 5000});
			} else if(rt==1){
				$("#invitemodal").modal("show");				
			}
		},error: function(){
			toastr.error("인터넷연결을 확인해주세요.", "통신에러!", {tiemOut: 5000});
		}
	});
};

let teamInviteSend = (param)=>{ //초대모달의 버튼
	let toID = document.getElementById("iv-modal-input").value;
	$.ajax({
		type: 'post',
		url: 'invite.do?member_id='+toID,
		success: function(rt){
			if(rt>0){
				toastr.error(toID+"님은 팀원이거나 이미 초대한 사람입니다.", "초대불가!", {tiemOut: 5000});
			}else{
				$("#invitemodal").modal("hide");				
				toastr.success(toID+"님에게 초대메일을 보냈습니다.", "초대장발송!", {tiemOut: 5000});
			}
		},error:function(){
			toastr.error("인터넷상태를 확인해주세요.", "인터넷에러!", {tiemOut: 5000});
		}
	});
};


//팀정보 버튼누르면 팀원목록
let teamManageBT = (param)=>{
  $("#managemodal").modal('show');
  $('body').css("overflow", "hidden");
  let currTeam = sessionStorage.getItem("teamInfo");
  let currTeamName = sessionStorage.getItem("teamName");
  $('#mmTeamNamebt').text(currTeamName);
  let teamdata = {
      team_no: currTeam,
      member_id: param.dataset['mid']
  };
  $.ajax({
    type: "post",
    url: "teamManage.do",
    data: JSON.stringify(teamdata),
    contentType: "application/json",
    dataType:"json",
    success:function(rt){ //팀멤버로드
        //$(form).append($('<input/>', {type: 'hidden', name: 'title', value:$(title).val() }));
        let LD = chkteamLD(teamdata.member_id,currTeam);
        if(LD != 1){//팀원
          $("thead>tr>th:eq(0)").hide();
          $("#mmCdbt").hide();
          let code;
	        for(let i=0; i<rt.length; i++){
		        code+= '<tr><td>'+rt[i].member_id+'</td>';
	          code+= '<td>'+rt[i].grade_inteam+'</td></tr>';
	        } 
          $("tbody").html(code);
            
        } else{//팀장일경우 ui추가변경
          $("thead>tr>th:eq(0)").show();
          $("#mmCdbt").show();
          let code;
	        for(let i=0; i<rt.length; i++){
            if(rt[i].grade_inteam=="팀장"){
		          code+='<tr> <td> </td>';
		          code+= '<td>'+rt[i].member_id+'</td>';
	            code+= '<td>팀장</td></tr>';
            }else if(rt[i].grade_inteam=="매니저"){
			        code+='<tr> <td> <input type="checkbox" name="tmchkbox" value='+rt[i].member_no+' /> </td>';
			        code+= '<td>'+rt[i].member_id+'</td>';
	            code+= '<td> <select name="grade_inteam">';
		          code+= '<option value="매니저" selected>매니저</option>';
		          code+= '<option value="팀원">팀원</option> </select></td></tr>';
            }else{
			        code+='<tr> <td> <input type="checkbox" name="tmchkbox" value='+rt[i].member_no+' /> </td>';
			        code+= '<td>'+rt[i].member_id+'</td>';
	            code+= '<td> <select name="grade_inteam">';
		          code+= '<option value="매니저">매니저</option>';
		          code+= '<option value="팀원" selected>팀원</option> </select></td></tr>';
            }
	        } 
          $("tbody").html(code);
          $("select[name=grade_inteam]").val();
          
          
        }
    },
    error: function(){
			toastr.error("인터넷상태를 확인해주세요.", "인터넷에러!", {tiemOut: 5000});
    }
  });
  
};


//팀장체크 rt=1 :팀장
let chkteamLD =(currid, teamno)=>{
  let rt2;
  $.ajax({ //currId,teamno
    type: 'get',
    url: 'chkteamLD.do?member_id='+currid+'&team_no='+teamno,
    async: false,
    success: function(rt){
        rt2 = rt;
    },error: function(){
      toastr.error("인터넷연결을 확인해주세요.", "통신에러!", {tiemOut: 5000});
    }
  });
  console.log("chkteamLD rt: "+rt2);
  return rt2;
};






