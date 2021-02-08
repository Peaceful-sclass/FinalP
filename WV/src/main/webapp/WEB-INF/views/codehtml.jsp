<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<title>mode</title>
<meta charset="utf-8"/>


<link rel="stylesheet" href="http://codemirror.net/lib/codemirror.css">

<script src="http://codemirror.net/lib/codemirror.js"></script>
<script src="http://codemirror.net/addon/mode/multiplex.js"></script>
<script src="http://codemirror.net/mode/xml/xml.js"></script>
<script src="http://codemirror.net/mode/javascript/javascript.js"></script>
<script src="http://codemirror.net/mode/htmlmixed/htmlmixed.js"></script>
<script src="http://codemirror.net/mode/htmlembedded/htmlembedded.js"></script>
<script src="http://codemirror.net/mode/css/css.js"></script>


<style>.CodeMirror {border: 2px inset #dee; width: 100%; height: 600px;}</style>
<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />
<br><br><br><br><br><br>
<article>
<h2>Java example</h2>

<table border="1">
		<tr>
			<th>WRITER</th>
			<td>${dto.myname }</td>
		</tr>
		<tr>
			<th>TITLE</th>
			<td>${dto.mytitle }</td>
		</tr>
		<tr>
			<th>COMENT</th>
			<td>${dto.mycoment }</td>
		</tr>
		</table>
	
		<div><textarea id="code" name="code">${dto.mycontent }</textarea></div>
		
		
		<input type="button" value="목록" onclick="location.href='list.do?myco=${dto.myco}'">
		<input type="button" value="수정" onclick="location.href='updateform.do?myno=${dto.myno}&&myco=${dto.myco}'">
		<input type="button" value="삭제" onclick="location.href='delete.do?myno=${dto.myno}&&myco=${dto.myco}'">
	

    <script>
      var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
        lineNumbers: true,
        mode: "application/x-ejs",
        indentUnit: 4,
        indentWithTabs: true,
        readOnly: true
      });
      
      var mac = CodeMirror.keyMap.default == CodeMirror.keyMap.macDefault;
      CodeMirror.keyMap.default[(mac ? "Cmd" : "Ctrl") + "-Space"] = "autocomplete";
    </script>

   <jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</article>