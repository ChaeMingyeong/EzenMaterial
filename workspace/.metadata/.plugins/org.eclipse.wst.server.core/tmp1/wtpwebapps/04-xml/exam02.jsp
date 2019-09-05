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
	  alert("test01");
	  $("#mybtn").click(function(){
		  alert("test02");
         $.ajax({
        	 url : "ajax/xml/xml04.xml",
        	 type : "get",
        	 dataType : "xml",
        	 cache: false,
             timeout:30000,
             success:function(data){
            	 alert("test03");
            	 //반복되는 태그 단위를 찾아서 each()함수 사용
            	$(data).find("subject").each(function(){
            		var title= $(this).find("title").text();
            		var time= $(this).find("time").text();
            		var teacher= $(this).find("teacher").text();
            	   //출력을 위한 동적 요소의 생성
            	   var div = $("<div>");
            	   var p1 = $("<p>").html(title);
            	   var p2 = $("<p>").html(time);
            	   var p3 = $("<p>").html(teacher);
            	   alert("test01");
            	   //조립과 출력
            	   div.append(p1).append(p2).append(p3);
            	   $("#result").append(div);
            	   $("#result").append("<hr>");
            	 
            	})
             },
             error: function(){
            	 $().html("에러코드: " + xhr.status);
             }
         });    		  
	  });
  });
</script>
</head>
<body>
<h1 class="title">$.ajax() 함수를 사용한 xml 데이터 읽기(2)</h1>
	<div class="exec">
		<input type="button" value="XML데이터 가져오기" id="mybtn">
	</div>
	<div class="console" id="result"></div>
</body>
</html>