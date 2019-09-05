<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {

		$("#mybtn").click(
				function() {
					$.ajax({
						url : "ajax/text/textdata.jsp",
						type : "get",
						data : {"keyword": "HELLO"},
						dataType : "text",
						timeout : 30000,
						cache : false,
						success : function(data) {
							$("#result").html(data);
						},
						error : function(xhr, textStatus, errorThrown) {
							$("#result").html(
							"<p>" + textStatus + " / " + errorThrown
							+ "<br>" + xhr.status + "</p>");
						}
					});

				});
	});
</script>
</head>
<body>
	<h1 class="title">$.ajax() 함수를 사용한 텍스트 읽기</h1>
	<div class="exec">
		<input type="button" value="txt 파일 가져오기" id="mybtn">
	</div>
	<div class="console" id="result"></div>
</body>
</html>