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
	  var h1 = $("#hello");  
	  // $는 document 객체 뿐만아니라, 후에 이벤트처리할때를 위한 더 다양한 객체를 포함하고있음 
	  h1.html("Hello jQuery");
	  // =>	 
	  $("#hello").html("안뇽 제이쿼리>_<");
   });
</script>
</head>
<body>
  <h1 id="hello"></h1>
</body>
</html>