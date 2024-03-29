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
		// 텍스트 박스의 입력  변경 감지
		$("input[name='user_name']").change(function(){
			$("#result").html("이름의 입력값이 변경되었습니다.");
		});
		// 체크 박스의 상태 변경 감지
		$("input[name='hobby']").change(function(){
			$("#result").html("취미가 변경되었습니다.");
		});
		// 라디오버튼의 상태  변경 감지
		$("input[name='gender']").change(function(){
			$("#result").html("성별이 변경되었습니다.");
		});
		// 드롭다운의 상태  변경 감지
		$("select[name='job']").change(function(){
			$("#result").html("직업이 변경되었습니다.");
		});
	});
</script>
</head>
<body>
    <h1>Change 이벤트 확인하기</h1>
	<div id="input">
	  <!-- 입력박스 -->
	  <h3>이름</h3>
	  <input type="text" name="user_name">
	  <!-- 체크박스 -->
	  <h3>취미</h3>
	  <label><input type="checkbox" name="hobby" value="축구">축구</label>
	  <label><input type="checkbox" name="hobby" value="농구">농구</label>
	  <label><input type="checkbox" name="hobby" value="야구">야구</label>
	  <!-- 라디오 버튼 -->
	  <h3>성별</h3>
	  <label><input type="radio" name="gender" value="남자">남자</label>
	  <label><input type="radio" name="gender" value="여자">여자</label>
	  <!-- 드롭다운 -->
	  <h3>직업</h3>
	  <select name="job">
	    <option value="프로그래머">프로그래머</option>
	    <option value="퍼블리셔">퍼블리셔</option>
	    <option value="디자이너">디자이너</option>
	     <option value="기획">기획</option>
	  </select>
	</div>
	<h2>결과</h2>
	<div id="result"></div>
</body>
</html>