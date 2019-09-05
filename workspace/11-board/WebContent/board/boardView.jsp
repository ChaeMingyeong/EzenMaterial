<%@page import="java.util.List"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
     BoardDAO boardDAO = new BoardDAO();
     int seq = Integer.parseInt(request.getParameter("seq"));
     BoardDTO boardDTO = boardDAO.boardView(seq);
   
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <table border="1">
      <tr>
        <td colspan="3"><%=boardDTO.getSubject() %></td>
      </tr>
      <tr>
        <td>글번호: <%= boardDTO.getSeq() %></td>
        <td>작성자: <%= boardDTO.getName() %></td>
        <td>조회수: <%= boardDTO.getHit() %></td>
      </tr>
      <tr>
        <td colspan="3"><%= boardDTO.getContent() %></td>
      </tr>
   </table>
</body>
</html>