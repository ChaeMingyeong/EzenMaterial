<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <table border="1">
      
     
    <tr>
      <td rowspan="4"><img src ="../storage/${imageboardDTO.image1}" width="150" height="150"></td>
      <td>상품명: ${imageboardDTO.imageName} </td>     
     </tr>
     <tr>
       <td width="150">단가: ${imageboardDTO.imagePrice} </td>     
     </tr>
     <tr>
       <td>개수: ${imageboardDTO.imageQty} </td>     
     </tr>
      <tr>
       <td>합계: ${imageboardDTO.imageQty * imageboardDTO.imagePrice}</td>     
     </tr> 
     <tr>
      <td rowspan="5" colspan="2" height="150">
       <pre>${imageboardDTO.imageContent}</pre>
      </td>
     </tr>
  </table>
   
   <input type ="button" value ="이전목록" onclick="location.href ='imageboardList.jsp?pg=${pg}'">
   <input type ="button" value ="삭제" onclick="location.href = 
   'imageboardDelete.jsp?seq=${seq}&imagName=${imageboardDTO.imageName}'">
    <form action="imageboardDelete.jsp" method ="post" style="display: inline-block;">
        <input type = "hidden" name ="seq" value ="${seq}">
        <input type = "hidden" name ="imageName" value ="${imageboardDTO.imageName}">
        <input type ="submit" value ="삭제2">
    </form> <!-- 한글 섞인 데이터는 form태그 써서 데이터 보냄 -->
   <input type ="button" value ="수정" 
   onclick="location.href ='imageboardModifyFormReady.jsp?seq=${seq}&pg=${pg}'"> <!-- 같은 파일이기에 바로보냄 -->
</body>
</html>