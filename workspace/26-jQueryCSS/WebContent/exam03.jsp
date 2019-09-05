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
	   /* 페이지가 열릴때, 기본탭의 내용 출력 처리*/
	   //panel이라는 클래스를 갖는 p태그 안에,
	   //탭버튼안의 selected 클래스가 적용된 링크의 href 속성이 가리키는 
	   //URL값을 load함수에게 전달한다. 
	   //=>링크가 가리키는 파일을 읽어서 <p>태그 안에 출력한다. 
	   //특정url에 있는 파일들을 읽어옴 
	   $("p.panel").load($("ul.tab li a.selected").attr("href"));
	   //탭버튼의 클릭처리
	   $("ul.tab li a").click(function(){
		   //클릭된 요소를 제외한 나머지 요소의 select 클래스 제거
		   $("ul.tab li a").not(this).removeClass("selected"); //a태크중 클릭되지 않은 애들 selected 를 제거 
		   //클릭된 요소에게 selected 클래스 적용
		   $(this).addClass("selected");
		   //클릭된 요소의 href 속성값이 가리키는 파일을 읽어와서 <p>태그에 출력
		   $("p.panel").load($("ul.tab li a.selected").attr("href"));
		   //페이지 이동방지
		   return false;
	   });
   });
</script>
<style type="text/css">
   /*전체 요소의 기본여백 초기화*/
   *{
     padding: 0;
     margin: 0;
   }
   
  /*탭박스의 기본 크기와 중앙 정렬 및 상하 여백 */
  div#container{
    width:500px;
    margin: 20px auto;
  } 
  /*탭 버튼의 초기화 및 레이어 띄우기 > 내용영역과 1px 겹쳐져야 한다. */
  ul.tab{
    list-style: none;
    position: relative;
    z-index: 100;
  }
  /*개별 버튼에 대한 기본 크기와 가로 정렬*/
  ul.tab li{
    width: 100px;
    height: 40px;
    float: left;
  }
  /*float 속성 해제*/
  ul:after{
    content:'';
    display: block;
    float: none;
    clear: both;
  }
  /*탭버튼의 기본 배경 처리와 글자 형태 처리*/
  /*a태그는 inline 이라 block으로 바꿈*/
  ul.tab li a {
    background: url("img/tab.jpg");
    display: block;
    color: #222;
    line-height: 40px;
    text-align: center;
    text-decoration: none;
  }
  ul.tab li a.selected{
    background: url("img/tab_selected.jpg");
  }
  /*내용영역의 테두리 처리 및 상단으로 -1px 이동시킴 
       버튼 영역과 1px 겹치게 처리해서 활성탭이 뚫려있는 효과연출  */
  p.panel{
     border: 1px solid #9fb7d4;
     position: relative;
     top: -1.3px;
     padding: 10px;
     margin: 0;
  }
  
</style>
</head>
<body>
<!-- 탭의 전체박스 -->
<div id="container">
   <!--탭 버튼 영역 -->
   <ul class="tab">
      <li><a href="txt/html5.txt" class="selected">HTML5</a></li>
      <li><a href="txt/jquery.txt" >jQuery</a></li>
      <li><a href="txt/bootstrap.txt">Bootstrap3</a></li>
   </ul>
   <!-- 내용 영역 -->
   <p class ="panel">내용</p>
</div>
</body>
</html>