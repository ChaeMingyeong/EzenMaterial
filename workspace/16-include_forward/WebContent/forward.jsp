<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String name = "gildong";
  // session.setAttribute("name", name); //session 이용 
  request.setAttribute("name", name); //request 이용 
  
  //forward 방식 페이지 이동: Java class 이용   
  // <jsp:forward>와 동일한 동작 
  RequestDispatcher dispatcher
    = request.getRequestDispatcher("forwardResult.jsp");
  dispatcher.forward(request, response);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>현재 페이지는 forward.jsp 입니다.</p>
<%-- 
<jsp:forward page="forwardResult.jsp">
    <jsp:param value="<%=name %>" name="name"/>
</jsp:forward>
<jsp:forward page="forwardResult.jsp"/>
--%>

</body>
</html>

<!-- forward 방식 -->