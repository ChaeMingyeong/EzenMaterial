<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 등록</title>
<script type="text/javascript" src="../script/imageboardScript.js"></script>
</head>
<body>
	<h3>이미지 수정</h3>
	<form action="../imageboard/imageboardModify.jsp" method="post"
		name="modifrm" enctype="multipart/form-data">
		<input type="hidden" name="seq" value="${seq}">
		<!-- hidden데이터로 기존 값에 묻어보냄 -->
		<input type="hidden" name="pg" value="${pg}">
		<!-- modifyFormReady =>modifyform => modify 순서로 넘어간다.-->
		<!-- modifyFormReady에서 전달받은(공유받은) 데이터는 DTO, seq, pg 총 세 개  -->
		<!-- modifyFormReady에서 전달받은 seq와 pg는 현재 modifyForm에서는 사용되지는 않지만, 그 다음페이지인 modify로 데이터 전송하기 위해서
             폼태그 안에서 input 태그로 묶고 type을 hidden으로(DTO와는 달리 폼에 보이지 않기 때문에)  -->

		<table border="1" style="width: 400px;">
			<tr>
				<th width="100">상품코드</th>
				<td><input type="text" name="imageId" value="${imageboardDTO.imagdId}" size="45"></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="imageName"
					value="${imageboardDTO.imageName}" size="45"></td>
			</tr>
			<tr>
				<th>단가</th>
				<td><input type="text" name="imagePrice"
					value="${imageboardDTO.imagePrice}" size="45"></td>
			</tr>
			<tr>
				<th>개수</th>
				<td><input type="text" name="imageQty"
					value="${imageboardDTO.imageQty}" size="45"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="35" name="imageContent">${imageboardDTO.imageContent}</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" name="image1" size="45">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button"
					value="수정완료" onclick="checkModify()"> <input type="reset"
					value="다시 작성"></td>
			</tr>
		</table>


	</form>
</body>
</html>