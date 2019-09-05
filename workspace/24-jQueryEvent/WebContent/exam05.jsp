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
          // 눌러진 횟수를 카운트하기 위한 변수 
          var down_count = 0;
          // 떼어진 횟수를 카운트하기 위한 변수
          var up_count = 0;
          // 키가 눌러진 경우 혹은 누르고 있는 동안 
          $("#input > input[type='text']").keydown(function(){
        	  // 횟수를 1증가
        	  down_count++;
        	  $("#result").html("down_count: " + down_count
        			  + " / up_count: " + up_count);
          });
          //키에서 떨어진 경우
          $("#input > input[type='text']").keyup(function(){
        	  $("#result").html("down_count: " + down_count
        			  + " / up_count: " + up_count);
        	  up_count++;
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