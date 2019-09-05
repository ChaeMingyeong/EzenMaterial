<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    $(function(){
    	  $("#sh > input:eq(0)").click(function(){
    		  $("#sh> div").show(200); //200 : ms
    	  });
    	  $("#sh > input:eq(1)").click(function(){
    		  $("#sh> div").hide(200);
    	  });
    	  $("#sh > input:eq(2)").click(function(){
    		  $("#sh> div").toggle(200);
    	  });
    });
</script>
</head>
<body>
<h1>show/hide</h1>
<div id="sh">
   <input type="button" value="보이기">
   <input type="button" value="숨기기">
   <input type="button" value="토글">
   <div>
      <img alt="이미지" src="img/1.jpg" width="300px", height="200px">
   </div>
   <p>테스트</p>
</div>
</body>
</html>