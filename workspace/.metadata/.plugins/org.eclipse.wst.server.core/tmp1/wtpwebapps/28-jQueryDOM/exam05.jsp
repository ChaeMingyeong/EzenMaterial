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
		// 추가된 태그의 수를 카운트할 변수
		var i = 1;
		// 추가
		$("input:eq(0)").click(function(){
			// 새로운 요소의 생성
			var li1 = $("<li>").html("추가항목" + (i++)).css("color", "red");
			var li2 = $("<li>").html("추가항목" + (i++)).css("color", "green");
			var li3 = $("<li>").html("추가항목" + (i++)).css("color", "blue");
			// 새로 생성된 요소에 대한 이벤트 추가
			// remove() : 해당 요소 삭제
			li1.click(function(){
				$(this).remove();
			});
			li2.click(function(){
				$(this).remove();
			});
			li3.click(function(){
				$(this).remove();
			});
			// ul 태그에 추가
			// A.append(B) 	: A에 B를 추가
			// B.appendTo(A): B를 A에 추가
			li1.appendTo($("ul"));
			$("ul").append(li2);
			$("ul").append(li3);
		});
		// 삭제
		$("input:eq(1)").click(function(){
			$("ul").empty();
		});
	});
</script>
</head>
<body>
<input type="button" value="추가">
<input type="button" value="삭제">
<!-- 동적으로 요소가 추가될 태그 -->
<ul></ul>
</body>
</html>












