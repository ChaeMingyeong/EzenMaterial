function checkInput() {
	// alert("test");
	if (document.frm.imageId.value == "") {
		alert("상품 코드를 입력해주세요");
		document.frm.imageId.focus();
	} else if (document.frm.imageName.value == "") {
		alert("상품명을 입력해주세요");
		document.frm.imageName.focus();
	} else if (document.frm.imagePrice.value == "") {
		alert("상품가격을 입력해주세요");
		document.frm.imagePrice.focus();
	} else if (document.frm.imageQty.value == "") {
		alert("상품 수량을 입력해주세요");
		document.frm.imageQty.focus();
	} else if (document.frm.imageContent.value == "") {
		alert("상품 코드를 입력해주세요");
		document.frm.imageContent.focus();
	} else {
		document.frm.submit();
	}

}

function checkModify() {

	if(document.modifrm.imageId.value == "") {
		alert("상품명을 입력해주세요");
		document.modifrm.imageId.focus();
	}else if (document.modifrm.imageName.value == "") {
		alert("상품명을 입력해주세요");
		document.modifrm.imagePrice.focus();
	}else if (document.modifrm.imagePrice.value == "") {
		alert("상품 가격을 입력해주세요");
		document.modifrm.imagePrice.focus();
	} else if (document.modifrm.imageQty.value == "") {
		alert("상품 수량을 입력해주세요");
		document.modifrm.imageQty.focus();
	} else if (document.modifrm.imageContent.value == "") {
		alert("내용을 입력해주세요");
		document.modifrm.imageContent.focus();
	} else {
		document.modifrm.submit();
	}
}