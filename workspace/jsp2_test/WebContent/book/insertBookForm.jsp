<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function checkBookWrite() {
	if(document.insertBookForm.code.value == "") {
		alert("도서코드를 입력하세요");
		document.insertBookForm.code.focus();
	} else if(document.insertBookForm.title.value == "") {
		alert("도서제목을 입력하세요");
		document.insertBookForm.title.focus();
	} else if(document.insertBookForm.author.value == "") {
		alert("저자를 입력하세요");
		document.insertBookForm.author.focus();
	} else {
		document.insertBookForm.submit();
	}
}


</script>
</head>
<body>
<h2>도서입력</h2>
  <form action="../book/insertBook.jsp" name ="insertBookForm" method ="post">
   <table border="1">
     <tr>
        <th>도서코드</th>
        <th>도서명</th>
        <th>저자</th>
        <th>출판사</th>
        <th>가격</th>
     </tr>
     <tr>
        <td><input type = "text" name ="code"></td>
        <td><input type = "text" name ="title"></td>
        <td><input type = "text" name ="author"></td>
        <td><input type = "text" name ="publisher"></td>
        <td><input type = "text" name ="price"></td>
     </tr>
   </table>
    <input type ="button" value= "도서입력" onclick="checkBookWrite()">
    <input type ="reset" value= "다시작성">
    </form>
</body>
</html>