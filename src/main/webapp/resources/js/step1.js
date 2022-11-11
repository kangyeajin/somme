// 동의 모두선택 / 해제
const agreeChkAll = document.querySelector('input[name=agree_all]');
    agreeChkAll.addEventListener('change', (e) => {
    let agreeChk = document.querySelectorAll('input[name=agree]');
    for(let i = 0; i < agreeChk.length; i++){
      agreeChk[i].checked = e.target.checked;
    }
	let agreeChk2 = document.querySelectorAll('.agree');
	    for(let i = 0; i < agreeChk2.length; i++){
      agreeChk2[i].checked = e.target.checked;
    }
});


