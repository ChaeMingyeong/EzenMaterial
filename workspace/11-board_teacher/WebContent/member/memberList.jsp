<%@page import="java.util.List"%>
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
   int pg = Integer.parseInt(request.getParameter("pg"));
   //DB처리
   //목록 5개씩 끊어서 가져오기
   //pg=1 rn>=1 and rn<=5
   //pg=2 rn>=6 and rn<=10
   //pg=3 rn>11 and rn<=15
   int endNum = pg*5;
   int startNum = endNum -4;

    // DB 처리
	MemberDAO memberDAO = new MemberDAO();
	List<MemberDTO> list = memberDAO.selectList(startNum, endNum);
	
	
	/* 페이징 처리
	    총글수(총회원수) : 12
	    총페이지수: 3
	    
	    총글수(총회원수) : 23
	    총페이지수: 5
	    
	    총페이지수= (총회원수 +4)/5;
	      
	*/
	
	int totalMember =memberDAO.getTotalMember(); //총 회원수
	int totalP =(totalMember + 4)/5;  //총 페이지수 
	
	/* 3블럭 나눠서 보여주기 
	     총페이지수: 8 
	   [1][2][3][다음]
      [이전][4][5][6][다음]
	  [이전][7][8]				   
	*/
	int startPage =(pg-1)/3*3 + 1;   //(3블럭씩 3*3, 10블럭씩 10*10 공식임)
	int endPage = startPage + 2;
	if(totalP< endPage) endPage = totalP;
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr style="background: orange;">
		<th width="50">이름</th>
		<th width="100">아이디</th>
		<th width="50">성별</th>
		<th width="150">이메일</th>
		<th width="150">전화번호</th>
		<th width="150">가입일</th>
	</tr>
<% for(int i=0; i<list.size(); i++) { 
	MemberDTO memberDTO = list.get(i);
%>	
	<tr align="center">
		<td><%=memberDTO.getName()%></td>
		<td><%=memberDTO.getId()%></td>
		<td><%=memberDTO.getGender()%></td>
		<td><%=memberDTO.getEmail1()%>@<%=memberDTO.getEmail2()%></td>
		<td><%=memberDTO.getTel1()%>-
			<%=memberDTO.getTel2()%>-
			<%=memberDTO.getTel3()%>
		</td>
		<td><%=memberDTO.getLogtime()%></td>
	</tr>
<% } %>	
   <!-- 페이징 -->
   <tr>
             
      <td colspan="6" align="center">
         <% if(startPage > 1 ) { %>
            [<a href ="memberList.jsp?pg=<%=startPage-1%>">이전 </a>]   
         <% } %>  
           
          
        <% for(int i=startPage; i<=endPage; i++) { %>
            [<a href ="memberList.jsp?pg=<%=i%>"> <%=i%> </a>]
       <% } %>
         
         <% if(endPage < totalP ) { %>
            [<a href ="memberList.jsp?pg=<%=endPage+1%>">다음 </a>]   
         <% } %>  
       
      
      </td>
   </tr>
</table>
</body>
</html>



