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
  $(function(){
	  $("#mybtn").click(function(){
		  $.ajax({
			  url : "ajax/text/text02.txt",
			  type : "get",
			  dataType : "text",
			  timeout : 30000,
			  cache : false,
			  success : function(data){
				  $("#result").html(data);
			  },
			  error : function(xhr, textStatus, errorThrown){
				  $("#result").html("에러코드 : " + xhr.status);
			  }
		  });
	  });
  });
</script>
</head>
<body>
<h1 class="title">$.ajax() 함수를 사용한 HTML 소스 읽기</h1>
<div class="exec">
  <input type="button" value="txt 파일 가져오기" id="mybtn">
</div>
<div class="console" id="result"></div>
</body>
</html>