<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	// 쿠키 정보 삭제 : 브라우저에게 쿠키정보를 더이상 보내지마라 설정
/*	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("memName")) {
				cookies[i].setMaxAge(0);	// 쿠키 삭제 요청
				response.addCookie(cookies[i]);
			} else if(cookies[i].getName().equals("memId")) {
				cookies[i].setMaxAge(0);	// 쿠키 삭제 요청
				response.addCookie(cookies[i]);
			}
		}
	}
*/	
	// 세션 삭제
	session.removeAttribute("memName");
	session.removeAttribute("memId");
	
	session.invalidate();	// 무효화, 전부 삭제
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	/* <body onload="함수명"> 과 같은 기능 */
	window.onload = function() {
		alert("로그아웃");
		location.href = "../main/index.jsp";
	}
</script>
</head>
<body >
<p>로그아웃</p>
</body>
</html>






