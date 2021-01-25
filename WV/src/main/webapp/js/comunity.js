window.addEventListener("load", function() {



}, false) ;

function selectcategory(select){ //안씀..
    select.submit();
    return false;
};

/*let titleClick = function(){ //테이블폼 제출용
    //let form = document.tableform1;
    //form.action;
	let form = document.getElementsByName("tableform1")[0];
    form.submit();
};*/

let cmpageChange = function(param){ 
    if(param.getAttribute("name") == "selectform1"){//category 폼 단독 전달용
        param.submit();
        return false;
    }
    
	//paging a tag들의 정보를 currentPage tag에 넣어주는 곳
    let currentPage = document.getElementsByName("currentPage")[1];
    if(param.getAttribute("name") == "prev" || param.getAttribute("name") == "next"){
        currentPage.value = param.getAttribute("value");
        console.log(currentPage.value);
    } else if (param.tagName == 'A'){
        currentPage.value = param.getAttribute("value");//page번호링크
        console.log(currentPage.value);
        //param.classList.add('test1css');
        // $(param).css({ color: "red", "background-color":"blue" });
    } 
    
    
    //검색카테고리정보 폼에 추가
    //let searchsel = document.querySelector("input[name=searchsel]");
	//let tmp = document.querySelector("input[name=searchselect]");
	let searchsel = document.getElementsByName("searchsel")[0];
	let tmp = document.getElementsByName("searchselect")[0];
	let tmp2 = tmp.options[tmp.selectedIndex].value; 
    searchsel.value = tmp2; 
    searchWord(); //검색단어추가

    let form = document.getElementsByName("cmpagechange")[0];
    form.submit(); //category,currentPage,searchsel (prev,next)
                   //word

};

//검색단어 폼에 추가
let searchWord = () => { 
    let sel = document.getElementsByName("searchselect")[0];
    let selval = sel.options[sel.selectedIndex].value;
    let wordval = document.getElementsByName("word")[0].value;
    let category = document.getElementsByName("category")[0].value;
    // let form = document.getElementsByName("searchform")[0];
    let form = document.getElementsByName("cmpagechange")[0];
    
    let ip = document.createElement('input');

    let ip1 = ip.cloneNode();	//select-search value 안씀..
	ip1.setAttribute("type","hidden");
    ip1.setAttribute("name","select");
    ip1.setAttribute("value", selval);
    
    let ip2 = ip.cloneNode();	//검색 단어 -- 현재 사용하는 것 이거 하나
	ip2.setAttribute("type","hidden");
    ip2.setAttribute("name","word");
    ip2.setAttribute("value", wordval);

    let ip3 = ip.cloneNode();	//게시판 종류 카테고리 값 
	ip3.setAttribute("type","hidden");//cmpageChange에 합친다면겹침노필요
    ip3.setAttribute("name","category");
    ip3.setAttribute("value", category); 
    
    let ip4 = ip.cloneNode();	//현재페이지 값
	ip4.setAttribute("type","hidden");//cmpageChange에 합친다면겹침노필요
    ip4.setAttribute("name","currentPage");
    ip4.setAttribute("value", $("input[name='currentPage']:eq(1)").val());

    let ip5 = ip.cloneNode();	//검색카테고리 값
	ip4.setAttribute("type","hidden");//cmpageChange에 합친다면 cmpagechange form의 같은 값을 변경해야함 겹치니깐
    ip4.setAttribute("name","searchsel");
    ip4.setAttribute("value", $("select[name='searchselect']").val());
    
    $(form).append(ip1).append(ip2);
    // form.submit();
};



///////////////writeform
let cmwrite = () => {
	let chkno = document.getElementById("memberno").value;
	if(chkno != null && chkno != "" && chkno != undefined ){
		console.log("chkno: "+chkno);
	} else{
		toastr.error("글쓰기 전에 로그인을 해주세요.", "로그인 필요!", {timeOut: 5000});
		return false;
	}
	
    let cmd = window.location.pathname;
	let form = document.createElement("form");
	let input = document.createElement("input");
	let content = quill.root.innerHTML;
	form.method = "get";
	input.type = "hidden";
	input.name = "content";
    input.value= content; //내용

    if(cmd === "/root/cmwriteform.do"){		//cm글쓰기폼
        //toastr.info("", cmd, {timeOut: 5000});
		form.action = "cmwrite.do";
    } else if(cmd === "/root/cmupdateform.do"){ //cm글수정폼
        //toastr.info("", cmd, {timeOut: 5000});
		form.action = "cmupdate.do";
		$(form).append($('#cno')); //수정폼일때만 글번호input(hidden)를 추가해준다. 필요없을 시 bind exception뜸.
    }
	
	//제목
	form.append(input);
	let title = document.querySelector(".dv-subject");
	console.log("title :"+title.value);
	$(form).append($('<input/>', {type: 'hidden', name: 'title', value:$(title).val() }));
	//카테고리,회원,글번호
	let category = document.querySelector("select[name=category]").value;
	console.log("category: "+category);
	$('#category').val(category); //input tag category value 변경
	$(form).append($('#memberid')).append($('#memberno')).append($('#category'));
	
	//검증절차
	document.body.appendChild(form);
	
	if(title.value == null || title.value == "" || title.value == undefined){
		toastr.warning("제목을 입력해주세요.", "제목 필요!", {timeOut: 5000});
		title.focus();
		return false;
	} else if(category == null || category == "" || category == undefined){
		toastr.warning("카테고리를 선택해주세요.", "카테고리 필요!", {timeOut: 5000});
		document.querySelector("select[name=category]").focus();
        return false;
	}

	form.submit();
    return false;
	
};



/////// 목록의 글보기 Detail view

function titleClick(param) {
	$("#cmt").html("");
	console.log("param.dataset: "+param.dataset['cno']);
	$.ajax({
		type: "post",
		url: "cmdetail.do",
		data: JSON.stringify({cno:param.dataset['cno']}),
		contentType: "application/json",
		dataType: "json",
		beforeSend: function(){
            $("#dv-ct").removeClass('dv-toggle');
            $("tbody tr").removeClass("cm-selected cm-bold");
			document.documentElement.scrollTop = 0;
		},
		success: function(rt){ //제목,내용,시간,조회수,작성자
			$(".dv-subject").text(rt.dto.title);
            $(".dv-subject2").children().eq(1).text(rt.dto.member_id);
            console.log("rt.dto.regdate: "+rt.dto.regdate);
			$(".dv-subject2").children().eq(2).text(rt.dto.regdate);
			$(".dv-subject2").children().eq(4).text(rt.dto.views);
			$(".dv-content").html(rt.dto.content);
			
			//현재회원과 작성자가 동일하면 버튼추가
			if(param.dataset['mid'] === rt.dto.member_id){
				$(".dv-delbt.dv-toggle").removeClass("dv-toggle");
				document.querySelector("#delbt").dataset.cno = param.dataset['cno'];
				document.querySelector("#updatebt").dataset.cno = param.dataset['cno'];
			}
			cmtLoad(param,rt);
        },
        complete: function(){
            //$(param).addClass("cm-bold");
			//목록색,조회수 CSS업데이트
			if(param.textContent != "댓글"){
	            let sel = param.parentNode.parentNode;
				sel.classList.add("cm-selected","cm-bold");
	            let views = $(param).parent().siblings(":last");
	            let views2 = parseInt(views.text())+1;
				views.text(views2);
			}
			//댓글달기버튼에 글번호,현재id,no 추가
			let replybt = document.querySelector(".dv-reply-bt");
			let replycanclebt = document.querySelector(".dv-reply-canclebt");
			replybt.dataset['cno'] = param.dataset['cno'];
			replybt.dataset['mid'] = param.dataset['mid'];
			replybt.dataset['mno'] = param.dataset['mno'];
			replybt.dataset['cmtadd'] = "";
			replycanclebt.dataset['cno'] = param.dataset['cno'];
			replycanclebt.dataset['mid'] = param.dataset['mid'];
			replycanclebt.dataset['mno'] = param.dataset['mno'];
			replycanclebt.dataset['answerid'] = "";
        },
        error: function(){
            toastr.error("내용 로드에 실패했습니다.", "글읽기 실패", {timeOut: 5000});
        }
	});
}

//본글을  삭제
let deleteContent = (param) =>{
	$.ajax({
		type: "post",
		url: "cmdelete.do?cno="+param.dataset['cno'],
		success: function(){
			console.log("hihi?");
			if(arguments[0] > 0){
	            toastr.success("글을 삭제하였습니다.", "글삭제 성공", {timeOut: 5000});
			} else{
				toastr.warning("서버에 문제가 있습니다.", "글삭제 실패", {timeOut: 5000});
				alert("글삭제실패: 서버에 문제가 있습니다.");
			}
		},
		complete: function(){
			setTimeout(()=>{
				location.href="comunity.do?category=전체"
			}, 2000);
		},
		error: function(){
			toastr.error("인터넷 상태를 확인해주세요..", "글삭제 실패", {timeOut: 5000});
		}
	});
};


let updateContent = (param)=>{
	location.href = "cmupdateform.do?cno="+param.dataset['cno'];
};


let cmtLoad = (param, rt)=>{//해당글의 댓글로드 rt에서 댓글까지 같이 받아와야 된다.
	console.log(rt.cmt);
	if(rt.cmt != null){
		
		for(let i=0; i<rt.cmt.length; i++){
			let divT = document.createElement("div");
			let divD = document.createElement("div");
			let spanL = document.createElement("span");
			let spanC = document.createElement("span");
			let spanR = document.createElement("span");
			let aRepl = document.createElement("a");
			let aDel = document.createElement("a");
			//let divTcopy = divT.cloneNode();
			
			$(divT).addClass("dv-relative").appendTo("#cmt");
			$(divD).addClass("row dv-cmt-bg").appendTo(divT);
			$(spanL).addClass("dv-cmtL").appendTo(divD).text(rt.cmt[i].member_id);
			$(spanC).addClass("dv-cmt").appendTo(divD).text(rt.cmt[i].comcomment);
			$(spanR).addClass("dv-cmtR-date").appendTo(divD).text(rt.cmt[i].regdate);
			$(aRepl).addClass("dv-cmtR-repl").attr("data-cmtno",rt.cmt[i].comcmtno).attr("data-cmtcmd","1").attr('onclick',"cmtReply(this); return false;").attr('href', '#').text("답변").appendTo(divD);
			aRepl.dataset["mid"] = rt.cmt[i].member_id; //답변 시 넘겨줄 해당 댓글관련 정보들 추가.
			aRepl.dataset["mno"] = rt.cmt[i].member_no;
			aRepl.dataset["grpno"] = rt.cmt[i].comcmtgrpno;
			aRepl.dataset["cno"] = rt.cmt[i].cno;
			//자신의 글 검증 후 삭제 버튼추가
			if(param.dataset['mid'] === rt.cmt[i].member_id){//현로그인id:댓글id
				$(aDel).addClass("dv-cmtR-del").attr("data-cmtno",rt.cmt[i].comcmtno).attr("data-mid",param.dataset['mid']).attr("data-mno",param.dataset['mno']).attr("data-cno",param.dataset['cno']).attr("data-cmtcmd","2").attr('onclick',"cmtReply(this); return false;").attr('href', '#').text("삭제").appendTo(divD);
			}
		}
		
	}
	
};


let cmtReply = (param)=>{
	let answeredID = param.dataset['mid']; //댓글쓴 ID
	let cmtData = {
		"cno": param.dataset['cno'], 
		"comcmtno": param.dataset['cmtno'], 
		"member_no": param.dataset['mno'], 
		"member_id": param.dataset['mid'], 
		"comcomment": /*param.dataset['cmt'] +*/ document.querySelector("#dv-reply-ta").value,
		"comcmtgrpno": param.dataset['grpno'],
		"comcmtgroupno": param.dataset['cmtcmd']
	}
	console.log(cmtData);
	//로그인 검증
	if(cmtData.member_id == null || cmtData.member_id == "" || cmtData.member_id == undefined){
		toastr.warning("로그인을 먼저 해주십시오.", "로그인 필요!", {timeOut: 5000});
		return false;
	}
	if(param.dataset['cmtcmd'] === "1"){ //Button - 1:answer 2:del 3:reply
		$(".dv-reply-bt").text("쓰기");
		$(".dv-reply").appendTo(param.parentNode.parentNode);
		let replybt = document.querySelector(".dv-reply-bt");
		//cmtData.comcomment = "["+answeredID+"님에게 답변] ";
		cmtData.comcomment = "님에게] ";
		replybt.dataset['cmtno'] = cmtData.comcmtno;
		replybt.dataset['grpno'] = cmtData.comcmtgrpno;
		replybt.dataset['cmtadd'] = cmtData.comcomment;
		replybt.dataset['answerid'] = "    ["+answeredID;
		replybt.dataset['answertrue'] = "true";
		return false;
	} else if(param.dataset['cmtcmd'] === "3"){
		if(param.dataset['answertrue'] == "true"){
			cmtData.comcmtgroupno = 1;		//현재 답변이 진행중이면 1번 명령으로 바꿈.
			console.log("answertrue 통과")
		}
		cmtData.comcomment = param.dataset['answerid']+param.dataset['cmtadd'] + document.querySelector("#dv-reply-ta").value;
	}
	console.log("여기까지는 ??");
	$.ajax({
		type: "post",
		url: "cmtreply.do",
		data: JSON.stringify(cmtData),
		contentType: "application/json",
		success: function(rt){
			console.log("rt: "+rt);
			if(rt > 0){
				toastr.success("","성공", {timeOut: 5000});
			}
		},
		complete: function(){
			//댓글창 원상복귀
			let tmp1 = document.getElementsByClassName("col-10 dv-border")[1];
			$(".dv-reply-bt").text("댓글");
			$(".dv-reply").appendTo(tmp1);
			$("#dv-reply-ta").val("");
			$(".dv-reply-canclebt").click();
			titleClick(param);
		},
		error: function(){
			toastr.error("인터넷 연결상태를 확인해주세요.","댓글달기 실패", {timeOut: 5000});
		}
	});
};

let cmtReplycancle = (param)=>{  //취소,초기화
	let p = param.parentNode;
	console.log(p);
	document.getElementsByClassName("col-10 dv-border")[1].appendChild(p);
	let elem = document.querySelector('.dv-reply-bt');
	let dataset = elem.dataset;
	for (let key in dataset) {
	    elem.removeAttribute("data-" + key.split(/(?=[A-Z])/).join("-").toLowerCase());
	}
	param.dataset['cmtcmd'] = 3;
	dataset['cmtcmd'] = 3;
	dataset['cno'] = param.dataset['cno'];
	dataset['mid'] = param.dataset['mid'];
	dataset['mno'] = param.dataset['mno'];
	dataset['cmtadd'] = "";
	dataset['answerid'] = "";
	$("#dv-reply-ta").val("");
	$(".dv-reply-bt").text("댓글");
};

//$(".dv-reply-canclebt").on("click", cmtReplycancle);
	
