<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<title>mode</title>
<meta charset="utf-8"/>


<link rel="stylesheet" href="http://codemirror.net/lib/codemirror.css">
<link rel="stylesheet" href="http://codemirror.net/addon/hint/show-hint.css">

<script src="http://codemirror.net/lib/codemirror.js"></script>
<script src="http://codemirror.net/addon/edit/matchbrackets.js"></script>
<script src="http://codemirror.net/addon/hint/show-hint.js"></script>
<script src="http://codemirror.net/mode/sql/sql.js"></script>
<script src="http://codemirror.net/addon/hint/sql-hint.js"></script>


<style>.CodeMirror {border: 2px inset #dee; width: 100%; height: 600px;}
	th{
		
	}
</style>
<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />
<br><br><br><br><br><br>
<article>
<h2>SQL example</h2>
	<div class="col-10 dv-border">
	<table border="1">
		<tr>
			<th>WRITER</th>
			<td>${dto.myname }</td>
			<th>asd</th>
			<td>asd</td>
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
	
		<div><textarea id="code">${dto.mycontent }</textarea></div>
		</div>
		
		<input type="button" value="목록" onclick="location.href='list.do?myco=${dto.myco}'">
		<input type="button" value="수정" onclick="location.href='updateform.do?myno=${dto.myno}&&myco=${dto.myco}'">
		<input type="button" value="삭제" onclick="location.href='delete.do?myno=${dto.myno}&&myco=${dto.myco}'">
	

   <script>
window.onload = function() {
  var mime = 'text/x-mariadb';
  // get mime type
  if (window.location.href.indexOf('mime=') > -1) {
    mime = window.location.href.substr(window.location.href.indexOf('mime=') + 5);
  }
  window.editor = CodeMirror.fromTextArea(document.getElementById('code'), {
    mode: mime,
    indentWithTabs: true,
    smartIndent: true,
    lineNumbers: true,
    matchBrackets : true,
    autofocus: true,
    extraKeys: {"Ctrl-Space": "autocomplete"},
    hintOptions: {tables: {
      users: ["name", "score", "birthDate"],
      countries: ["name", "population", "size"],
      readOnly: true
    }}
  });
};

</script>

   <jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</article>