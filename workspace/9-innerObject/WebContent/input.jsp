<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   function checkInput() {
	  if(document.frm.x.value ==""){
		  alert("X 입력값이 없습니다.");
		  document.frm.x.focus();
	  }else if(document.frm.y.value ==""){
		  alert("Y 입력값이 없습니다.");
		  document.frm.y.focus();
	  }else{
		  document.frm.submit(); //제출(여기서 제출할 시에는  html문서의 
				                 //submit을 button으로 바꾸고 onclick 속성에 함수이름을 부여함 )
	  }
}
</script>
</head>
<body>
                               <!-- form에 있는 name은 입력값을 검사하기 위함 -->                                
  <form action="result2.jsp" name = "frm" method="get">
  <table border ="1" >
    <tr align ="center">
       <th width ="30"><label>X</label></th>
       <td><input type ="text" name ="x"></td>
    </tr>
    
    <tr align ="center">
       <th><label>Y</label></th>
       <td><input type ="text" name ="y"></td>
     </tr>  
    <tr >   
       <td colspan ="2" align ="center"><input type ="button" value ="계산" onclick="checkInput()" >
       <input type ="reset"  value ="원래대로">
       </td>
    </tr>
  </table>
   </form>
</body>
</html>