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


<style>.CodeMirror {border: 2px inset #dee; width: 100%; height: 600px;}</style>
<jsp:include page="/WEB-INF/views/headerfooter/header.jsp" flush="false" />
<br><br><br><br><br><br>
<article>
	<form action="insertres.do" method="post">
	<input type="hidden" name="myco" value="${myco }">
	<input type="hidden" name="myname" value="${member.getMember_id() }">
		<table border="1">
			<tr>
				<th>TITLE</th>
				<td><input type="text" name="mytitle"></td>
			</tr>
			<tr>
				<th>CONMENT</th>
				<td><textarea rows="3" cols="60" name="mycoment"></textarea> </td>
			</tr>
			<tr>
				<th>CONTENT</th>
				<td><textarea id="code" name="mycontent"></textarea> </td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="완료">
					<input type="button" value="취소" onclick="location.href='list.do'">
				</td>
			</tr>
		</table>
	</form>

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
      countries: ["name", "population", "size"]
    }}
  });
};

</script>

   <jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</article>