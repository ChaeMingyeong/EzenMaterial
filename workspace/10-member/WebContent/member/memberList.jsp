<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
     
     MemberDAO memberDAO = new MemberDAO();            
     List<MemberDTO> memlist = new ArrayList<MemberDTO>();
     memlist = memberDAO.selectList();
     
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
</head>
<body>
  
    
  
   <table border= "1px solid gray">
          <tr style="background: orange;" align= center>
          
    	     <th width="50">이름</th>
    	     <th width="50">아이디</th>
    	     <th width="50">성별</th>
    	     <th width="100" colspan="2">이메일</th>
    	     <th width="150" colspan="3">전화번호</th>
    	    
    	   </tr>
    <%for(int i =0; i< memlist.size(); i++){%>
    	   
    	   <tr align="center"> 
    	   <td bgcolor="mistyrose"><%= memlist.get(i).getName() %></td>
    	   <td><%= memlist.get(i).getId() %></td>
    	   <td>
    	    <% if(memlist.get(i).getGender().equals("0")){ %>
    	                남자
    	       
    	     <%} else { %>
    	              여자
    	    <% }%>
    	   </td>
    	   <td colspan="2"><%= memlist.get(i).getEmail1() %> 
    	      <%= memlist.get(i).getEmail2() %>
    	   </td>
    	   <td colspan="3"><%= memlist.get(i).getTel1() %>
    	      <%= memlist.get(i).getTel2() %>
    	      <%= memlist.get(i).getTel3() %>
    	   </td>
    	   </tr>
     <%}%>
   
   </table>
    
  
  

</body>
</html>