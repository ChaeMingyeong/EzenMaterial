<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type ="text/css">
   p{
      margin:0;
      paddion: 0;
   
   } 
</style>
</head>
<body>
  <form action ="exam4Pro.jsp" method ="get">
     <p><label>이름: </label> <input type ="text" name ="name"></p>
     <p><label>나이: </label><input type ="text" name = "age"></p>
     
     <input type ="submit" value ="입력완료">
     <input type ="reset" value ="다시작성">
  </form>

</body>
</html>