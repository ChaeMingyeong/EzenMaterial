<%@page import="imageboard.dao.ImageboardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page import="imageboard.bean.ImageboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //데이터 꺼내옴
   int seq = Integer.parseInt(request.getParameter("seq"));
   int pg = Integer.parseInt(request.getParameter("pg"));
   
   //DB
   ImageboardDTO imageboardDTO = new ImageboardDTO();
   ImageboardDAO imageboardDAO = new ImageboardDAO();
   imageboardDTO = imageboardDAO.selectboard(seq);

   //데이터 공유 
   request.setAttribute("imageboardDTO", imageboardDTO); //이미지 이름 저장 
   
   request.setAttribute("pg", pg);  //seq는 dto에 이미 저장되어 있기 때문에 공유할 필요없음 
   request.setAttribute("seq", seq);
   RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardViewResult");
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