<%@page import="java.util.List"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="score.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
     BoardDAO boardDAO = new BoardDAO();
     int seq = Integer.parseInt(request.getParameter("seq"));

     BoardDTO boardDTO = boardDAO.boardView(seq);
     boardDAO.updatehit(seq);
     
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
  <form name="boardViewForm">
   <table border="1">
      <tr>
        <td colspan="3" width="400"><%=boardDTO.getSubject() %></td>
      </tr>
      <tr>
        <td>글번호: <%= boardDTO.getSeq() %></td>
        <td>작성자: <%= boardDTO.getName() %></td>
        <td>조회수: <%= boardDTO.getHit() %></td>
      </tr>
      <tr>
        <td colspan="3" height="300"><%= boardDTO.getContent()%></td>
      </tr>
      <tr>
         <% if(session.getAttribute("memId").equals(boardDTO.getId())) { %>
         <td colspan="3">
         <input type= "button" value ="목록" onclick = "location.href = '../main/index.jsp'">
         <input type= "button" value ="글수정">
         <input type= "button" value =" 글삭제" 
         onclick="location.href='boardDelete.jsp?seq=<%=seq%>'">
         </td> 
         <% } else { %>
           <td><input type= "button" value ="목록"></td> 
         <% } %> 
      </tr> 
   </table>
   </form>
</body>
</html>