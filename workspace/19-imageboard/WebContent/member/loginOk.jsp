<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 	// 데이터 처리
	request.setCharacterEncoding("utf-8");
	//String name = request.getParameter("name");
	//String id = request.getParameter("id");
	
	String name = "";
	String id = "";
	/* 데이터 공유 1 : 쿠키 이용 */
/*	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("memName")) {
				name = URLDecoder.decode(cookies[i].getValue(), "UTF-8");
			} else if(cookies[i].getName().equals("memId")) {
				id = cookies[i].getValue();
			}
		}
	}
*/	
	/* 데이터 공유 2 : 세션 이용 */
	name = (String)session.getAttribute("memName");
	id = (String)session.getAttribute("memId");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img alt="tumi" src="../image/tumi.png" width="30" height="30"
		onclick="location.href='../main/index.jsp'" 
		style="cursor: pointer;">
	<%=name %>(<%=id %>)님이 로그인
</body>
</html>








