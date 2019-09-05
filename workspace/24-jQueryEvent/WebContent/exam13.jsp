<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/scroll.css">
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(window).scroll(function() {
             $("#console").html("스크롤이 이동되었습니다.");
             // 3초후에 #console 요소의 내용을 지운다. 
             setTimeout(function(){
            	 $("#console").html("");
             }, 3000);
		});
	});
</script>
</head>
<body>
	<div class="gradientStyle">
		<h1>스크롤 이벤트</h1>
		<div id="console"></div>
	</div>
</body>
</html>