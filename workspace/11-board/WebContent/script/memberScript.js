function inputConfirm() {
	
	
	if(document.writeForm.name.value ==""){
		 alert("이름을 입력해주세요.");
		 document.writeForm.name.focus();
	}else if(document.writeForm.id.value ==""){
		alert("아이디를 입력해주세요.");
		document.writeForm.id.focus();
	}else if(document.writeForm.pwd.value ==""){
		alert("비밀번호를 입력해주세요.");
		document.writeForm.pwd.focus();
	}else if(document.writeForm.pwd.value != document.writeForm.confirm.value){
		alert("비밀번호가 맞지 않습니다.");
		document.writeForm.confirm.focus();
	}else {
			 document.writeForm.submit();
	}
	
	
	
}

function lll() {  
	if(document.loginForm.id.value ==""){
		alert("아이디를 입력해주세요");
		document.loginForm.id.focus();
	}else if(document.loginForm.pwd.value ==""){
		alert("비밀번호를 입력해주세요");
		document.loginForm.pwd.focus();
	}else{
		document.loginForm.submit();
	}
}

function checkId() {
	var sID = document.writeForm.id.value;
	if(sID =="") {
		alert("먼저 아이디를 입력하세요");
		document.writeForm.id.focus();
	}else{
		window.open("checkId.jsp?id=" + sID, "", "width=350 height=100 left =500 top=200");
	}
}

function checkModify() {
	if(document.modifyForm.name.value==""){
		alert("이름을 입력해주세요.")
		document.modifyForm.name.focus();
	}else if(document.modifyForm.id.value==""){
		alert("아이디를 입력해주세요.")
		document.modifyForm.name.focus();
	}else if(document.modifyForm.pwd.value==""){
		alert("비밀번호을 입력해주세요.")
		document.modifyForm.pwd.focus();
	}else if(document.modifyForm.pwd.value!= document.modifyForm.confirm.value){
		alert("비밀번호가 맞지 않습니다.")
		document.modifyForm.confirm.focus();
	}else{
		document.modifyForm.submit();
	}
}


