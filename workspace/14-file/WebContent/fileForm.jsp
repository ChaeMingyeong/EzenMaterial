<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일</title>
</head>
<body>
<!-- endcoing 타입이 multipart 의 경우는 데이터를 문자열이아닌 파일과 문자열을 같이보냄 -->
<form action="fileUpload.jsp" method="post" 
      enctype="multipart/form-data"> 
     <table border="1">
        <tr>
           <th width="50">제목</th>
           <td><input type ="text" name ="subject" size ="50"></td>
        </tr>
        <tr>
           <th>내용</th>
           <td><textarea rows ="15" cols ="45" name ="content"></textarea></td>
        </tr>
        <tr>
           <td colspan="2">
              <input type ="file" name ="upload1" size ="50">
           </td>
        </tr>
        <tr>
           <td colspan="2">
              <input type ="file" name ="upload2" size ="50">
           </td>
        </tr>
        <tr>
           <td colspan="2" align="center">
              <input type = "submit" value ="파일업로드">
              <input type="reset" value ="다시작성">
           </td>
        </tr>
     </table>
</form>
</body>
</html>