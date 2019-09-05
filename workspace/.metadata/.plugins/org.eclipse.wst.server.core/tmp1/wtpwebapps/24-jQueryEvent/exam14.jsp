<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/event.css">
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
         $("#singleButton").click(function(){
        	 //눌려진 자기 자신을 의미 (=클릭되어진태그자신)
        	 $(this).html("감사합니다.");
         });
         // .multiButton이라는 클래스를 갖는 요소는 총 4개이다. 
         // 이 모두에 대한 이벤트를 처리한다. 
         $(".multiButton").click(function(){
        	 var index = $(this).index();
        	 $(this).html("나는" + index + "번째!!");
         });
	});
</script>

</head>
<body>
	<h1>this의 사용</h1>
	<div id="input">
		<h2>단독 개체의 확인</h2>
		<div id="singleButton">클릭하세요</div>
		<h2>복수 개체의 확인</h2>
		<div>
			<button class="multiButton">클릭하세요</button>
			<button class="multiButton">클릭하세요</button>
			<button class="multiButton">클릭하세요</button>
			<button class="multiButton">클릭하세요</button>
		</div>
	</div>
</body>
</html>