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
	$(function () {
		$(window).resize(function () {
			var result = "<p>" + $(window).width() + "x" + $(window).height()  + "</p>";
			$("#result").html(result);
		});
	});
</script>
</head>
<body>
<h1>창크기 조절 이벤트</h1>
<div id="result"></div>
</body>
</html>