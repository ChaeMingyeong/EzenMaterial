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
    $(function(){ //이벤트
    	$("#input > input[type='text']").focus(function(){
    		$("#result").html("포커스가 들어갔습니다.");
    	});
    	$("#input > input[type='text']").blur(function(){
    		$("#result").html("포커스가 나왔습니다.");
    	});
    	//페이지가 열리면서 자동으로 포커스 설정
    	$("#input > input[type='text']").focus(); //동작 
    });
</script>
</head>
<body>
    <h1>focus/blur 이벤트 확인하기</h1>
	<div id="input"><input type="text"></div>
	<h2>결과</h2>
	<div id="result"></div>
</body>
</html>