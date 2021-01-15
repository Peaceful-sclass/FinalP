window.addEventListener("load", function() {
    console.log("test comunity.js");
    let currentPage = document.getElementsByName("currentPage")[1].value;
    console.log("test currentPage : "+currentPage);
    let selectedPage = document.getElementsByName(currentPage)[0]; //atag임
    console.log("test selectedPage : "+selectedPage);
    selectedPage.classList.add('test1css');

}, false) ;

function selectcategory(select){ //안씀..
    select.submit();
    return false;
};

let titleClick = function(){ //테이블폼 제출용
    //let form = document.tableform1;
    //form.action;
	let form = document.getElementsByName("tableform1")[0];
    form.submit();
};

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
    
    let ip2 = ip.cloneNode();	//검색 단어
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