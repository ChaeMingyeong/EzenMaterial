<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // 데이터 처리
   // 쿠키 만들기  
   String cookieName = "id";
   Cookie cookie = new Cookie(cookieName, "hongkd");
   // 쿠키 유지시간 설정 : 설정된 시간 동안 브라우저가 요청할 때마다 쿠키정보를 보냄.
   cookie.setMaxAge(60); //60초 설정   (html문서를 보낼 때 쿠키정보도 같이보냄)
   response.addCookie(cookie);     //(정해진 시간안에(60초) 브라우저에 요청할때만 쿠키정보를 보냄)

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>쿠키를 생성하는 페이지</h2>
<form action="useCookie.jsp">
  <input type= "submit" value ="생성된 쿠키확인">
</form>
</body>
</html>