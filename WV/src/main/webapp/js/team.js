//team js


let createTeam = (param) =>{
	if(param == null){
		toastr.warning("로그인이 필요합니다.", "로그인 필요!", {tiemOut: 5000});
		return false;
	}
	let form = document.getElementById("tcreateform");
	let teamname = document.getElementById("tn");
	//let teamintro = document.getElementById("#ti");
	if(teamname == null){
		toastr.warning("팀명을 입력해주세요.", "팀명 필요!", {tiemOut: 5000});
		teamname.focus();
		return false;
	}
	
	form.action = "teamcreate.do";
	form.submit();
};



