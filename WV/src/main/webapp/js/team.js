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
		success: function(){
			toastr.info(param.dataset['tname']+"팀을 선택했습니다.", "팀선택", {tiemOut: 5000});
		},
		error: function(){
			toastr.error("인터넷 상태가 양호하지 않습니다.", "인터넷에러", {tiemOut: 5000});
			console.log("param.dataset['tname']: "+param.dataset['tname']);
		}
	});
};

let sidePost = (url,memberno)=>{
	$.ajax({
		type: 'post',
		url: url+'?member_no='+memberno,
		success: function(){},
		error:function(){
			toastr.error("인터넷상태를 확인해주세요.", "인터넷에러!", {tiemOut: 5000});
		}
	});
};



