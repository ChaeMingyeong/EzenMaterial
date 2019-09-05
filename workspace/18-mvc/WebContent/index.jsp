<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3> *** MVC 패턴의 기본 동작1 ***</h3>
<a href="MessageController">none</a><br> <!-- 서버에 MessageController(파일)를 달라고 요청  -->
<a href="MessageController?message=host">host</a><br>
<a href="MessageController?message=guest">guest</a><br>
<a href="MessageController?message=passeneger">passenger</a><br>

<hr>
<h3> *** MVC 패턴의 기본 동작2 ***</h3>
<a href="MessageController1">none</a><br> <!-- 서버에 MessageController(파일)를 달라고 요청  -->
<a href="MessageController1?message=host">host</a><br>
<a href="MessageController1?message=guest">guest</a><br>
<a href="MessageController1?message=passeneger">passenger</a><br>
</body>
</html>