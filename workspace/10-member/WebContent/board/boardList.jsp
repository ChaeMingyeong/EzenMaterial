<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="score.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int pg = Integer.parseInt(request.getParameter("pg"));
	String id = (String) session.getAttribute("memId");
	String name = (String) session.getAttribute("memName");

	List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
	BoardDAO boardDAO = new BoardDAO();

	int endNum = 5 * pg;    //한페이지의 게시글
	int startNum = endNum - 4; //한 페이지의 게시글  (1~5, 6~10)
     
	int startP =  ((pg -1) /3)*3 + 1; //페이지블럭 시작값
	int endP = startP + 2;          //페이지블럭 끝값
	
	
	boardlist = boardDAO.viewBoard(startNum, endNum);
	int totalcnt = boardDAO.totalCnt(); //총게시글 수 
	int totalpage = (totalcnt + 4) / 5; //총 페이지 수 
	if(totalpage < endP) {endP = totalpage; }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
    function isLogin(seq) {
		<%if (session.getAttribute("memId") == null) {%>
			  alert("먼저 로그인 해주세요");
			  location.href ="../main/index.jsp";
		<%} else {%>
		     location.href ="boardView.jsp?seq=" + seq; // string 
		<%}%>
	}
</script>
</head>
<body>

	<%=startNum%>
	<%=endNum%>
	<table border="1">
		<tr bgcolor="mistyrose">
			<th width="70">글번호</th>
			<th width="200">제목</th>
			<th width="100">작성자</th>
			<th width="70">작성일</th>
			<th>조회수</th>
		</tr>
		<%
			for (BoardDTO boardDTO : boardlist) {
		%>
		<!-- 리스트의 경우 확장포문이 더 간편 -->
		<tr bgcolor="#ffffcc" align="center">
			<td><%=boardDTO.getSeq()%></td>
			<td><a href="#" onclick="isLogin(<%=boardDTO.getSeq()%>)"><%=boardDTO.getSubject()%></a></td>
			<td><%=boardDTO.getName()%></td>
			<td><%=boardDTO.getLogtime()%></td>
			<td><%=boardDTO.getHit()%></td>
		</tr>


		<%
			}
		%>

		<tr>
		    <td colspan="5" align="center">
		     
		     <%if(startP>3) { %>
		     <a href= "boardList.jsp?pg=<%=startP -1 %>">[이전]</a>
		     <% } %>
		      
		    
			<%
				for (int i = startP; i <= endP ; i++) {
			%>
			  
			  <a href ="boardList.jsp?pg=<%=i %>"><%=i %></a>
			<%
				}
			%>
			  <% if(endP<totalpage) {%>
		           <a href= "boardList.jsp?pg=<%=endP+1%>">[다음]</a>
		      <%  } %>
			</td>
		</tr>

	</table>
     <a href="../main/index.jsp">메인화면</a>
     <%=startP%>~<%= endP %>


</body>
</html>