<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">


   $(function(){
	   $("a.item:eq(0)").click(function(){
			var image = $(this).attr("href");
			$("#view").hide(500, function(){ //hide 동작후에 밑에있는함수가 동작되어짐
				$("#view img").attr("src", image);
				$("#view").show(300);
			});
			return false;
		});

	

		$("a.item:eq(1)").click(function(){
			var image = $(this).attr("href");
			$("#view").fadeOut(500, function(){
				$("#view img").attr("src", image);
				$("#view").fadeIn(300);
			});
			return false;
		});

	

		$("a.item:eq(2)").click(function(){
			var image = $(this).attr("href");
			$("#view").slideUp(500, function(){
				$("#view img").attr("src", image);
				$("#view").slideDown(300);
			});
			return false;
		});
		
   });
		
	
</script>
<style type="text/css">
/*목록태그 초기화 및 박스 왼쪽 배치*/
ul#thumb {
	padding: 0;
	margin: 0;
	list-style: none;
	width: 100px;
	float: left;
}
/*목록의 개별 항목에 대한 여백처리*/
ul#thumb li {
	padding: 5px 10px;
}
/*썸네일 이미지 크기 지정*/
ul#thumb img {
	width: 80px;
	height: 80px;
}
/*큰 이미지 크기 지정*/
#view {
	width: 360px;
	height: 270px;
	padding: 5px 0;
	float: left;
}

#view img {
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
	<!-- 썸네일 영역 지정 -->
	<ul id="thumb">
		<li><a href="img/1.jpg" class="item"><img alt="이미지" 
				src="img/1.jpg"></a></li>
		<li><a href="img/2.jpg" class="item"><img alt="이미지" 
				src="img/2.jpg"></a></li>
		<li><a href="img/3.jpg" class="item"><img alt="이미지" 
				src="img/3.jpg"></a></li>
	</ul>
	<!-- 큰 이미지 영역 -->
	<div id="view">
		<img src="img/1.jpg">
	</div>
</body>
</html>