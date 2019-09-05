<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h2>학번, 이름, 학년 ,선택과목을 입력하는 폼</h2>
   
   <form action="exam1Pro.jsp">
      <p><label>학번: </label><input type ="text" name ="hak"></p>
      <p><label>이름: </label><input type ="text" name ="name"></p>
      <p><label>학년: </label>
      <input type ="radio" value ="1"name = "grade">1학년
      <input type ="radio" value ="2"name = "grade">2학년
      <input type ="radio" value ="3"name = "grade">3학년
      <input type ="radio" value ="4"name = "grade">4학년
      </p> 
      <p><label>선택과목: </label>
         <select name ="subject">
          <option value="jsp">JSP</option>
          <option value="javascript">JAVASCRIPT</option>
          <option value ="html">HTML</option>
         </select>
      </p>
      <p><input type ="submit" value =" 입력완료"></p>
   </form>
</body>
</html>