<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
     
       <form action="register.do" method="post">
            <table border="1">
                  <tr>
                     <th>ID</th>
                     <td><input type="text" name="memberid"></td>
                  </tr>
                  <tr>
                     <th>PW</th>
                     <td><input type="text" name="memberpw"></td>
                  </tr>
                  <tr>
                     <th>NAME</th>
                     <td><input type="text" name="membername"></td>
                  </tr>
                  <tr>
                      <td>
                            <input type="submit" value="회원가입">
                            <input type="button" value="취소" onclick="index.html">
                      </td>
                  </tr>
            </table>
       </form>
</body>
</html>