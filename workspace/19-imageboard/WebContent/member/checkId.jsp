<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	// 데이터 처리
	String id = request.getParameter("id");
	// DB 처리
	MemberDAO memberDAO = new MemberDAO();
	boolean exist = memberDAO.isExistId(id);	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkIdClose() {
		opener.writeForm.id.value = "<%=id%>";
		window.close();
		opener.writeForm.pwd.focus();
	}
</script>
</head>
<body>
<form action="checkId.jsp" method="post">
<% if(exist) { %>
	<p><%=id %>는 사용중입니다.</p>	
	<p>
		아이디 <input type="text" name="id">
		<input type="submit" value="중복체크">
	</p>
<% } else { %>
	<p><%=id %>는 사용 가능합니다.</p>
	<p><input type="button" value="사용" onclick="checkIdClose()"></p>
<% } %>
</form>
</body>
</html>









