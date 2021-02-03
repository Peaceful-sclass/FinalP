<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	request.setCharacterEncoding("UTF-8"); %>
<% 	response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- %@ page session="false" %> --%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<link rel="stylesheet" href="css/mainpage.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />	
<div class="menu-box">
	<div class="container">
		<h2 style="font-size: 2em; line-height: 1.5em; color: #666f77; text-transform: uppercase; letter-spacing: 0.125em; padding: 30px 0px 20px 0px">공모전 소식</h2>
		<div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel" data-interval="3000">
				
		  <!--Indicators-->
		  <ol class="carousel-indicators" style="top: auto;">
		    <li data-target="#multi-item-example" data-slide-to="0" class="active"></li>
		    <li data-target="#multi-item-example" data-slide-to="1"></li>
		    <li data-target="#multi-item-example" data-slide-to="2"></li>
		  </ol>
		  <!--/.Indicators-->
		
		  <!--Slides-->
		  <div class="carousel-inner" role="listbox">
		
		    <!--First slide-->
		    <div class="carousel-item active">
		
		      <div class="row">
		
		        <div class="col-md-3">
		          <div class="card mb-2">
		            <img class="card-img-top" src="images/${contest[0].contestposter}" onerror="this.src='images/non-img.jpg'"
		              alt="Card image cap">
		            <div class="card-body">
		              <h4 class="card-title">${contest[0].contestname }</h4>
		              <p class="card-text">
		              	<b>주최 </b>&nbsp; ${contest[0].contestagent }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[0].conteststart }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[0].contestend }<br>         			              	
		              </p>
		              <button class="btn btn-primary" onclick="location.href='contestDetail.do?contestnum=${contest[0].contestnum}'">상세요강</button>
		            </div>
		          </div>
		        </div>
		
		        <div class="col-md-3 d-none d-md-block">
		          <div class="card mb-2">
		            <img class="card-img-top" src="images/${contest[1].contestposter}" onerror="this.src='images/non-img.jpg'"
		              alt="Card image cap">
		            <div class="card-body">
		              <h4 class="card-title">${contest[1].contestname }</h4>
		              <p class="card-text">
		              	<b>주최 </b>&nbsp; ${contest[1].contestagent }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[1].conteststart }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[1].contestend }<br>         			              	
		              </p>
		              <button class="btn btn-primary" onclick="location.href='contestDetail.do?contestnum=${contest[1].contestnum}'">상세요강</button>
		            </div>
		          </div>
		        </div>
		
		        <div class="col-md-3 d-none d-md-block">
		          <div class="card mb-2">
		            <img class="card-img-top" src="images/${contest[2].contestposter}" onerror="this.src='images/non-img.jpg'"
		              alt="Card image cap">
		            <div class="card-body">
		              <h4 class="card-title">${contest[2].contestname }</h4>
		              <p class="card-text">
		              	<b>주최 </b>&nbsp; ${contest[2].contestagent }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[2].conteststart }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[2].contestend }<br>         			              	
		              </p>
		              <button class="btn btn-primary" onclick="location.href='contestDetail.do?contestnum=${contest[2].contestnum}'">상세요강</button>
		            </div>
		          </div>
		        </div>
		
		        <div class="col-md-3 d-none d-md-block">
		          <div class="card mb-2">
		            <img class="card-img-top" src="images/${contest[3].contestposter}" onerror="this.src='images/non-img.jpg'"
		              alt="Card image cap">
		            <div class="card-body">
		              <h4 class="card-title">${contest[3].contestname }</h4>
		              <p class="card-text">
		              	<b>주최 </b>&nbsp; ${contest[3].contestagent }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[3].conteststart }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[3].contestend }<br>         			              	
		              </p>
		              <button class="btn btn-primary" onclick="location.href='contestDetail.do?contestnum=${contest[3].contestnum}'">상세요강</button>
		            </div>
		          </div>
		        </div>
		      </div>
		
		    </div>
		    <!--/.First slide-->
		
		    <!--Second slide-->
		    <div class="carousel-item">
		
		      <div class="row">
		
		        <div class="col-md-3">
		          <div class="card mb-2">
		            <img class="card-img-top" src="images/${contest[4].contestposter}" onerror="this.src='images/non-img.jpg'"
		              alt="Card image cap">
		            <div class="card-body">
		              <h4 class="card-title">${contest[4].contestname }</h4>
		              <p class="card-text">
		              	<b>주최 </b>&nbsp; ${contest[4].contestagent }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[4].conteststart }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[4].contestend }<br>         			              	
		              </p>
		              <button class="btn btn-primary" onclick="location.href='contestDetail.do?contestnum=${contest[4].contestnum}'">상세요강</button>
		            </div>
		          </div>
		        </div>
		
		        <div class="col-md-3 d-none d-md-block">
		          <div class="card mb-2">
		            <img class="card-img-top" src="images/${contest[5].contestposter}" onerror="this.src='images/non-img.jpg'"
		              alt="Card image cap">
		            <div class="card-body">
		              <h4 class="card-title">${contest[5].contestname }</h4>
		              <p class="card-text">
		              	<b>주최 </b>&nbsp; ${contest[5].contestagent }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[5].conteststart }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[5].contestend }<br>         			              	
		              </p>
		              <button class="btn btn-primary" onclick="location.href='contestDetail.do?contestnum=${contest[5].contestnum}'">상세요강</button>
		            </div>
		          </div>
		        </div>
		
		        <div class="col-md-3 d-none d-md-block">
		          <div class="card mb-2">
		            <img class="card-img-top" src="images/${contest[6].contestposter}" onerror="this.src='images/non-img.jpg'"
		              alt="Card image cap">
		            <div class="card-body">
		              <h4 class="card-title">${contest[6].contestname }</h4>
		              <p class="card-text">
		              	<b>주최 </b>&nbsp; ${contest[6].contestagent }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[6].conteststart }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[6].contestend }<br>         			              	
		              </p>
		              <button class="btn btn-primary" onclick="location.href='contestDetail.do?contestnum=${contest[6].contestnum}'">상세요강</button>
		            </div>
		          </div>
		        </div>
		
		        <div class="col-md-3 d-none d-md-block">
		          <div class="card mb-2">
		            <img class="card-img-top" src="images/${contest[7].contestposter}" onerror="this.src='images/non-img.jpg'"
		              alt="Card image cap">
		            <div class="card-body">
		              <h4 class="card-title">${contest[7].contestname }</h4>
		              <p class="card-text">
		              	<b>주최 </b>&nbsp; ${contest[7].contestagent }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[7].conteststart }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[7].contestend }<br>         			              	
		              </p>
		              <button class="btn btn-primary" onclick="location.href='contestDetail.do?contestnum=${contest[7].contestnum}'">상세요강</button>
		            </div>
		          </div>
		        </div>
		
		      </div>
		
		    </div>
		    <!--/.Second slide-->
		
		    <!--Third slide-->
		    <div class="carousel-item">
		
		      <div class="row">
		
		        <div class="col-md-3">
		          <div class="card mb-2">
		            <img class="card-img-top" src="images/${contest[8].contestposter}" onerror="this.src='images/non-img.jpg'"
		              alt="Card image cap">
		            <div class="card-body">
		              <h4 class="card-title">${contest[8].contestname }</h4>
		              <p class="card-text">
		              	<b>주최 </b>&nbsp; ${contest[8].contestagent }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[8].conteststart }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[8].contestend }<br>         			              	
		              </p>
		              <button class="btn btn-primary" onclick="location.href='contestDetail.do?contestnum=${contest[8].contestnum}'">상세요강</button>
		            </div>
		          </div>
		        </div>
		
		        <div class="col-md-3 d-none d-md-block">
		          <div class="card mb-2">
		            <img class="card-img-top" src="images/${contest[9].contestposter}" onerror="this.src='images/non-img.jpg'"
		              alt="Card image cap">
		            <div class="card-body">
		              <h4 class="card-title">${contest[9].contestname }</h4>
		             <p class="card-text">
		              	<b>주최 </b>&nbsp; ${contest[9].contestagent }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[9].conteststart }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[9].contestend }<br>         			              	
		              </p>
		              <button class="btn btn-primary" onclick="location.href='contestDetail.do?contestnum=${contest[9].contestnum}'">상세요강</button>
		            </div>
		          </div>
		        </div>
		
		        <div class="col-md-3 d-none d-md-block">
		          <div class="card mb-2">
		            <img class="card-img-top" src="images/${contest[10].contestposter}" onerror="this.src='images/non-img.jpg'"
		              alt="Card image cap">
		            <div class="card-body">
		              <h4 class="card-title">${contest[10].contestname }</h4>
		              <p class="card-text">
		              	<b>주최 </b>&nbsp; ${contest[10].contestagent }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[10].conteststart }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[10].contestend }<br>         			              	
		              </p>
		              <button class="btn btn-primary" onclick="location.href='contestDetail.do?contestnum=${contest[10].contestnum}'">상세요강</button>
		            </div>
		          </div>
		        </div>
		
		        <div class="col-md-3 d-none d-md-block">
		          <div class="card mb-2">
		            <img class="card-img-top" src="images/${contest[11].contestposter}" onerror="this.src='images/non-img.jpg'"
		              alt="Card image cap">
		            <div class="card-body">
		              <h4 class="card-title">${contest[11].contestname }</h4>
		              <p class="card-text">
		              	<b>주최 </b>&nbsp; ${contest[11].contestagent }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[11].conteststart }<br>
		              	<b>접수시작 </b>&nbsp; ${contest[11].contestend }<br>         			              	
		              </p>
		              <button class="btn btn-primary" onclick="location.href='contestDetail.do?contestnum=${contest[11].contestnum}'">상세요강</button>
		            </div>
		          </div>
		        </div>
		
		      </div>
		
		    </div>
		    <!--/.Third slide-->
		
		  </div>
		  <!--/.Slides-->
		
		</div>
		<div style="float: right;">
			<button class="btn btn-primary" onclick="location.href='contestlist.do'">공모전 더보기</button>
		</div>
	</div>
</div>
<!--/.Carousel Wrapper-->


<jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</body>
</html>
