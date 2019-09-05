<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <table>
       <tr>
         <th>학번</th>
         <th>이름</th>
         <th>국어</th>
         <th>영어</th>
         <th>수학</th>   
         <th>한국사</th>   
       </tr>
     
     <c:forEach var="bean" items="${list}">
     <tr>
        <td>${bean.hak}</td>
        <td>${bean.name}</td>
        <td>${bean.kor}</td>
        <td>${bean.eng}</td>
        <td>${bean.mat}</td>
        <td>${bean.tot}</td>
        <td>${bean.avg}</td>
     </tr>
     </c:forEach>
     
     <tr>
       <td colspan="5" align="center">
       
         
         <c:if test="${startPage>1}">
           [<a href="scoreList.do?pg=${startPage -1 }">이전</a>]
         </c:if>  
       <c:forEach var="i" begin="${startPage+1}" end="${endPage}" step ="1">
          <c:if test ="${i==pg }">
            [<a id ="currentPaging" href ="scoreList.do?pg=${i}">${i}</a>]
           </c:if>  
           <c:if test="${i !=pg}">
             [<a id ="paging" href ="scoreList.do?pg=${i}">${i}</a>]
           </c:if>
       </c:forEach> 
          <c:if test="${endPage<totalP }">
                  [<a href="scoreList.do?pg=${endPage +1 }">다음</a>]
          </c:if>            
       </td>
     </tr> 
       
        
       
    
    </table>
     
</body>
</html>