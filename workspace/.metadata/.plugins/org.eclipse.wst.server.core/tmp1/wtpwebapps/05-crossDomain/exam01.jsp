<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<script type="text/javascript" src="jquery-3.4.1.min.js"></script>
<!-- plugin 참조 -->
<script type="text/javascript" src="plugins/xdomain/jquery.xdomainajax.js"></script>
<style type="text/css">
  ul li {
     border-bottom: 1px dotted #7baeb5; 
     display : block;
     width: auto;
     padding: 13px 10px 10px 10px;
     color: #222;
     text-decoration: none;
  }
  ul li:first-child {
	 border-top: 1px dotted #7baeb5; 
  }
</style>
<script type="text/javascript">


   $(function(){
	   alert("여기 진입되나?");
		 
		  
   });

  
</script>
</head>
<body>
<h1 class="title">서울 경기 인천 날씨정보 <span id="date">날짜</span></h1>
<!-- 데이터 출력될 곳 -->
<ul id="list"></ul>
<p id="result"></p>
</body>
</html>