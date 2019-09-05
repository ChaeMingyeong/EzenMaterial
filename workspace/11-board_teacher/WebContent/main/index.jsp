<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
*** 메인 화면 ***<br>
<a href="../board/boardList.jsp?pg=1">글목록</a><br>
<% if(session.getAttribute("memId") == null) { // 로그 아웃 상태%>
<a href="../member/writeForm.jsp">회원가입</a><br>
<a href="../member/loginForm.jsp">로그인</a><br>
<% } else { // 로그인 상태%>
<a href="../board/boardWriteForm.jsp">글쓰기</a><br>
<a href="../member/logout.jsp">로그아웃</a><br>
<a href="../member/modifyForm.jsp">회원정보수정</a><br>
<a href="../member/deleteForm.jsp">회원탈퇴</a><br>
<a href="../member/memberList.jsp?pg=1">회원목록</a><br>
<% } %>
</body>
</html>












