<%@ page language="java" contentType="text/html; charset=UTF-8" 

    pageEncoding="UTF-8"%> <!-- 현재작성되어지는 문서에대한 엔코딩 -->
<%@ page info = "copyright by YCS" %>

<!-- contentTyep의 UTF-8은 브라우저로 넘어가는 문서에 대한 엔코딩 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP시작</title>
</head>
  <h2>JSP 시작</h2>
  <hr>
  <%= "처음으로 시작되는 JSP페이지" %>
  <%= getServletInfo() %>
<body>

</body>
</html>