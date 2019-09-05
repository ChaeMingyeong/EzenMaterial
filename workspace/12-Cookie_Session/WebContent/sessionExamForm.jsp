<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 사용</title>
</head>
<body>
<h2>정보 입력 폼</h2>
<form action = "sessionExamPro.jsp" method ="post">
   <p>아이디 : <input type ="text" name ="id"></p>
   <p>비밀번호 : <input type ="password" name ="pwd"></p>
   <input type ="submit" value ="로그인">
</form>
</body>
</html>