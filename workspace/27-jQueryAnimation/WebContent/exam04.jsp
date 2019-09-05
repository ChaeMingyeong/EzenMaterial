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
    	//링크를 클릭한 경우
    	$("a.model").click(function(){
    		//배경 레이어를 화면에 표시
    		$("#glayLayer").fadeIn(300);
    		//이미지레이어를 화면에 표시
    		$("#overLayer").fadeIn(300);
            //링크가 갖는 href 속성의 주소를 <img>태그에 설정하여
            //이미지 레이어에 출력한다.
            $("#overLayer").html("<img src='" + $(this).attr("href") +"'>");
            //<a>태그의 링크페이지 이동중단 
            return false;
    	});
    	// thumnail화면으로 돌아가기 : 배경 클릭 
    	$("#overLayer").click(function(){ //window
    		//배경레이어 숨김 
    		$("#glayLayer").fadeOut(300);
    		//이미지 레이어 숨김
    		$("#overLayer").fadeOut(300);
    	});
    });
</script>
<style type="text/css">
  ul{
   width: 700px;
   margin: auto;
   list-style: none;
  }
  /*각 항목에 대한 가로배치 */
  ul li{
   float: left;
  }
  ul:after{
   content: '';
   display: block;
   float: none;
   clear: both;
  }
  /*이미지 테두리 제거, 여백지정*/
  ul li img{
   border: 0;
   margin: 10px;
  }
  /*배경 레이어의 위치, 크기, 투명도 지정: 기본적으로 표시하지 않도록 설정*/
  div#glayLayer{
    display: none;
    position: fixed;
    left: 0; top: 0;
    height: 100%; width: 100%;
    background: black;
    filter: alpha(opacity=60);
    opacity: 0.60;
  }
  /*이미지가 표시될 레이어를 화면 중앙에 배치 : 기본적으로 표시되지 않도록 설정*/
  div#overLayer{
    display: none;
    position: fixed;
    top: 50%; left: 50%;
    margin-top: -244px;
    margin-left: -325px;
  }
</style>
</head>
<body>
<!-- 화면에 표시될 원본 보기 영역: 기본적으로 숨겨진 상태 -->
<div id="glayLayer"></div><div id="overLayer"></div>
<!-- 이미지 목록 -->
<ul>
  <li><a href="img/photo1.jpg" class="model">
    <img alt="샹드리아" src="img/photo1_thum.jpg">  
  </a></li>
  <li><a href="img/photo2.jpg" class="model">
    <img alt="장미" src="img/photo2_thum.jpg">  
  </a></li>
  <li><a href="img/photo3.jpg" class="model">
    <img alt="바다" src="img/photo3_thum.jpg">  
  </a></li>
  <li><a href="img/photo4.jpg" class="model">
    <img alt="문" src="img/photo4_thum.jpg">  
  </a></li>
  <li><a href="img/photo5.jpg" class="model">
    <img alt="바다" src="img/photo5_thum.jpg">  
  </a></li>
  <li><a href="img/photo6.jpg" class="model">
    <img alt="꽃" src="img/photo6_thum.jpg">  
  </a></li>
  <li><a href="img/photo7.jpg" class="model">
    <img alt="하늘" src="img/photo7_thum.jpg">  
  </a></li>
  <li><a href="img/photo8.jpg" class="model">
    <img alt="건물" src="img/photo8_thum.jpg">  
  </a></li>
</ul>
</body>
</html>