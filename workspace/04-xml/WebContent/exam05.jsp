<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  *{
    padding: 0;
    margin: 0;
    color: #333;
  }
 
  ul{
    list-style: none;
  }
  
  #container{
    padding: 30px 20px;
  }
  
  h1{
    font-size: large;
    border-left: 10px solid #7BAEB5;
    border-bottom: 1px solid #7BAEB5;
    padding: 10px;
    width: auto;
  }
  
  div#comment_write{
    padding: 20px 15px;
    border-bottom: 1px solid #7BAEB5;
  }
  
  div#comment_write label{
   /* 줄 맞추기 => label이 inline 속성이기 때문에 
    inline_block으로   바꿔서 줄맞춰줌*/
    display: inline-block;
    width: 80px;
    font-size: 14px;
    font-weight: bold;
    margin-bottom: 10px;
  }
  input[name='user_name'], textarea[name='comment']{
    border: 1px solid #ccc;
    vertical-align: middle;
    padding: 3px 10px;
    font-size: 12px;
    line-height: 150%;
  }
  textarea[name='comment'] {
	width: 380px;
	height: 90px;
  }
  /* 앞으로 생성될 태그의 css 설정*/
  .comment_item{
    font-size: 13px;
    color: #333;
    padding: 15px;
    border-bottom: 1px dotted #ccc;
    line-height: 150%;
  }
  .comment_item . writer{
    color: #555;
    line-height: 200%;
  }
  .comment_item .writer input{
    vertical-align: middle;
  }
  .comment_item . writer .name{
     color: #222;
     font-weight: bold;
     font-size: 14px;
  }
</style>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
  /* 새로운 화면에 글을 추가하기 위한 함수 */
  function addNewItem(num, writer, content, datetime){
	 //alert("num" + num + "\n" + "writer" + writer + 
	 //"\n" + "content" + content + "\n" + "datatime" + datetime + "\n");
	  // 새로운 덧글이 추가될 li 태그
	  var new_li = $("<li>");
	  new_li.attr("data_num", num);
	  new_li.addClass("comment_item");
	  //작성자 정보가 지정될 <p> 태그
	  var writer_p = $("<p>");
	  writer_p.addClass("writer"); //클래스 wr iter
	  //작성자정보의 이름
	  var name_span = $("<span>");
	  name_span.addClass("name");
	  name_span.html(writer + "님"); //매개변수로 전달된 writer
	  //작성일시
	  var date_span = $("<span>");
	  date_span.html(" / " + datetime + " ");
	  //삭제하기 버튼
	  var del_input = $("<input>");
	  del_input.attr({
		  "type" : "button",
		  "value" : "삭제하기"
	  });
	  del_input.addClass("delete_btn");
	  //내용
	  var content_p = $("<p>");
	  content_p.html(content);
	  //조립하기
	  writer_p.append(name_span).append(date_span).append(del_input);
	  new_li.append(writer_p).append(content_p);
	  $("#comment_list").append(new_li);
  }
  
  $(function(){
	  /* 기본 덧글 목록 불러오기 */ //url,보낼data,성공했을때동작될함수 (서버에서 넘어온 데이터를 매개변수로 받음 )
	  $.get("ajax/comment/comment_list.xml", {} , function(data){
		  //읽어들인 XML에서 "item" 태그를 찾아 반복처리 
		  $(data).find("item").each(function(){ 
			  //부모태그는 parents(), 자식태그는 find()로 찾음 
			  var num = $(this).find("num").text();
			  var writer = $(this).find("writer").text();
			  var content = $(this).find("content").text();
			  var datetime = $(this).find("datetime").text();
			  addNewItem(num, writer, content, datetime);
		  });
	  }).fail(function(){
		  alert("덧글목록을 불러오는데 실패하였습니다. 잠시후 다시 시도해주세요");
	  });
	  
	  /* 덧글 내용 저장 이벤트 */
	  $("#comment_form").submit(function(){ //폼이 제출되어지면 
		  //작성자 이름에 대한 입력 검사
		  if(!$("#user_name").val()){
			alert("이름을 입력하세요.");
			$("#user_name").focus();
			return false;
		  }else if(!$("#comment").val()){
				alert("내용을 입력하세요.");
				$("#comment").focus();
				return false;
		  }
	     // 글 저장을 위한  post방식의 Ajax 연동 처리 
	      var url = "ajax/comment/comment_write.jsp";
	      $.post(url, $(this).serialize(), function(data){
	    	  //alert("데이터가 서버에 전달되는지  test");
	    	  //XML에서 "result" 태그의 값을 추출해서 식으로 변환
	    	  var result = eval($(data).find("result").text()); //eval : 문자열을 데이터로 바꿈
	    	  alert("result = " + result);
	    	  //결과가 저장실패를 의미한다면, 에러메시지 출력후 처리중단
	    	  if(!result){
	    		  alert($(data).find("message").text());
	    		  return false;
	    	  }
	    	  //데이터 추출 
	    	  var num = $(data).find("num").text();
	    	  var writer = $(data).find("writer").text();
	    	  var content = $(data).find("content").text();
	    	  var datetime = $(data).find("datetime").text();
	    	  //alert("result" + result + "\n" + "num" + num + "\n" + "writer" + writer + 
	    	  //"\n" + "content" + content + "\n" + "datatime" + datetime + "\n");
	    	  //함수 호출하여 li 태그 추가
	    	  addNewItem(num, writer, content, datetime);
	      }).fail(function(){
			  alert("덧글작성에 실패하였습니다. 잠시후 다시 시도해주세요");
		  });
	      return false; //submit 방지용 
	  });
	  
	  /* 삭제 버튼 클릭시에 항목 삭제하도록 미리 지정 */
	  $(document).on("click", ".delete_btn", function(){
		  if(confirm("선택하신 항목을 삭제하시겠습니까?")){
			  //덧글 삭제를 할 JSP 파일
			  var url ="ajax/comment/comment_delete.jsp";
			  //글번호 얻기
			  var num = $(this).parents("li").attr("data_num");
			  //alert("num = " + num);
	          //삭제 대상
	          var target = $(this).parents(".comment_item"); //한줄데이터 
	          //글번호를 통하여 삭제를 요청      // url, 보낼데이터, 요청을 보낼때 응답이오면 data 받고 동작할 함수 
	          $.post(url, {"num" : num}, function(data){
	        	  //result값 추출
	        	  var result = eval($(data).find("result").text());
	        	  //결과 메세지
	        	  var message = $(data).find("message").text();
	        	  //메세지 출력
	        	  alert(message);
	        	  //DB에서 데이터가 삭제되면, 해당 내용 삭제하기
	        	  if(result){
	        		  target.remove(); //한줄데이터지우기 
	        	  }
	          }).fail(function(){
				  alert("덧글삭제에 실패했습니다. 잠시후 다시 시도해주세요");
			  });
			}
	  });
  });
</script>
</head>
<body>
	<div id="container">
		<h1>jQuery Comment</h1>
		<div id="comment_write">
		 <!-- action에 아무것도 안적으면 자기자신을 다시호출시킴  -->
			<form action="" id="comment_form"> 
				<div>
					<label for="user_name">작성자</label>
					<input type="text" name="user_name" id="user_name"> 
					<input type="submit" value="저장하기">
				</div>
				<div>
					<label for="comment">덧글 내용</label>
					<textarea name="comment" id="comment"></textarea>
				</div>
			</form>
		</div>
		<ul id="comment_list">
			<!-- 여기에 동적 생성 요소가 들어감 -->
		</ul>
	</div>
</body>
</html>