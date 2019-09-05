<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //데이터 처리
   String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");
   
   //세션에 저장
   session.setAttribute("id", id);
   session.setAttribute("pwd", pwd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<h2>세션 속성 설정 및 사용</h2>
<p>세션 읽기</p>
<p>id = <%= session.getAttribute("id") %></p>
<p><%=session.getAttribute("pwd") %></p>
</body>
</html>