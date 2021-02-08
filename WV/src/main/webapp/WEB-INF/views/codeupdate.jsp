<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="http://codemirror.net/lib/codemirror.css">
<link rel="stylesheet" href="http://codemirror.net/addon/hint/show-hint.css">

<script src="http://codemirror.net/lib/codemirror.js"></script>
<script src="http://codemirror.net/addon/edit/matchbrackets.js"></script>
<script src="http://codemirror.net/addon/hint/show-hint.js"></script>
<script src="http://codemirror.net/mode/clike/clike.js"></script>

<style>.CodeMirror {border: 2px inset #dee; width: 100%; height: 600px;}</style>


<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />
<br><br><br><br><br><br>
<article>

	<form action="updateres.do" method="post">
		<input type="hidden" name="myco" value="${dto.myco }">
		<input type="hidden" name="myno" value="${dto.myno }">
		<table border="1">
			<tr>
				<th>WRITER</th>
				<td>${dto.myname }</td>
			</tr>
			<tr>
				<th>TITLE</th>
				<td><input type="text" name="mytitle" value="${dto.mytitle }" ></td>
			</tr>
			<tr>
				<th>COMENT</th>
				<td><input type="text" name="mycoment" value="${dto.mycoment }" ></td>
			</tr>
			</table>
		
				<textarea id="java-code" name="mycontent">${dto.mycontent }</textarea> 
			
				
					<input type="submit" value="완료">
					<input type="button" value="취소" onclick="location.href='list.do?myco=${dto.myco}'">
			
	</form>
	
	 <script>
      var javaEditor = CodeMirror.fromTextArea(document.getElementById("java-code"), {
        lineNumbers: true,
        matchBrackets: true,
        mode: "text/x-java"
       
      });
      
      var mac = CodeMirror.keyMap.default == CodeMirror.keyMap.macDefault;
      CodeMirror.keyMap.default[(mac ? "Cmd" : "Ctrl") + "-Space"] = "autocomplete";
    </script>
    
     <jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
	</article>