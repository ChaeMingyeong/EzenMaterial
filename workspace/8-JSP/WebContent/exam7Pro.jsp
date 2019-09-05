<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
        int box = Integer.parseInt(request.getParameter("box"));
      String aa ="";
      switch(box){
      case 0: aa ="서울"; break;
      case 1: aa = "부산";  break;
      case 2: aa = "경기";  break;
      case 3: aa ="춘천";  break;
      case 4: aa = "강원";  break;
      case 5: aa ="대구";  break;
      case 6: aa = "제주";  break;
      }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    선택하신 지역은 <%= aa %> 입니다. 
</body>
</html>