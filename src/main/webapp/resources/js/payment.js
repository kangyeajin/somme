function productCheck() {
	if (document.frm.name.value.length == 0) {
		alert("이름을 입력해주세요.");
		frm.name.focus();
		return false;
	}

  if (document.frm.tel.value.length == 0) {
		alert("전화번호를 입력해주세요.");
		frm.tel.focus();
		return false;
	}

	if (document.frm.address.value.length == 0) {
		alert("주소를 입력해주세요.");
		frm.address.focus();
		return false;
	}
	document.frm.submit();
}