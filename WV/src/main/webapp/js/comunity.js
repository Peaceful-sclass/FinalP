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
    if(cmd === "/root/cmwriteform.do"){		//cm글쓰기폼
        toastr.info("", cmd, {timeOut: 5000});

		let form = document.createElement("form");
		form.action = "cmwrite.do";
		form.method = "get";
		let input = document.createElement("input");
		input.type = "hidden";
		input.name = "content";
		let content = quill.root.innerHTML;
	    input.value= content;
		
		//제목
		form.append(input);
		let title = document.querySelector(".dv-subject");
		console.log("title :"+title.value);
		$(form).append($('<input/>', {type: 'hidden', name: 'title', value:$(title).val() }));
		//카테고리,회원
		let category = document.querySelector("select[name=category]").value;
		console.log("category: "+category);
		$('#category').val(category); //input tag value 변경
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
				
        
    } else if(cmd === "/root/cmmodify.do"){ //cm글수정폼
        
    }
	
	
	
	
}



// 목록 글 Detail view

function titleClick(param) {
	console.log("param.dataset: "+param.dataset['no']);
	$.ajax({
		type: "post",
		url: "cmdetail.do",
		data: JSON.stringify({cno:param.dataset['no']}),
		contentType: "application/json",
		dataType: "json",
		beforeSend: function(){
            $("#dv-ct").removeClass('dv-toggle');
            $("tbody tr").removeClass("cm-selected cm-bold");
			document.documentElement.scrollTop = 0;
		},
		success: function(rt){ //제목,내용,시간,조회수,작성자
			$(".dv-subject").text(rt.dto.title);
			$(".dv-subject2").children().eq(0).text(rt.dto.member_id);
			$(".dv-subject2").children().eq(1).text(rt.dto.regdate);
			$(".dv-subject2").children().eq(2).text(rt.dto.views);
			$(".dv-content").html(rt.dto.content);
        },
        complete: function(){
            //$(param).addClass("cm-bold");
            let sel = param.parentNode.parentNode;
			sel.classList.add("cm-selected","cm-bold");
        },
        error: function(){
            toastr("내용 로드에 실패했습니다.", "글읽기 실패", {timeOut: 5000});
        }
	});
}







