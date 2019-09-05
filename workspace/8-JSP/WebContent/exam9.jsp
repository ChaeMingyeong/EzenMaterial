

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "check.js" > //서버쪽으로 요청하기 직전에 클라이언트쪽에서 입력값검사
    function checkInput() {
		 if(document.frm.id.value ==""){
			 alert("아이디를 입력해주세요");
			 document.frm.id.focus();
		 }else if(document.frm.pw.value ==""){
			  alert("비밀번호를 입력해주세요.");
			  document.frm.pw.focus();
		 }else{
			 document.frm.submit();
			 
		 }
	}
</script>
</head>
<body>
  <h1>회원 인증 화면</h1>
  <form action = "exam9Pro.jsp" name ="frm" method ="post">
  <table>
    <tr>
      <td><label>ID: </label><input type ="text" name = "id"></td>
    
    </tr>
    <tr>
    <td><label>PW: </label><input type ="password" name = "pw"></td>
    </tr>
       
    <tr>
    <td><input type ="button" value ="확인" onclick ="checkInput()"></td>
    </tr>
  </table>
  
  <br>
    
  </form>
   
</body>
</html>