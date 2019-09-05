<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    int x = 0; //Integer.parseInt(request.getParameter("x"));
    int y = 1; // Integer.parseInt(request.getParameter("y"));
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>jsp 표현식</h2>
<%=x %> + <%=y %> = <%=x + y %><br>
<%=x %> - <%=y %> = <%=x - y %><br>
<%=x %> * <%=y %> = <%=x * y %><br>
<%=x %> / <%=y %> = <%=x / y %><br>
<h2>jsp 표현식</h2>
${param.x} + ${param.y} = ${param.x + param.y}<br>
${param.x} - ${param.y} = ${param.x - param.y}<br>
${param.x} * ${param.y} = ${param.x * param.y}<br>
${param.x} / ${param.y} = ${param.x / param.y}<br>

</body>
</html>