<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

  div#box {
	background: #98bf21;
	width: 100px;
	height: 100px;
	position: absolute;
	left: 0;
}
</style>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
     $(function(){
    	 $("button:eq(0)").click(function(){
    		 //설정초기화
    		$("#animate-area").html("<div id ='box'></div>") 
    	 });
    	 
    	 /*좌측으로부터 250px 만큼 div 이동 */   	 
    	 $("button:eq(1)").click(function(){
     		$("#box").animate({
     			"left" : "250px"
     		}, 1000, 'swing', function(){
     			alert("애니메이션이 종료되었습니다.");
     		});
     	 });
    	 /*좌측으로부터 250px 이동하고, 높이와 넓이를 150px로 변경*/
    	 $("button:eq(2)").click(function(){
      		$("#box").animate({
      			left: "250px",
      			height: "150px",
      			width: "150px"
      		});
     	 });
    	 //좌측으로부터 50px 이동하고 높이와 넓이는 50px씩 크게 변경  
    	 $("button:eq(3)").click(function(){
      		$("#box").animate({
      			left: "+=50px", //기존값에 50 더 추가
      			height: "+=50px",
      			width: "+=50px",
      		},300);
     	 });
    	 
    	 //애니메이션 연속적 호출   
    	 $("button:eq(4)").click(function(){
      		 $("#box").animate({height: "300px"},1000); //1초
      		 $("#box").animate({width: "300px"},500); //0.5초
      		 $("#box").animate({height: "300px"},800); //0.3초
      		 $("#box").animate({width: "300px"},300);
     	 });
    	 
     });
</script>




</head>
<body>
<h1>Animate</h1>
<button>Reset</button>
<button>Ani1</button>
<button>Ani2</button>
<button>Ani3</button>
<button>Ani4</button>
<div id="animate-area">
    <div id="box"></div>
</div>
</body>
</html>