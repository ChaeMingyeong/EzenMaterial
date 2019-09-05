<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 공통 css -->
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    $(function(){
        //버튼 클릭 이벤트
    	$("#mybtn").click(function(){
    		$.ajax({
    			//ajax가 서버에요청->대기상태->요청이 오면 그 요청관련된 동작실행    
    			//전달해주는 값을 매개변수로으로 전달
    			//ajax가 얘를 참조해서 서버에 요청, 응답
    			url: "ajax/text/text01.txt", //상대경로
    			type: "get",
    			dataType : "text",
    			timeout: 30000,
    			cache: false,
    		    success: function(data){ //전달받을 데이터를 여기서 설정(서버에 전달하면 , 서버에서 json객체로넘어옴)
    		    	//dataType값이 text인 경우에는 단순히 내용에 대한 문자열이므로,
    		    	//직접 html요소에 출력할 수 있다.
    		    	$("#result").html(data);
    		    },
    		    error: function(xhr, textStatus, errorThrown){
    		    	$("#result").html("<p>" + textStatus + " / " + errorThrown + "<br>" 
    		    			+ xhr.status + "</p>");
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