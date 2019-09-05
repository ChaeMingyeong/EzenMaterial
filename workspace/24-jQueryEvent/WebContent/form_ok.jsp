<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String user_name = request.getParameter("user_name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/event.css">
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
       $(".myButton").click(function(){
    	   history.back();
       });
	});
</script>
</head>
<body>
	<%=user_name%>	저장되었습니다.
	<input type="button" value="이전페이지로 이동" class="myButton">
</body>
</html>