
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@page import="org.apache.catalina.filters.SetCharacterEncodingFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); //한글처리
	String id = (String) session.getAttribute("memId");
	String name = (String) session.getAttribute("memName");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");

	BoardDTO boardDTO = new BoardDTO();
	boardDTO.setId(id);
	boardDTO.setName(name);
	boardDTO.setSubject(subject);
	boardDTO.setContent(content);
	
	
	BoardDAO boardDAO = new BoardDAO();
	int su = boardDAO.writeBoard(boardDTO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<% if(su>0){ %>
	   작성하신 글을 저장했습니다. 	   
	 <% }else {%>
	    저장실패  
	  <%  } %>
	
</body>
</html>