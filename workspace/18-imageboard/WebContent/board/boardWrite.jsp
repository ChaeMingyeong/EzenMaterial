<%@page import="board.bean.BoardDTO"%>
<%@page import="score.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	// 데이터 처리
	request.setCharacterEncoding("UTF-8");	// 한글처리
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String name = (String)session.getAttribute("memName");
	String id = (String)session.getAttribute("memId");
	// DB 처리
	BoardDTO boardDTO = new BoardDTO();
	boardDTO.setId(id);
	boardDTO.setName(name);
	boardDTO.setSubject(subject);
	boardDTO.setContent(content);
	
	BoardDAO boardDAO = new BoardDAO();
	
	int su = boardDAO.boardWrite(boardDTO);
	
	request.setAttribute("su", su);
	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=boardList");
	dispatcher.forward(request, response);        
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script type="text/javascript">
	<% if(su > 0) { %>
		alert("작성하신 글을 저장하였습니다.");		
	<% } else { %>
		alert("작성하신 글을 저장하지 못하였습니다.");
	<% } %>
	 
</script>
</head>
<body>

<%--
제목 : <%=subject %><br>
내용 : <%=content %><br>
이름 : <%=name %><br>
--%>
</body>
</html>








