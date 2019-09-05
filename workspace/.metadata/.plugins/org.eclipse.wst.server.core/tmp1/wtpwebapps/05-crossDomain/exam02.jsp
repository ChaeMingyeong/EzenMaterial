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
<!-- plugin 참조 -->
<script type="text/javascript" src="plugins/xdomain/jquery.xdomainajax.js"></script>
<script type="text/javascript">
  /* 구글 뉴스 데이터를 불러와서 화면에 출력하는 함수 */
  function getNewsList(topic){
	  // 접속할 주소 
	  var url = "https://news.google.com/news/feeds";
	  // 구글에서 요구하는 파라미터
	  var data = {
		"pz" : 1,
		"cf" : "all",
		"ned" : "kr",
		"hl" : "ko",
		"topic" : topic,
		"output" : "rss",
	  };
	  //get방식으로 요청
	  $.get(url, data, function(data){
		  alert("test2");
	  }).fail(function(data){
		  
		  alert("test3" + data);
	  });
  }
  
  $(function(){
	  getNewsList($("#topic > option:selected").val());
	  // 드롭다운의 선택항목이 변경된 경우
	  $("#topic").change(function(){
		  $("#list").empty();
		  //선택항목의 value값을 획득해서 ajax 연동을 구현한 함수에게 전달
		  getNewsList($(this).find("option:selected").val());
	  });
  });
</script>
</head>
<body>
<h1 class="title">구글 뉴스 연동</h1>
<div class="exec">
  <form action="" name="form1">
     <fieldset>
        <label>뉴스분야 선택</label>
        <select name="topic" id="topic">
           <option>-- 주요 뉴스 --</option>
           <option value="p">정치</option>
           <option value="b">경제</option>
           <option value="y">사회</option>
           <option value="l">문화/생활</option>
           <option value="w">국제</option>
           <option value="t">과학기술</option>
           <option value="e">연예</option>
           <option value="s">스포츠</option>
        </select>
     </fieldset>
  </form>
</div>
</body>
</html>