$(function(){
	// id속성이 join인 <form> 태그 안의 submit 버튼을 누른 경우
	 $("#join").submit(function(){
		  /* 아이디 입력 검사 */
		  // $(input요소).val()은  사용자가 입력한 값을 리턴
		 var user_id = $("input[name='user_id']").val();
		 if(!user_id){
			 alert("아이디를 입력하세요.");
			 $("input[name='user_id']").focus();
			 return false;
		 }
		 //비밀번호
		 if(!$("input[name='user_pw']").val()){
			 alert("비밀번호를 입력하세요.");
			 $("input[name='user_pw']").focus();
			 return false;
		 }
		 // 주민번호
		 if(!$("input[name='jumin_no']").val()){
			 alert("주민번호를 입력하세요.");
			 $("input[name='jumin_no']").focus();
			 return false;
		 }
		 //라디오버튼 선택여부 검사
		 //$("라디오버튼CSS셀렉터").is(":checked") -> 체크일 경우 : true
		 if(!$("input[name='gender']").is(":checked")){
			 alert("성별을 선택해 주세요.");
			 $("input[name ='gender']:eq(0)").focus();
			 return false;
		 }
		 //이메일 
		 if(!$("input[name='email']").val()){
			 alert("이메일주소를 입력하세요.");
			 $("input[name='email']").focus();
			 return false;
		 }
		 //URL
		 if(!$("input[name='url']").val()){
			 alert("URL 주소를 입력하세요.");
			 $("input[name='url']").focus();
			 return false;
		 }
		 //핸드폰
		 if(!$("input[name='hp_no']").val()){
			 alert("핸드폰 번호를 입력하세요.");
			 $("input[name='hp_no']").focus();
			 return false;
		 }
		 //체크박스 선택여부 검사    
		//$("체크박스CSS셀렉터").is(":checked") -> 체크일 경우 : true
		 if(!$("input[name='hobby']").is(":checked")){
			 alert("취미를 선택해 주세요.");
			 $("input[name ='hobby']:eq(0)").focus();
			 return false;
		 }
		 //select 태그 선택여부 검사
		 if($("select[name='job'] > option:selected").index() < 1){
			 alert("직업을 선택해 주세요.");
			 $("select[name='job']").focus();
			 return false;
		 }
		 //출력할 문자열 만들기
		 var result = "<ul>";
		 result += "<li>아이디: " + $("input[name='user_id']").val() + "</li>";
		 result += "<li>비밀번호: " + $("input[name='user_pw']").val() + "</li>";
		 result += "<li>주민번호: " + $("input[name='jumin_no']").val() + "</li>";
		 result += "<li>성별: " + $("input[name='gender']").val() + "</li>";
		 result += "<li>이메일: " + $("input[name='email']").val() + "</li>";
		 result += "<li>URL: " + $("input[name='url']").val() + "</li>";
		 result += "<li>핸드폰 번호: " + $("input[name='hp_no']").val() + "</li>";
	     //선택한 취미값 모두 확인 
		 //hobby의 개체 수 만큼 반복적으로 function()이 실행된다. 
		 var select_hobby =""; // 취미를 저장할 변수 
		 $("input[name='hobby']:checked").each(function(){ //:checked 속성을 빼먹으면 모든값을 읽어옴
			 //$(this) : 각 반복되는 처리안에서 현재 동작되는 hobby 태그를 나타냄 
			 select_hobby += $(this).val() + " ";
		 });
		 result += "<li>취미: " + select_hobby + "</li>";
		 result += "<li>직업: " + $("select[name='job'] > option:selected").val() + "</li>";
		 result += "</ul> ";
			 
		 $("body").html(result);	 
		 //submit 이벤트이기 때문에 데이터가 전송됨
		 //전송을 안보내려면 false 리턴 
		 return false;
	 });
});