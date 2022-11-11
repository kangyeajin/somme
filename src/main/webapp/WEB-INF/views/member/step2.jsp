<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="/resources/css/scrollbar.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/sidebar_list.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/step2.css"/>" rel='stylesheet' />

<%@ include file="../include/header.jsp"%> 
	<div class="scrollBar">
<div id="container">
	<div id="title">
		<h1>회원가입</h1>
		<div>
			<span>1. 이용약관 동의</span> <span>></span> <span id="title_1">2.
				회원정보 입력</span> <span>></span> <span>회원가입 완료</span>
		</div>
	</div>
	<div id="box" style="border: 1px solid rgb(190, 190, 190)">
		<div id=btn_div>
			<input type="button" id="box_btn"style="width: 150px; height: 40px;" onclick="userChk()" value="본인인증">
		</div>
		<p>정보통신만 이용 촉진 및 정보보호 등에 관한 법률 및 청소년 보호법의 규정에 의하여</p>
		<p>19세 미만의 청소년은 이용할 수 없습니다.</p>
	</div>
	<!--회원 정보 입력 폼-->
	<form id="join" action="/member/join" method="post"
		name="formm">
		<div id="main">

			<table>
				<tr>
					<td>이름 *</td>
				</tr>
				<tr>
					<td><input type="text" name="name" placeholder="이름을 입력해주세요."></td>
				</tr>
				<tr>
					<td>생년월일 *</td>
				</tr>
				<tr>
					<td><input type="date" name="bdate" placeholder="생년월일을 입력해주세요"></td>
				</tr>
			</table>
			<div id="address" style="margin-top: 10px;">
				<p>전화번호</p>
				
				<c:if test="${phone == null}">
				<input type="text" name="phone" placeholder="본인인증을 해주세요" maxlength="11" readonly>
				<input type="hidden" name="reiid" size="20" value="">
				</c:if>
				<c:if test="${phone != null}"> 
				<input type="text" name="phone" maxlength="11" value="${phone}" readonly>
				<input type="hidden" name="reiid" size="20" value="${phone}">
				</c:if>
			
			</div>

			<div id="address" style="margin-top: 10px;">
				<p>아이디</p>
				<input type="text" name="id" placeholder="5-15자 이내의 영문자 혹은 숫자" style="width: 500px;"> 
				<input type="hidden" name="reid" size="20"> 
				<input type="button" value="중복 확인"  onclick="idCheck()"
					style="width: 90px; height: 30px; font-size: 12px;">
			</div>
			<table>
				<tr>
					<td>비밀번호 *</td>
				</tr>
				<tr>
					<td><input type="password" name="pwd" placeholder="영문자+숫자+특수문자를 포함한 8~20자리"></td>
				</tr>
				<tr>
					<td>비밀번호 확인 *</td>
				</tr>
				<tr>
					<td><input type="password" name="pwdCheck"
						placeholder="비밀번호를 한번 더 입력해주세요"></td>
				</tr>
				<tr>
					<td>이메일 *</td>
				</tr>
				<tr>
					<td><input type="email" name="email" placeholder="이메일을 입력해주세요"></td>
				</tr>
				<tr>
					<td>주소</td>
				</tr>
			</table>
			
			<div id="address">
			<% String  agree1 = (String)request.getAttribute("agree1");%>
			<% String  agree2 = (String)request.getAttribute("agree2");%>
			</div>
			<input type="hidden" name="agree1" value="<%= agree1 %>">
			<input type="hidden" name="agree2" value="<%= agree2 %>">
			<div id="address">
				<input type="text" id="sample4_postcode" name="zipNum"
					placeholder="우편번호"
					style="width: 284px; height: 25px; font-size: 15px;"> <input
					type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"
					class="dup" style="height: 28px;"><br> <input
					type="text" id="sample4_roadAddress" name="addr1"
					placeholder="도로명주소"
					style="width: 600px; height: 25px; font-size: 15px;"><br>
				<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"
					size="50"> <span id="guide"
					style="color: #999; display: none"></span> <input type="text"
					id="sample4_detailAddress" name="addr2" placeholder="상세주소를 기입해주세요"
					style="width: 600px; height: 25px; font-size: 15px;"><br>
				<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"
					size="50"> <input type="hidden" id="sample4_engAddress"
					placeholder="영문주소" size="50"><br>
			</div>
			<div id="btn_div">
				<input type="button" id="btn" style="width: 150px; height: 40px;"
					value="회원가입" onclick="go_save()">
			</div>

			<script src='<c:url value="/resources/js/step2.js"/>'></script>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
</div>
	</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%@ include file="../include/footer.jsp"%>

