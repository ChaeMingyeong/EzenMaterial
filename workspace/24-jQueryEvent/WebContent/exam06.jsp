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
             
  //키코드값을 파라미터로 받아서, 키보드의 키 이름을 리턴 
  $(function getKeyName(keyCode){
     	// 키코드와 키이름에 대한 JSON 배열 정의
     	var keyMap =[
     		{code: 8, name: "backspace"},
     		{code: 9, name: "tab"},
     		{code: 13, name: "enter"},
     		{code: 16, name: "shift"},
     		{code: 17, name: "ctrl"},
     		{code: 18, name: "alt"},
     		{code: 19, name: "pausebreak"},
     		{code: 20, name: "capslock"},
     		{code: 21, name: "han/eng"},
     		{code: 25, name: "hanja"},
     		{code: 27, name: "esc"}
     	];
     	
     	for(var i=0; i<keyMap.length; i++){
     		if(keyMap[i].code==keyCode){
     			return keyMap[i].name;
     		}
     	}
     	
     	$(function(){
     		$("#input > input[type='text']").keydown(function(e){
     			$("#result").html(e.which + "번 키 눌러짐 >> " 
     					 + getKeyName(e.which));
     		});
 
     	});
  });
</script>
</head>
<body>
   	<h1>Key 이벤트 확인하기</h1>
	<div id="input"><input type="text"></div>
	<h2>결과</h2>
	<div id="result"></div>
</body>
</html>