<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 html, body{
    margin:0;
    padding:0;
    height : 100%;
    width: 100%;
 }
 
 header{
  
  height: 20%;
  text-align: center;
  
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
    
      <header><h1>성적관리</h1></header>
      
      <nav>
        <ul>
        <li><a href="index.jsp">메인화면</a></li>
        <li><a href="scoreWriteForm.do">성적입력</a></li>
        <li><a href="scoreList.do">성적목록</a></li>
        </ul>
  
      </nav>
      
      <section>
         <c:if test="${req_page ==null }">
           <jsp:include page="body.jsp"/>
         </c:if>
         
         <c:if test="${req_page !=null }">
           <jsp:include page="${req_page }"/>
         </c:if>
      
      </section>
      <footer>mingyeong</footer>
      
      
    
     
</body>
</html>