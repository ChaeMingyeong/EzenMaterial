<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
     
<body>
   <form action ="exam6Pro.jsp">
    <h2>이름과 전화번호를 입력하세요.</h2>
    <label>이름: </label><input type ="text" name = "name"><br>
    <label>전화번호: </label>
    <select name ="seltel">
       <option value ="서울">서울</option>
       <option value ="경기">경기</option>
       <option value ="강원">강원</option>
    </select>-
    <input type ="text" name = "tel"><br>
    <input type ="submit" value ="제출"> 
    <input type ="reset" value ="다시 작성"> 
    </form>
</body>
</html>