<%@page import="sun.rmi.server.Dispatcher"%>
<%@page import="imageboard.dao.ImageboardDAO"%>
<%@page import="imageboard.bean.ImageboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //데이터 
   request.setCharacterEncoding("UTF-8");
   int seq = Integer.parseInt(request.getParameter("seq"));
   String imageName = request.getParameter("imageName");
   
   ImageboardDAO imageboardDAO = new ImageboardDAO();
   int su =  imageboardDAO.deleteBoard(seq); 
   
   //데이터공유 
   request.setAttribute("su", su);
   request.setAttribute("imageName", imageName);
   //화면이동 
   RequestDispatcher dispatcher = 
      request.getRequestDispatcher("../main/index.jsp?req=imageboardDeleteResult");
      dispatcher.forward(request, response);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
  
</body>
</html>