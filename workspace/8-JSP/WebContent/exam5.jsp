<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   p{
       margin:0;
       padding:0;
   }
</style>
</head>
<body>
<h2>이름과 성적을 입력하세요</h2>
<hr>
  <form action="exam5Pro.jsp">
   <p><label>이름: </label><input type ="text" name ="name"></p>
   <p><label>국어: </label><input type ="text" name ="kor"></p>
   <p><label>영어: </label><input type ="text" name ="eng"></p>
   <p><label>수학: </label><input type ="text" name ="mat"></p>
   <p><input type ="submit" value="입력완료"><input type ="reset" value="다시작성"></p>
   </form>
</body>
</html>