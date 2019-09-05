<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/event.css">
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#input").hover(function() {
			//마우스 커서가 올라감
			$("#result").html("Mouse Over Event");
		}, function() {
			//마우스 커서가 빠져나감
			$("#result").html("Mouse Out Event");
		});
	});
</script>
</head>
<body>
	<h1>Hover 이벤트 확인하기</h1>
	<div id="input">Mouse Over or Out Here!!~</div>
	<h2>결과</h2>
	<div id="result"></div>
</body>
</html>