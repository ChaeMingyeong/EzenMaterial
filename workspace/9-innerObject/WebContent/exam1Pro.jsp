<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //데이터처리가 목적
    //post 방식에서의 한글처리(문자열이아닌스트림방식으로 넘어오기때문)
    //request.setCharacterEncoding("UTF-8");
    String hak = request.getParameter("hak");
    String name = request.getParameter("name");
    int grade =Integer.parseInt(request.getParameter("grade"));
    String subject = request.getParameter("subject");
    
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <table border ="1">
     <tr align="center"> 
       <td width ="150">
            학번
       </td>
       <td width ="150">
         <%= hak %>
       </td>
     </tr>
     <tr align="center"> 
       <td width ="150">이름</td>
       <td width ="150"><%= name %></td>
     </tr>
    <tr align="center">
      <td width ="150">학년</td>
       <td width ="150"><%=grade %></td>
    </tr>
    <tr align="center">
      <td width ="150">선택과목</td>
       <td width ="150"><%=subject %></td>
    </tr>
   </table>
</body>
</html>