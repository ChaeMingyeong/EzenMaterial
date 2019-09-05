<%@page import="score.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	// 데이터
	request.setCharacterEncoding("UTF-8");	// 한글 처리
	String pg = request.getParameter("pg");
	int seq = Integer.parseInt(request.getParameter("seq"));
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	// DB
	BoardDTO boardDTO = new BoardDTO();
	boardDTO.setSeq(seq);
	boardDTO.setSubject(subject);
	boardDTO.setContent(content);
	
	BoardDAO boardDAO = new BoardDAO();
	int su = boardDAO.boardModify(boardDTO);	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	<% if(su > 0) { %>
			alert("수정 성공");
	<% } else { %>
			alert("수정 실패");
	<% } %>
	location.href="../main/index.jsp?req=boardView&seq=<%=seq%>&pg=<%=pg%>";
</script>
</head>
<body>

</body>
</html>







