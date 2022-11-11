<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="/resources/css/scrollbar.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/sidebar_list.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/step1.css"/>" rel='stylesheet' />

<%@ include file="../include/header.jsp"%> 
	<div class="scrollBar">
<!--회원가입 약관-->
<div id="title">
	<h1>회원가입</h1>
	<div>
		<span id="title_1">1. 이용약관 동의</span> <span>></span> <span>2.
			회원정보 입력</span> <span>></span> <span>회원가입 완료</span>
	</div>
</div>

<div id="main">
	<p>서비스 이용을 위한 약관에 동의해주세요.</p>
	<div id="all_box">
		<div>
			<span style="color: #df0202">(필수)</span> <span
				style="font-weight: bold">홈페이지 이용약관</span>
		</div>
		<div id="agree_all">
			<input type="checkbox" name="agree_all" id="agree_all"> <span>모두
				동의하기</span>
		</div>
	</div>
	<form id="join" action="/member/join_from" method="post"
		name="formm">
		<div>
			<!-- <div id="select_box1"> -->
			<div class="select_box">
				<br>
				<div>
					<input type="checkbox" name="agree" value="1" class="agree1"
						required oninvalid="this.setCustomValidity('필수 항목입니다')"
						oninput="this.setCustomValidity('')"> <span>만 19세
						이상 성인</span>
				</div>
				<div>
					<input type="checkbox" name="agree" value="2" class="agree2"
						required oninvalid="this.setCustomValidity('필수 항목입니다')"
						oninput="this.setCustomValidity('')"> <span>홈페이지
						이용약관</span>
					<div id="btn1">
						<a href="javascript:openPop()">자세히보기></a>
						<script>
						function openPop() {
							window.open("popup", "자세히 보기","width=600, height=600, scrollbars=yes,  top=300, left=700,");
						}
						
						</script>
					</div>
				</div>
				<div>
					<input type="checkbox" name="agree" value="3" class="agree3"
						required oninvalid="this.setCustomValidity('필수 항목입니다')"
						oninput="this.setCustomValidity('')"> <span>개인정보 수집
						및 이용동의</span>
					<div id="btn2">
						<a href="javascript:openPop()">자세히보기></a>
					</div>
				</div>
			</div>
			<br>
			<div class="select_box">
				<br>
				<div>
					<span style="font-weight: bold">(선택)마케팅 활용 동의/철회</span>
				</div>
				<div>
					<input type="checkbox" name="agree1" value="1" class="agree"> <span>개인(신용)정보의
						수집.이용에 관한 사항</span>
					<div id="btn3">
						<a href="javascript:openPop()">자세히보기></a>
					</div>
				</div>
				<div>
					<input type="checkbox" name="agree2" value="1" class="agree"> <span>마케팅 수신 동의
					(sns를 통한 마케팅에 동의)</span>
					<div id="btn4">
						<a href="javascript:openPop()">자세히보기></a>
					</div>
				</div>
			</div>
			<br>
			<div class="select_box">
				<div>
					<br> <span style="font-weight: bold">(선택)개인정보 유효기간</span>
				</div>
				<div id="radios">
					<input type="radio" name="chk_info" value="1년" checked="checked">1년
					<input type="radio" name="chk_info" value="3년">3년 <input
						type="radio" name="chk_info" value="회원 탈퇴 후">회원 탈퇴 후
				</div>
				<p id="radios_text">기간 선택하지 않는 경우, 기본 1년 후 휴면계정 전환</p>

			</div>

			<div id="btn_div">
				<input type="submit" value="확인" id="btn">
			</div>
		</div>

		

		<script src='<c:url value="/resources/js/step1.js"/>'></script>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
</div>
	</div>
<%@ include file="../include/footer.jsp"%>
