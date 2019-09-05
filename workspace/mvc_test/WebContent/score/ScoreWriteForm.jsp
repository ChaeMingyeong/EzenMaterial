<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#table {
	border: 1px solid lightgray;
}

#pInfo {
	
}
</style>
</head>
<script type="text/javascript">
  function chkInput() {
	if(document.ScoreWriteForm.hak.value == "") {
		alert("학번을 입력하세요");
		document.ScoreWriteForm.hak.focus();
	} else if(document.ScoreWriteForm.name.value == "") {
		alert("이름을 입력하세요");
		document.ScoreWriteForm.name.focus();
	} else {
		document.ScoreWriteForm.submit();
	}
 }
</script>
<body>
	<form action="scoreWritePro.do" method="post" name="scoreForm" >
		<table style="width: 400px;" border="1">
			<tr id="pInfo">
				<td colspan="2">학번: <input type="text" name="hak" size="15"> 이름:
					<input type="text" name="name" size="20">
				</td>
			</tr>

			<tr>
				<td>국어: <input type="text" name="kor"></td>

			</tr>
			<tr>
				<td>영어: <input type="text" name="eng"></td>

			</tr>
			<tr>
				<td>수학: <input type="text" name="mat"></td>
			</tr>
			<tr>
				<td>한국사: <input type="text" name="his"></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="성적입력"> <input type="reset" value="다시입력"></td>
			</tr>
		</table>
	</form>
</body>
</html>