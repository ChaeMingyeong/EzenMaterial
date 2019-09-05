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
	   //기본적으로 1dept의 드롭다운을 로드함 
	   $("#category1").load("ajax/text/category-data.html #category1-1", function(){
		   $(this).show();
	   });
	   // 드롭다운은 body상에 없으므로 이벤트를 "미리" 정의해놓아야한다.
	   // 1dept에 대한 change 이벤트 정의	//on.(이벤트,태그, 동작)
	   $(document).on("change", "#category1 > select", function(){
		   //1depth가 변경되는 것이므로 2/3depth는 초기화 , 비우고 감추기 
		   $("#category2").empty().hide();
		   $("#category3").empty().hide();
		   //선택한 항목이 지시하는 하위 카테고리 페이지의 URL얻기 
		   var target = $(this).find("option:selected").attr("data-target");
		   var selector = "ajax/text/category-data.html " + target;
		   //다음항목로드              //.load(url, 성공했을때 함수)
		   $("#category2").load(selector, function(){
			   $(this).show();
		   });
	   });
	   // 2dept에 대한 change 이벤트 정의
	   $(document).on("change", "#category2 > select", function(){
		   //2dept가 변경되므로 3dept는 초기화 
		   $("category3").empty().hide();
		   //선택한 항목이 지시하는 하위 카테고리 페이지의 URL얻기 
		   var target = $(this).find("option:selected").attr("data-target");
		   var selector = "ajax/text/category-data.html " + target;
		   //다음항목로드                                  
		   $("#category3").load(selector, function(){
			   $(this).show();
		   });
	   });
	   // 3dept에 대한 change 이벤트 정의
	   $(document).on("change", "#category3 > select", function(){
		   //선택항목이 존재하는 지 검사
		   if($(this).find("option:selected").index()>0){
			   //모든 드롭다운의 선택값을 추출
			   var data1 = $("#category1 > select > option:selected").val();
			   var data2 = $("#category2 > select > option:selected").val();
			   var data3 = $("#category3 > select > option:selected").val();
			   
			   $(".console").html(data1 + " &gt; " +data2 +" &gt; " + data3);
		   }
	   });
   });
</script>
<style type="text/css">
/* 빈 요소를 숨김. 각 span 안에 드롭다운을 출력하게 됨 */
form > span{
  display: none;
}
</style>
</head>
<body>
<h1 class="title">동적 드롭다운</h1>
<div class="exec">
   <form action="">
      <!-- 각 단계별 dropdown을 표시할 span 태그 -->
      <span id="category1"></span>
      <span id="category2"></span>
      <span id="category3"></span>
   </form>
</div>
<!-- 결과출력 -->
<div class="console"></div>
</body>
</html>