function productCheck() {
	if (document.frm.name_kr.value.length == 0) {
		alert("상품명을 써주세요.");
		frm.name_kr.focus();
		return false;
	}
	if (document.frm.name_en.value.length == 0) {
		alert("영문명을 써주세요.");
		frm.name_en.focus();
		return false;
	}
	if (document.frm.price.value.length == 0) {
		alert("가격을 써주세요");
		frm.price.focus();
		return false;
	}
	if (isNaN(document.frm.price.value)) {
		alert("숫자를 입력해야 합니다");
		frm.price.focus();
		return false;
	}
	return true;
}