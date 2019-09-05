<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

   
    // 데이터
	int pg = Integer.parseInt(request.getParameter("pg"));
	// 5개씩 목록 보여주기
	// (1, 5)
	// (6, 10)
	// (11, 15)
	// (16, 20)	
	int endNum = pg * 5;
	int startNum = endNum - 4;
	
	BoardDAO boardDAO = new BoardDAO();
	List<BoardDTO> list = boardDAO.boardList(startNum, endNum);
	
	/* 페이징 처리 (목록은 5줄 씩)
	      총페이지 수 = (총글수 + 4)/5
	    총글수 : 12
	    총페이지수:3		[1][2][3]
	  
	    총글수 : 23
	    총페이지수:5		[1][2][3][4][5]
	*/
	int totalA = boardDAO.getTotalA();	// 총글수
	int totalP = (totalA + 4) / 5;	// 총페이지수
	/* 페이지는3개씩 끊어서 보여줌
		총페이지수 : 8
			 [1][2][3][다음]
		[이전][4][5][6][다음]
		[이전][7][8]
	*/
	int startPage = (pg-1)/3*3 + 1;	
	int endPage = startPage + 2;
	if(totalP < endPage) endPage = totalP;
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
<script type="text/javascript">
	function isLogin(seq) {
		<% if(session.getAttribute("memId") == null) { // 로그아웃 상태%>
				alert("먼저 로그인 하세요.");
				location.href="../main/index.jsp";
		<% } else { // 로그인 상태 %>
				location.href="boardView.jsp?seq=" + seq + "&pg=<%=pg%>";
		<% } %>
	}
</script>

<style type="text/css">
#paging {
	color: blue;
	text-decoration: none;	
}
#currentPaging {
	color: red;
	text-decoration: underline;
}

#subjectA:link {color: black; text-decoration: none;}
#subjectA:visited {color: black; text-decoration: none;}
#subjectA:achive {color: black; text-decoration: none;}
#subjectA:hover {color: blue; text-decoration: underline;}
</style>
</head>
<body>
<table border="1">
	<tr bgcolor="#ffff00">
		<th width="70">글번호</th>
		<th width="200">제목</th>
		<th width="100">작성자</th>
		<th width="100">작성일</th>
		<th width="70">조회수</th>
	</tr>
<%-- for(int i=0; i<list.size(); i++) { 
	BoardDTO boardDTO = list.get(i);
--%>
<% for(BoardDTO boardDTO : list) { %>	
	<tr bgcolor="#ffffcc" align="center">
		<td><%=boardDTO.getSeq() %></td>
		<td><a id="subjectA" href="#" onclick="isLogin(<%=boardDTO.getSeq() %>)">
			<%=boardDTO.getSubject() %>
			</a>
		</td>
		<td><%=boardDTO.getName() %></td>
		<td><%=boardDTO.getLogtime() %></td>
		<td><%=boardDTO.getHit() %></td>
	</tr>
<% } %>	
	<tr>
		<td colspan="5" align="center">
		<% if(startPage > 3) { %>
			[<a id="paging" href="boardList.jsp?pg=<%=startPage-1 %>">이전</a>]
		<% } %>
			
		<% for(int i=startPage; i<=endPage; i++) { %>
			<%if(pg==i) { %> 	
			[<a id="currentPaging" href="boardList.jsp?pg=<%=i %>"><%=i %></a>]
			<% } else { %>
			[<a id="paging" href="boardList.jsp?pg=<%=i %>"><%=i %></a>]	
			<% } %>
		<% } %>
		
		<% if(endPage < totalP) { %>
			[<a id="paging" href="boardList.jsp?pg=<%=endPage+1%>">다음</a>]
		<% } %>
		</td>
	</tr>
</table>
<a href="../main/index.jsp">메인 화면</a>&nbsp;&nbsp;
<a href="boardWriteForm.jsp">글쓰기</a>
</body>
</html>











