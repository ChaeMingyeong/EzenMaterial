<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   

   String id = (String) session.getAttribute("memId");
   String name = (String) session.getAttribute("memName");
   
   List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
   BoardDAO boardDAO = new BoardDAO();
 
       boardlist = boardDAO.viewBoard();
        
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
    function isLogin(seq) {
		<% if(session.getAttribute("memId") ==null) { %>
			  alert("먼저 로그인 해주세요");
			  location.href ="../main/index.jsp";
		<% }else { %>
		     location.href ="boardView.jsp?seq=" + seq; // string 
		<%}%>
	}
</script>
</head>
<body>
    
   
    <table border="1">
       <tr bgcolor="mistyrose">
         <th width="70">글번호</th>
         <th width="200">제목</th>
         <th width ="100">작성자</th>
         <th width ="70">작성일</th>
         <th>조회수</th>
       </tr>
      <% for(BoardDTO boardDTO : boardlist) { %>  <!-- 리스트의 경우 확장포문이 더 간편 -->
       <tr bgcolor="#ffffcc" align="center">
         <td><%=boardDTO.getSeq() %></td>
         <td><a href ="#" onclick ="isLogin(<%= boardDTO.getSeq() %>)"><%=boardDTO.getSubject()%></a></td>
         <td><%=boardDTO.getName() %></td>
         <td><%=boardDTO.getLogtime() %></td>
         <td><%=boardDTO.getHit() %></td>
       </tr>
         
      
     <%  } %>
   </table> 
   
   
  
      
</body>
</html>