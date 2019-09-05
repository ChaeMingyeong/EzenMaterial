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
    	 $("img[src='img/jquery.jpg']").hover(function(){
    		 $(this).attr("src", "img/jquery_on.jpg");
    	 }, function(){
    		 $(this).attr("src", "img/jquery.jpg");
    	 });
     });
     
     $(function(){
    	 $("img[src='img/javascript.jpg']").hover(function(){
    		 $(this).attr("src", "img/javascript_on.jpg");
    	 }, function(){
    		 $(this).attr("src", "img/javascript.jpg");
    	 });
     });
     
     $(function(){
    	 $("img[src='img/css.jpg']").hover(function(){
    		 $(this).attr("src", "img/css_on.jpg");
    	 }, function(){
    		 $(this).attr("src", "img/css.jpg");
    	 });
     });
     
     $(function(){
    	 $("img[src='img/html.jpg']").hover(function(){
    		 $(this).attr("src", "img/html_on.jpg");
    	 }, function(){
    		 $(this).attr("src", "img/html.jpg");
    	 });
     });
</script>
<style type="text/css">
   /*목록태그의 여백 제거, 넓이 지정, 기호제거*/
ul{
    padding: 0;
    margin: 0;
    width:670px;
    list_style:none;
  }
 /* 목록의 가로배치 */ 
 li{ /**/
    display: inline;
    margin:  -3px;
 } 
 /* float 속성해제*/
  ul:after{
    content: '';
    display: block;
    float: none;
    clear: both;
  }  
  /*이미지 테두리 없애기*/
  img{
    border: none;
  }
</style>
</head>
<body>
  <ul>
     <li><a href="#"><img alt="jQuery" src="img/jquery.jpg"></a></li>
     <li><a href="#"><img alt="javascript" src="img/javascript.jpg"></a></li>
     <li><a href="#"><img alt="CSS" src="img/css.jpg"></a></li>
     <li><a href="#"><img alt="HTML" src="img/html.jpg"></a></li>
  </ul>
</body>
</html>