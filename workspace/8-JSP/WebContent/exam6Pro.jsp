<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String name = request.getParameter("name");
   String tel =  request.getParameter("tel");
   String seltel = request.getParameter("seltel");
    String aa = "";
   if(seltel.equals("서울")){
	   aa = "02";
   }else if(seltel.equals("경기")){
	   aa ="031";
   }else if(seltel.equals("강원")){
	    aa = "022";
   }; 
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <%= name %> 님의 전화번호는 <%= aa %>- <%= tel %> 입니다. 
</body>
</html>