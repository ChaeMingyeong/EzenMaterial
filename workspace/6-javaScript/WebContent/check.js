function doSubmit() {
	// text 요소의 입력여부 검사
	/*모든 항목이 입력되었을 경우를 검사하는 방법
	 *  1.if-else 사용
	 *  2.flag 변수 사용 
	 * */
	//alert(document.frm.gender[1].checked);

	var chk = false;
	//체크박스가 하나라도 선택되어있으면 true
	
	for(var i=0; i<document.frm.hobby.length; i++){
		if(document.frm.hobby[i].checked){
			chk = true;
			break;
		}
	}
    
	if (document.frm.user_name.value == "") {
		alert("이름을 입력해 주세요");
		document.frm.user_name.focus();
	}else if(!document.frm.gender[0].checked&&!document.frm.gender[1].checked){ // 라디오버튼의 입력여부 검사
		 alert("성별을 선택해주세요");
		 document.frm.gender[0].focus();
	}else if(document.frm.job.selectedIndex <1) {
		 alert("직업을 선택해 주세요.");
	     document.frm.job.focus();
	}else if(!chk){
		alert("취미를 선택해주세요.");
		document.frm.hobby[0].focus;
	}else if(document.frm.memo.value ==""){
		alert("메모를 입력하세요.");
		document.frm.memo.focus();
	}else{
		if(confirm("제출하시겠습니까?")){
			alert("제출하였습니다.");
			document.frm.submit(); //서버로 form 태그 안의 데이터 보내기
		}else{
			alert("취소되었습니다. ")
		}
	}
	

	
	 
}