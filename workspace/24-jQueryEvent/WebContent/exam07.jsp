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
   $(function(){
	   var count = 0;
	   $("#input > input[type='text']").keypress(function(){
		   count++;
		   $("#result").html("key count" + count);
	   });
   });
</script>
</head>
<body>
  	<h1>Key 이벤트 확인하기</h1>
	<div id="input"><input type="text"></div>
	<h2>결과</h2>
	<div id="result"></div>
</body>
</html>