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
				url : "ajax/json/json05.json",
			    type : "get",
			    dataType : "json", 		
			    cache: false,
			    timeout: 30000,
			    success : function(json){
			    	//배열까지 접근
			    	var subject = json.school.subject;
			    	//배열의 길이만큼 반복
			    	for(var i=0; i<subject.length; i++){
			    		var title = subject[i].title;
			    		var time = subject[i].time;
			    		var teacher = subject[i].teacher;
			    		//태그 생성
			    		var ul = $("<ul>");
			    		var li1 = $("<li>").html(title);
			    		var li2 = $("<li>").html(time);
			    		var li3 = $("<li>").html(teacher);
			    		ul.append(li1).append(li2).append(li3);
			    		$("#result").append(ul);
			    		$("#result").append("<hr>");
			    	}
			    },
			    error: function(xhr){
			    	$("#result").html(xhr.status);
			    }
			});
		});
	});
</script>
</head>
<body>
	<h1 class="title">$.ajax() 함수를 사용한 JSON 데이터 읽기(2)</h1>
	<div class="exec">
		<input type="button" value="JSON데이터 가져오기" id="mybtn">
	</div>
	<div class="console" id="result"></div>
</body>
</html>