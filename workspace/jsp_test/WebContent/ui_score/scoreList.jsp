<%@page import="dao.ScoreDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.ScoreDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    int pg = Integer.parseInt(request.getParameter("pg"));
    
   //1페이지당 학생점수 10개
   //pg = 1 rn>=1 , rn <=10
   //pg = 2 rn>=11, rn <=20
   //pg = 3 rn>=21, rn <=30
    int endnum = pg * 10;
    int startnum = endnum -9;

    List<ScoreDTO> scoreList = new ArrayList<ScoreDTO>(); 
    ScoreDAO scoreDAO = new ScoreDAO();
    scoreList = scoreDAO.viewList(startnum, endnum);
    
    /* 
     총글수 (총학생점수): 52
     총페이지수: 6개
  
     총글수 (총학생점수): 49
     총페이지수: 5개
    
   
    */
   
   int totalStudent = scoreDAO.getTotalStu(); //총 학생수(점수의 개수)
   int totalPage = (totalStudent + 9)/ 10;  
   
   /* 5블럭씩 나눠서 보여주기 
     [1][2][3][4][5][다음]
    		 
     [이전][6][7][8][9][10][다음]	
    	
     [이전][11][12][13][다음]
   
   */
   
   int startPage = ((pg-1)/3)*3 + 1;
   int endpage = startPage + 2;
   if(endpage > totalPage) {
	   endpage = totalPage;
   }
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <table border="1">
      <tr>
        <th>학번</th>
        <th>이름</th>
        <th>국어</th>
        <th>영어</th>
        <th>수학</th>
        <th>총점</th>  
        <th>평균</th>     
      </tr>
      
      <% for(int i=0; i<scoreList.size(); i++) {
    	  ScoreDTO scoreDTO = scoreList.get(i);
    	  int tot = scoreList.get(i).getKor() + scoreList.get(i).getEng() + scoreList.get(i).getMat(); 
    	  
    	  double avg = (double)tot/3;
    	  double avg2 = Double.parseDouble( String.format( "%.2f" , avg));
    	  %>
            
      <tr align="center">
        <th><%= scoreDTO.getHak() %></th>
        <th><%= scoreDTO.getName() %></th>
        <th><%= scoreDTO.getKor() %></th>
        <th><%= scoreDTO.getEng() %></th>
        <th><%= scoreDTO.getMat() %></th> 
        <th><%= tot %></th> 
        <th><%= avg2 %></th>    
      </tr>
      <%  } %>
      
      <tr>
         <td colspan="7" align="center">
          <% if(startPage>1) { %>
           <a href = "scoreList.jsp?pg=<%= startPage -1 %>">[이전]</a>
            <% }else{ %>
            	<a></a>
            <% }%>
            
            <%for(int i=startPage; i<=endpage; i++) {%> 
                <a href = "scoreList.jsp?pg=<%= i %>"><%= i %></a>
                <% } %>
          <%if(endpage < totalPage) { %>      
           <a href = "scoreList.jsp?pg=<%= endpage + 1 %>">[다음]</a>
           <%}else{%>
        	   <a></a> 
           <% } %>
          
         </td>
      
      </tr>
      
   </table>
</body>
</html>