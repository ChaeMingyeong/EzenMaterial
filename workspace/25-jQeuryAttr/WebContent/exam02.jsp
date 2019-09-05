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
    	//#all_check 요소 change 이벤트 사용 
    	$("#all_check").change(function(){
    		//현재 체크 상태 읽어오기
    		var is_check = $(this).is(":checked"); // true or false;
    		//.hobby_check 요소들의 체크상태 일괄변경
    		$(".hobby_check").prop("checked", is_check);
    	});
    });
</script>
</head>
<body>
<h1>전체 선택 기능 구현하기</h1>
<form action="" name="form1">
   <fieldset>
       <legend>취미</legend>
       <p><!-- 전체 선택용 체크박스 -->
          <input type="checkbox" id="all_check" value="Y" checked="">
          <label for="all_check">전체 선택</label>
       </p>
       <p><!-- 개별 항목에 대한 체크박스 -->
          <input type="checkbox" name="hobby" id="hobby1" class="hobby_check" value="축구">
          <label for="hobby1">축구</label>
          <input type="checkbox" name="hobby" id="hobby2" class="hobby_check" value="농구">
          <label for="hobby2">농구</label>
          <input type="checkbox" name="hobby" id="hobby3" class="hobby_check" value="야구">
          <label for="hobby3">야구</label>
          
       </p>
   </fieldset>
</form>
</body>
</html>