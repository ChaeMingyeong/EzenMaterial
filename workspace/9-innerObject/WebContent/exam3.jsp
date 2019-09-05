<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
     out.println("자바영역에서의 문자열1");
    //response.sendRedirect("exam3Pro.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>response 내장객체 = 리다이렉트 예제</h2>
<script type="text/javascript">
    alert("현재 페이지는 <b>exam3.jsp</b> 페이지 입니다. ");
</script>
<%-- HTML 영역에 자바 데이터를 출력하는 방법 
   1. <%= 데이터%>
   2. out 객체 사용
      out.println(데이터);
--%>
<%
     out.println("자바영역에서의 문자열2");
    response.sendRedirect("exam3Pro.jsp");
%>
</body>
</html>