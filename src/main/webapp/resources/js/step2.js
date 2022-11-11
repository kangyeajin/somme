function sample4_execDaumPostcode() {
  new daum.Postcode({
      oncomplete: function(data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var roadAddr = data.roadAddress; // 도로명 주소 변수
          var extraRoadAddr = ''; // 참고 항목 변수

          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
              extraRoadAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if(data.buildingName !== '' && data.apartment === 'Y'){
             extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          if(extraRoadAddr !== ''){
              extraRoadAddr = ' (' + extraRoadAddr + ')';
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('sample4_postcode').value = data.zonecode;
          document.getElementById("sample4_roadAddress").value = roadAddr;
          document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
   
          document.getElementById("sample4_engAddress").value = data.addressEnglish;
                 
          // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
          if(roadAddr !== ''){
              document.getElementById("sample4_extraAddress").value = extraRoadAddr;
          } else {
              document.getElementById("sample4_extraAddress").value = '';
          }

          var guideTextBox = document.getElementById("guide");
          // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
          if(data.autoRoadAddress) {
              var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
              guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
              guideTextBox.style.display = 'block';

          } else if(data.autoJibunAddress) {
              var expJibunAddr = data.autoJibunAddress;
              guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
              guideTextBox.style.display = 'block';
          } else {
              guideTextBox.innerHTML = '';
              guideTextBox.style.display = 'none';
          }
      }
  }).open();
}
//회원가입 유효성 검사
function go_save() {
	if(document.formm.id.value != document.formm.reid.value) {
		alert("중복확인을 클릭하여 주세요.");
		document.formm.id.focus();
		return false;
	}
	if(document.formm.name.value == ""){
		document.formm.name.focus();
		alert("이름은 필수 사항입니다.");
		return false;
	}
	if(formm.bdate.value == ""){
		document.formm.bdate.focus();
		alert("생년월일은 필수 사항입니다.");
		return false;
	}
	if(formm.phone.value == ""){
		document.formm.phone.focus();
		alert("휴대폰 번호는 필수 사항입니다.");
		return false;
	}
	if(formm.phone.value != formm.reiid.value){
		alert("본인인증이 필요합니다.");
		return false;
	}
	if(document.formm.id.value == "") {
		document.formm.id.focus();
		alert("아이디를 입력하여 주세요.");
		return false;
	}
	if(formm.pwd.value == ""){
		document.formm.pwd.focus();
		alert("비밀번호는 필수 사항입니다.");
		return false;
	}
	if(document.formm.pwd.value != document.formm.pwdCheck.value) {
	    alert("비밀번호가 일치하지 않습니다.");
		document.formm.pwd.focus();
		return false;
	}
	if(document.formm.email.value == "") {
		alert("이메일을 입력해 주세요.");
		document.formm.email.focus();
		return false;
	}
	var idRegExp = /^[a-zA-z0-9]{5,15}$/; 
	//아이디        
	if (!idRegExp.test(formm.id.value)) {            
	alert("아이디는 영문 대소문자와 숫자 5~15자리로 입력해야합니다");            
	formm.id.value = "";            
	formm.id.focus();            
	return false;     
	}
	var pwRegExp = /^(?=.*[a-zA-z])(?=.*[~!@#$%^&*()_+|<>?:{}])(?=.*[0-9]).{8,20}$/; 
	//비밀번호        
	if (!pwRegExp.test(formm.pwd.value)) {            
	alert("비밀번호는 영문자+숫자+특수문자를 포함한 8~20자리로 입력해야합니다.");            
	formm.pwd.value = "";            
	formm.pwd.focus();            
	return false;     
	}//이름
	var nmRegExp  =  /^[가-힣a-zA-Z]+$/ ;
	if(!nmRegExp.test(formm.name.value)) {
		alert("이름은 한글과 영문자로만 작성 가능합니다.")
		formm.name.value = "";
		formm.name.focus();
		return false;  
	} 	//상세주소
	var addrRegExp =/^.{0,16}$/ ;
	if(!addrRegExp.test(formm.addr2.value)) {
	alert("상세주소의 길이를 줄여주세요");                  
	formm.phone.focus();            
	return false;    	
	}

 formm.submit();
}

function idCheck(){
		if(document.formm.id.value == ""){
		document.formm.id.focus();
		alert("아이디를 입력해주세요");
		return false;
}

var popupWidth = 450;
var popupHeight = 250;

var popupX = (window.screen.width / 2) - (popupWidth / 2);
var popupY= (window.screen.height / 2) - (popupHeight / 2);

var url = "id_check_form?id="+document.formm.id.value;
window.open(url, "_blank_1",
		'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
}
function idok(){
	opener.formm.id.value = document.formm.id.value;
	opener.formm.reid.value = document.formm.id.value;
	self.close();
}


function open_win(url, name) {
var popWidth = 500;
var popHeight = 230;
var popX = (window.screen.width / 2) - (popWidth / 2);
var popY= (window.screen.height / 2) - (popHeight / 2);
	window.open(url, name, 
	'status=no, height=' + popHeight  + ', width=' + popWidth  + ', left='+ popX + ', top='+ popY );
}

//member수정 창
function memberCheck() {
	if(document.formm.name.value == ""){
		document.formm.name.focus();
		alert("이름은 필수 사항입니다.");
		return false;
	}
	if(formm.pwd.value == ""){
		document.formm.pwd.focus();
		alert("비밀번호는 필수 사항입니다.");
		return false;
	}
		if(document.formm.pwd.value != document.formm.pwdCheck.value) {
	    alert("비밀번호가 일치하지 않습니다.");
		document.formm.pwd.focus();
		return false;
	}
	if(formm.phone.value == ""){
		document.formm.phone.focus();
		alert("휴대폰 번호는 필수 사항입니다.");
		return false;
	}
	if(formm.phone.value != formm.reiid.value){
		document.formm.phone.focus();
		alert("본인인증이 필요합니다.");
		return false;
	}
	if(document.formm.email.value == "") {
		alert("이메일을 입력해 주세요.");
		document.formm.email.focus();
		return false;
	}
	var pwRegExp = /^(?=.*[a-zA-z])(?=.*[~!@#$%^&*()_+|<>?:{}])(?=.*[0-9]).{8,20}$/; 
	//비밀번호        
	if (!pwRegExp.test(formm.pwd.value)) {            
	alert("비밀번호는 영문자+숫자+특수문자를 포함한 8~20자리로 입력해야합니다.");            
	formm.pwd.value = "";            
	formm.pwd.focus();            
	return false;     
	}//이름
	var nmRegExp  =  /^[가-힣a-zA-Z]+$/ ;
	if(!nmRegExp.test(formm.name.value)) {
		alert("이름은 한글과 영문자로만 작성 가능합니다.")
		formm.name.value = "";
		formm.name.focus();
		return false;  
	} 
	//상세주소
	var 
	addrRegExp =/^.{0,16}$/ ;
	if(!addrRegExp.test(formm.addr2.value)) {
	alert("상세주소의 길이를 줄여주세요");                  
	formm.phone.focus();            
	return false;    	
	}

 alert("수정된 정보가 저장됐습니다.");
 formm.submit();
}

function userChk(){
var popuWidth = 450;
var popuHeight = 250;

var popuX = (window.screen.width / 2) - (popuWidth / 2);
var popuY= (window.screen.height / 2) - (popuHeight / 2);

var url = "send_sms_form";
	window.open(url, "_blank_1",
               "toolbar=no, menubar=no, scrollbars=yes," +
               " resizable=no, width=450, height=200");
}

function userok(){
	opener.formm.phone.value = document.formm.phone.value;
	opener.formm.reiid.value = document.formm.phone.value;
	
	self.close();
}
