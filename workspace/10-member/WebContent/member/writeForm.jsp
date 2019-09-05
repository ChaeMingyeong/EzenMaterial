<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src ="../script/memberScript.js?v=1">
</script>
</head>
<body>
  <form action="write.jsp" name ="writeForm" method = "post">
    <table border="1">
      <tr>
         <td align="center">이름</td>
         <td><input type ="text" name ="name" placeholder="이름입력"></td>
      </tr>
      <tr>
        <td align="center">아이디 </td>
        <td>
        <input type = "text" name ="id">
        <input type = "button" value ="중복체크" onclick="checkId();">
        </td>
          
      </tr>
      <tr>
        <td align="center">비밀번호 </td>
        <td><input type = "password" name ="pwd" size="30"></td>
      </tr>
      <tr>
       <td align="center">재확인 </td>
       <td><input type = "password" name ="confirm"></td>
      </tr>
      <tr>
       <td align="center">성별 </td>
       <td><input type="radio" name ="gender" value ="0" checked>남
       <input type="radio" name ="gender" value ="1">여</td>
      </tr>
      <tr>
        <td align="center">이메일</td>
        <td><input type ="text" name= "email1">@
        <select name = "email2" >
         <option value ="naver.com">naver.com</option>
         <option value ="daum.com">daum.net</option>
        </select>
        </td>
      </tr>
      <tr>
        <td align="center">핸드폰</td>
         <td><select  name ="tel1">
           <option value ="010">010</option>
           <option value ="031">031</option>
           <option value ="02">02</option>-
         </select>-
         <input type ="text" name = "tel2">-
         <input type ="text" name = "tel3">
        </td>
      </tr>
      <tr>
      <td align="center">주소</td>
          <td><input type = "text" name="addr" size="50"></td>
      </tr>
      <tr>
         <td align="center" colspan="2">
          <input type ="button" value="회원가입" onclick="inputConfirm();">
          <input type ="reset" value="다시작성">
         </td>
      </tr>
      
    </table>
  
  </form>
 <a href ="../main/index.jsp">메인화면</a>


</body>
</html>