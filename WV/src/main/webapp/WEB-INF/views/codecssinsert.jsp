<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<title>mode</title>
<meta charset="utf-8"/>


<link rel="stylesheet" href="http://codemirror.net/lib/codemirror.css">
<link rel="stylesheet" href="http://codemirror.net/addon/hint/show-hint.css">

<script src="http://codemirror.net/lib/codemirror.js"></script>
<script src="http://codemirror.net/addon/hint/css-hint.js"></script>
<script src="http://codemirror.net/addon/hint/show-hint.js"></script>
<script src="http://codemirror.net/mode/css/css.js"></script>


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
      var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
        extraKeys: {"Ctrl-Space": "autocomplete"},
        lineNumbers: true
      });
    </script>

   <jsp:include page="/WEB-INF/views/headerfooter/footer.jsp" flush="false"></jsp:include>
</article>