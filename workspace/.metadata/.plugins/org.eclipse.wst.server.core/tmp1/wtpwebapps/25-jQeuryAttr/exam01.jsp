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
	   var index = 1;
	   $("img").click(function(){
		   index = (index % 3) +1;
		   //이미지파일 변경 
		   $(this).attr("src", "img/" + index +".jpg");
	   });
   });
</script>
</head>
<body>
<h1>속성 제어</h1>
<p>그림을 클릭하세요</p>
<img alt="이미지" src="img/1.jpg">
</body>
</html>