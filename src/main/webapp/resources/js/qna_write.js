/**
 * 
 */
function showfield(name) {
	if (name == '직접입력') {
		//document.getElementById('qnaList').style.display = "none";
		document.getElementById('self').style.display = "block";
	} else {
		document.getElementById('self').style.display = "none";
	}
}

function hidefield() {
    document.getElementById('self').style.display = 'none';
}
function Checkform() {
    var frm = document.frm;
    if (frm.content.value == "") {
        frm.content.focus();
        alert("내용을 입력해 주세요.");
        return false;
    } else if (frm.pwd.value == "") {
        frm.pwd.focus();
        alert("비밀번호를 입력해 주세요.");
        return false;
    } else {
        alert("등록되었습니다.");
//        frm.encoding = "multipart/form-data";
//        frm.action = "qna/QNA_write";
        frm.submit();
    }
}
