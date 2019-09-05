<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
html, body {
	padding: 0;
	margin: 0;
	height: 100%;
}

header {
	border-bottom: 1px solid gray;
	width: 100%;
	text-align: center;
}

header h1 {
	
}

nav {
	float: left;
	width: 30%;
	height: 90%;
	background-color: orange;
}

section {
	float: left;
	width: 70%;
}

footer {
	border-top: 1px solid gray;
	clear: both;
}
</style>
</head>
<body>

	<div>
		<header>
			<h1>20-board 게시판</h1>
		</header>
	</div>
	<div></div>
	<nav>
		<h4>
			<a href="index.jsp">*** 메인화면 *** </a>
		</h4>
		<ul>
			<!-- 무조건 서블릿 거쳐서  -->
			<li><a href="boardList.do">게시판 목록</a></li>


			<c:if test="${memId == null}">
				<li><a href="writeForm.do">회원가입</a></li>
				<li><a href="loginForm.do">로그인</a></li>
			</c:if>

			<c:if test="${memId !=null }">
				<li><a href="boardWriteForm.do">게시판 글쓰기</a></li>
				<li><a href="logout.do">로그아웃</a></li>
				<li><a href="modifyForm.do">회원정보수정</a></li>
				<li><a href="memberDeleteForm.do">회원탈퇴</a></li>
				<li><a href="memberList.do">회원목록</a></li>
			</c:if>

		</ul>
	</nav>
	<section>
		<c:if test="${req_page ==null }">
			<jsp:include page="body.jsp" />
		</c:if>

		<c:if test="${req_page !=null }">
			<jsp:include page="${req_page }" />
		</c:if>



	</section>
	<footer>Mingyeong</footer>
	</div>
</body>
</html>