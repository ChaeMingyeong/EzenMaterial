<%@page import="score.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	// 데이터
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	// DB
	BoardDAO boardDAO = new BoardDAO();
	int su = boardDAO.boardDelete(seq);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	<% if(su > 0) { %>
			alert("삭제성공");
			location.href="../main/index.jsp?req=boardList&pg=<%=pg%>";
	<% } else {%>
			alert("삭제실패");
			location.href="../main/index.jsp?req=boardList&seq=<%=seq%>&pg=<%=pg%>"
	<% } %>
</script>
</head>
<body>

</body>
</html>