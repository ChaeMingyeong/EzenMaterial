<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<font color="red"><b>
exam2.jsp -> send.jsp => sendResult.jsp로 페이지 이동합니다.<br>s
sendRedirect로 이동하므로 데이터는 공유하지 않습니다.<br>
주소창에는 주소가 sendResult.jsp가 보이고, 결과도 sendResult.jsp 입니다. <br>
</b></font>
<hr>
<font color ="blue"><b>
exam2.jsp -> forward.jsp -> forwardResult.jsp로 페이지이동합니다. 
forward로 이동하므로 데이터는 공유합니다.
주소창에는 주소가 forward.jsp가 보이지만, 결과는 forwardResult.jsp 입니다.
</b></font>

<a href= "send.jsp">sendRedirect</a> &nbsp;&nbsp;&nbsp;
<a href ="forward.jsp">forward</a>
</body>
</html>