<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html,body{
  margin:0;
  padding:0;
  height : 100%;
  
}

header{
  
  height: 20%;
  text-align: center;
  background-color: aliceblue;
}

nav{
  float: left;
  width: 30%;
  height: 100%;
  background-color: beige;
}

section{
  float: left;
  width: 70%;
  height: 100%;
  background-color: mistyrose;
}

footer{
  clear: both;
  height: 20%;
  background-color: aliceblue;
}


</style>
</head>


<body>

    <header><h1>도서관리</h1></header>
      <nav>
        <a href="/jsp2_test/main/index.jsp?req=insertBookForm">도서입력</a><br>
        <a href="../book/bookList.jsp?pg=1">도서목록</a><br>
      </nav>
      <section>
         <c:if test="${param.req ==null}">
           <jsp:include page="../book/insertBookForm.jsp"/>
         </c:if>
         <c:if test="${param.req =='insertBookForm'}">
           <jsp:include page="../book/insertBookForm.jsp"/>
         </c:if>
         <c:if test="${param.req =='insertBookResult'}">
           <jsp:include page="../book/insertBookResult.jsp"/>
         </c:if>  
         
       
         
          <c:if test="${param.req =='bookListResult'}">
           <jsp:include page="../book/bookListResult.jsp"/>
         </c:if> 
         
      </section>
     
       
        <footer><h4>Mingyeong</h4></footer>    
    
</body>
</html>