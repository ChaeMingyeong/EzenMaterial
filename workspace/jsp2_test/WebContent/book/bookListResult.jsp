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
   <table border="1">
     <tr>
        <th>도서코드</th>
        <th>도서명</th>
        <th>저자</th>
        <th>출판사</th>
        <th>가격</th>
     </tr>
   
     
     
    <c:forEach var="bookDTO" items="${requestScope.bookList}">
     <tr align="center">
      <td>${bookDTO.code}</td>
      <td>${bookDTO.title}</td>
      <td>${bookDTO.author}</td>
      <td>${bookDTO.publisher}</td>
      <td>${bookDTO.price}</td>    
     </tr>
    </c:forEach> 
     <tr>
       <td colspan="5" align="center">
          
          <c:if test="${startPage > 1 }">
            <a href ="bookList.jsp?pg=${startPage- 1 }">[이전]</a>
          </c:if>
          
          <c:forEach var ="i" begin = "${startPage}" end="${endPage}" step ="1">
         
              <a href ="bookList.jsp?pg=${i}">[${i}]</a>
       
          </c:forEach>
          
            
            <c:if test="${endPage < totalPage }">
               <a href ="bookList.jsp?pg=${endPage +1}">[다음]</a> 
             </c:if>  
          
       
       
       </td>
     </tr>
     
   </table>
    
 
</body>
</html>