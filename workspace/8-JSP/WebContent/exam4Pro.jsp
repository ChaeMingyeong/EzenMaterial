<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(age >=20) {%>
   <p><%= name %>님의 나이는 <%= age %>이므로, 성인입니다.</p>
<% } else {%>
   <p><%= name  %> 님의 나이는 <%= age %>이므로, 청소년입니다.</p>
<% } %>
     
</body>
</html>