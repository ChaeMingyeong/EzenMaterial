
<%@page import="org.apache.catalina.tribes.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload= function() {
		 if(${su > 0}) { 
				alert("회원탈퇴 성공");			
		 } else {
				alert("회원탈퇴 실패");
		 } 
		location.href = "index.jsp";
	}
</script>
</head>
<body>

</body>
</html>




