<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<script type="text/javascript">
window.onload = function () {
	location.href ="index.jsp";
	
	history.back();
}
      
</script>
  <c:if test="${su > 0}">
      회원수정성공 
  </c:if>
  
  <c:if test="${su <= 0}">
     회원수정실패  
  </c:if>
  
</body>
</html>




