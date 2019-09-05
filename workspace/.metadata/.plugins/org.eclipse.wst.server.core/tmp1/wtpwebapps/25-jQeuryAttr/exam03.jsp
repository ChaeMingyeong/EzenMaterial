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
    	  $("#upload_file_check").change(function(){
    		  var is_check = $(this).is(":checked");
    		  $("#file_finder").prop("disabled", !is_check)
    	  }); 
      });
</script>
</head>
<body>
<h1>활성/비활성 구현하기</h1>
<form action="" name="form1">
   <!-- 활성상태 제어용 체크박스 -->
   <input type="checkbox" id="upload_file_check" value="Y">
   <label for="upload_file_check">파일 올리기</label>
   <!-- 파일 태그, 기본적으로 비활성 상태로 설정함 -->
   <input type="file" id="file_finder" disabled>
</form>
</body>
</html>