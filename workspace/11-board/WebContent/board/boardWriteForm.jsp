<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<h2 style ="text-align: center;">글쓰기</h2>
<script type="text/javascript" src = "../script/boardScript.js"></script>
</head>
<body>
  <form action="boardWrite.jsp" name ="boardWriteForm" method ="post">
    <table border="1" style ="margin: auto;">
       <tr>
         <th width ="50">제목</th>
         <td><input type ="text" name ="subject" size = "59"></td>
       </tr>
       <tr>
         <th>내용</th>
         <td><textarea rows ="15" cols ="45" name ="content"></textarea></td>
       </tr>
       <tr>
          <td colspan="2" align="center">
          <input type="button" value ="글쓰기" onclick ="checkBoardWrite()">
          <input type="reset" value ="다시작성" onclick ="">
          </td>
        </tr>
    </table>
  
  </form>
</body>
</html>