<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link href="<c:url value="/resources/css/step1.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/step1.css"/>" rel='stylesheet' />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='<c:url value="/resources/js/step2.js"/>'></script>
</head>
<body>
<div class="popup_layer" id="popup_layer">
	<div class="popup_box">
		<!--팝업 컨텐츠 영역-->
		<div class="popup_cont">
			<h5>홈페이지 이용약관</h5><hr>
			<p>
				제 1 장 총 칙<br> <br> 제 1 조 (목적) <br> 이 이용약관(이하 '약관')은
				주식회사 SOMME(이하 회사라 합니다)와 이용 고객(이하 '회원')간에 회사가 제공하는 서비스의 가입조건 및 이용에 관한
				다음의 제반 사항과 기타 기본적인 사항을 구체적으로 규정함을 목적으로 합니다.<br> <br> 제 2 조
				(이용약관의 효력 및 변경) (1) 이 약관은 SOMME 웹사이트에서 온라인으로 공시함으로써 효력을 발생하며, 합리적인
				사유가 발생할 경우 관련법령에 위배되지 않는 범위 안에서 개정될 수 있습니다. 개정된 약관은 온라인에서 공지함으로써 효력을
				발휘하며, 이용자의 권리 또는 의무 등 중요한 규정의 개정은 사전에 공지합니다.<br> (2) 회사는 합리적인
				사유가 발생될 경우에는 이 약관을 변경할 수 있으며, 약관을 변경할 경우에는 지체 없이 이를 사전에 공시합니다.<br>
				(3) 이용고객은 변경된 약관에 동의하지 않으면, 언제나 "서비스" 이용을 중단하고, 이용계약을 해지할 수 있습니다.
				약관의 효력발생일 이후의 계속적인 "서비스" 이용은 약관의 변경사항에 대한 이용고객의 동의로 간주됩니다.<br>
				<br> 제 3 조 (약관외 준칙) <br> (1) 이 약관은 회사가 제공하는 개별서비스에 관한
				이용안내(이하 서비스별 안내라 합니다)와 함께 적용합니다.<br> (2) 이 약관에 명시되지 아니한 사항에
				대해서는 별도의 세부 약관, 상관행, 회사의 공지, 이용안내, 관계법령 및 서비스별 안내의 취지에 따라 적용할 수
				있습니다. <br> <br> 제 4 조 (용어의 정의) <br> (1) "이용자"
				또는”회원”이란 "SOMME"에 접속하여 본 약관에 따라 "SOMME"에 가입하여, 이용 고객의 식별과 이용고객의 서비스
				이용을 위하여 이용고객 본인이 직접 선정하고 회사가 부여하는 문자와 숫자 조합인 ‘이용자번호(ID)’와 그에 따라 일치된
				이용고객임을 확인하기 위하여 이용고객 본인이 선정한 ‘비밀번호’를 이용하여 "SOMME"이 제공하는 서비스를 받는 자를
				말합니다.<br> (2) 이 약관에서 사용하는 용어의 정의는 제1항에서 정하는 것을 제외하고는 관계법령 및
				서비스별 안내에서 정하는 바에 의합니다. <br>
			</p>

		</div>
		<!--팝업 버튼 영역-->
		<div class="popup_btn">
			<a href="javascript:closePop();">확인</a>
		</div>
		<script>
		function closePop() {self.close();}
		</script>
	</div>
</div>
</body>
</html>


