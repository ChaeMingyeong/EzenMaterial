<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
    window.onload = function() {
		if(confirm("회원탈퇴하시겠습니까?")){
			location.href = "delete.jsp";
		}else{
			alert("회원탈퇴 취소");
			location.href = "../main/index.jsp";
		}
	}

</script>   
   
   
</head>
<body>

</body>
</html>