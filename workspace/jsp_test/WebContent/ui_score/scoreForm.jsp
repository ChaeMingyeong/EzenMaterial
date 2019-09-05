<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  function checkInput() {
	if(document.scoreForm.hak.value == ""){
		alert("학번을 입력해주세요");
		document.scoreForm.hak.focus();
	}else if(document.scoreForm.name.value ==""){
		alert("이름을 입력해주세요");
		document.scoreForm.name.focus();
	}else{
		document.scoreForm.submit();
	}
}
</script>
</head>
<body>
  <form action="scoreWrite.jsp"  name ="scoreForm" method ="post">
      <table border="1">
         <tr>
           <th>학번</th>
           <td><input type ="text" name ="hak"></td>
         </tr>
         <tr>
           <th>이름</th>
           <td><input type ="text" name ="name"></td>
         </tr>
         <tr>
           <th>국어</th>
           <td><input type ="text" name ="kor"></td>
         </tr>
         <tr>
           <th>영어</th>
           <td><input type ="text" name ="eng"></td>
         </tr>
         <tr>
           <th>수학</th>
           <td><input type ="text" name ="mat"></td>
         </tr>
         <tr>
           <th colspan="2" align="center">
             <input type ="button" value ="성적입력" onclick="checkInput()">
             <input type ="reset" value ="다시입력">
           </th>
         </tr>
      
      </table>
  </form>
</body>
</html>