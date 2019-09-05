<%@page import="book.dao.BookDAO"%>
<%@page import="book.bean.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String code = request.getParameter("code");
   String title = request.getParameter("title");
   String author = request.getParameter("author");
   String publisher = request.getParameter("publisher");
   int price = Integer.parseInt(request.getParameter("price"));
   
   BookDTO bookDTO = new BookDTO();
   bookDTO.setCode(code);
   bookDTO.setTitle(title);
   bookDTO.setAuthor(author);
   bookDTO.setPublisher(publisher);
   bookDTO.setPrice(price);
   BookDAO bookDAO = new BookDAO();
   int su = bookDAO.insertBook(bookDTO);
   request.setAttribute("su", su);
   
   RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=insertBookResult");
   dispatcher.forward(request, response);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   if()
</body>
</html>