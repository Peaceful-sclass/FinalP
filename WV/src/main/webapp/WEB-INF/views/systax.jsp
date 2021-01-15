<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.13.1/styles/vs2015.min.css"> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script> 
<script>hljs.initHighlightingOnLoad();</script>
</head>
<body>

	<pre><code >
	 &lt;main role="main" style="padding-top: 250px; padding-bottom: 250px; background-color: #fffff9; "&gt;
		&lt;div class="container"&gt;
		
			&lt;div align="center"&gt;
		    	&lt;img src="resources/images/logo01.png" class="card-img2" style="width: 80px;"&gt;&nbsp;&nbsp;
		    	&lt;span id="span">PETP&lt;/span&gt;
    		&lt;/div&gt;
		
			&lt;form action="Member.do" method="post"&gt;
				&lt;input type="hidden" name="command" value="login"&gt;
				  &lt;div class="form-group"&gt;
				    &lt;label for="exampleInputPassword1"&gt;ID&lt;/label&gt;
				    &lt;input type="text" class="form-control" id="exampleInputPassword1" name="id"&gt;
				  &lt;/div&gt;
				  
				  &lt;div class="form-group"&gt;
				    &lt;label for="exampleInputPassword1"&gt;Password&lt;/label&gt;
				    &lt;input type="password" class="form-control" id="exampleInputPassword1" name="pw"&gt;
				  &lt;/div&gt;
				  
				  &lt;div align="center" style="margin-top:50px;"&gt;
				  	&lt;button type="submit" class="btn btn-secondary btn-lg btn-block" style="border: none;  height: 50px;"&gt;Sign In&lt;/button&gt;
				  &lt;/div&gt;
				  &lt;div align="center" style="margin-top:50px;"&gt;
				  	&lt;button type="button" class="btn btn-secondary btn-lg btn-white" style="border: none;  height: 50px;" onclick="registForm();"&gt;Sign Up&lt;/button&gt;
				  &lt;/div&gt;
			&lt;/form&gt;

		&lt;/div&gt;
	&lt;/main&gt;
	</code></pre>

</body>
</html>