function inputlogin() {
	
	if(document.log.id.value==""){
		alert("아이디를 입력하세요");
		document.log.id.focus();
	}else if(document.log.pw.value ==""){
		alert("비밀번호를 입력해주세요");
		document.log.pw.focus();
	}else{
		confirm("입력하신 내용이 맞습니까?");
	}
}