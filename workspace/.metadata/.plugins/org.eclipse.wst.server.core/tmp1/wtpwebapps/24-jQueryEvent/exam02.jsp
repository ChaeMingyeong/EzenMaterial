<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="css/event.css">
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
      $(function(){
    	  //마우스 누름
    	  $("#input").mousedown(function(){
    		  $("#result").html("Mouse Down Event");
    	  });
    	  //마우스 뗌
    	  $("#input").mouseup(function(){
    		  $("#result").html("Mouse Up Event");
    	  });
    	  //마우스 들어감 
    	  $("#input").mouseenter(function(){
    		  $("#result").html("Mouse Enter Event");
    	  });
    	  //마우스 빠져나감 
    	  $("#input").mouseleave(function(){
    		  $("#result").html("Mouse Leave Event");
    	  });
      });
</script>
</head>
<body>
<h1>마우스 이벤트 확인하기</h1>
<div id="input">
  Do it in Here~~
</div>
<h2>결과</h2>
<div id="result"></div>
</body>
</html>