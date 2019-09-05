<%@page import="javax.websocket.SendResult"%>
<%@page import="book.bean.BookDTO"%>
<%@page import="java.util.List"%>
<%@page import="book.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  
  int pg = Integer.parseInt(request.getParameter("pg"));
  //1~10  11~20
  int endNum = pg * 10;
  int startNum = endNum - 9;

  BookDAO bookDAO = new BookDAO();
  List<BookDTO> bookList = bookDAO.ViewBookList(startNum, endNum);
  
  int sum = bookDAO.countBook(); //총 책의 갯수
  int totalPage = (sum + 9) / 10;      //3페이지 
   
  int startPage = ((pg -1)/3)*3 + 1;
  int endPage = startPage + 2;
  
  if(endPage>totalPage) endPage = totalPage;
  System.out.println("aaa");
  request.setAttribute("bookList", bookList);
  System.out.println(bookList.get(1).getCode());
  request.setAttribute("startPage", startPage);
  request.setAttribute("endPage", endPage);
  request.setAttribute("totalPage", totalPage);
  request.setAttribute("pg", pg);
  
  RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=bookListResult&pg=" + pg);
  dispatcher.forward(request, response);
  
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
테스트
</body>
</html>