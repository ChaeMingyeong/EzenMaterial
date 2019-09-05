<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String op = request.getParameter("op");
	String str_first = request.getParameter("first");
	String str_second = request.getParameter("second");

	double first = 0;
	double second = 0;
	double aa = 0;
	String errMsg = ""; //에러가 없는 상태 
	if (!str_first.equals("") && !str_second.equals("")) {
		first = Double.parseDouble(str_first);
		second = Double.parseDouble(str_second);
		switch (op) {
		case "+":
			aa = first + second;
			break;
		case "-":
			aa = first - second;
			break;
		case "*":
			aa = first * second;
			break;
		case "/":
			if (second != 0) {
				aa = first / second;
				break;
			}
		}
	} else {
		errMsg = "입력값이 없습니다.";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <% if(errMsg.equals("")) { %>
     <p><%= first %> <%= op %> <%=second %> = <%= aa %></p>
	 <% }   else { %> 
       <p><%= errMsg %></p>
	   <% } %>
</body>
</html>