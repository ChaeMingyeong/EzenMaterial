
<%@page import="score.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   

   int seq = Integer.parseInt(request.getParameter("seq"));
  
   BoardDAO boardDAO = new BoardDAO();
   int su = boardDAO.deleteboard(seq);
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  <% if(su > 0) { %>
			alert("삭제성공");
			location.href="../main/index.jsp";
	<% } else { %>
			alert("삭제실패");
			location.href="../main/index.jsp";
	<% } %>
 
</script>
</head>
<body>

</body>
</html>