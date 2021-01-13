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

let cmpageChange = function(param){ //셀랙트카테고리 폼양식 제출용
    if(param.getAttribute("name") == "selectform1"){
        param.submit();
        return false;
    }
    
	//paging tag들의 정보를 currentPage tag에 넣어주는 곳
    let currentPage = document.getElementsByName("currentPage")[1];
    if(param.getAttribute("name") == "prev" || param.getAttribute("name") == "next"){
        currentPage.value = param.getAttribute("value");
        console.log(currentPage.value);
    } else {
        currentPage.value = param.getAttribute("value");
        console.log(currentPage.value);
        param.classList.add('test1css');
        // $(param).css({
        //     color: "red",
        //     "background-color":"blue"
        // });

    }

    let form = document.getElementsByName("cmpagechange")[0];
    form.submit();

};

