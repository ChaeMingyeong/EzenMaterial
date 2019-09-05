<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //데이터 처리
   int number1=  Integer.parseInt(request.getParameter("number1"));
   int number2 = Integer.parseInt(request.getParameter("number2"));
   int result = number1 + number2;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%= number1 %> + <%= number2 %> = <%=result %>
</body>
</html>