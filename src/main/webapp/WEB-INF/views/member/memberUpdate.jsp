<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="<c:url value="/resources/css/sidebar_list.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/scrollbar.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/step2.css"/>" rel='stylesheet' />

<script src='<c:url value="/resources/js/step2.js"/>'></script>
<%@ include file="../include/header.jsp"%>
	<div class="scrollBar">

<div id="container">
	<div id="title">
		<h1>회원 정보 수정</h1>
		
	</div>
	<!--회원 정보 입력 폼-->
	<form name="formm" method="post" action="memberUpdate" >
		<div id="main">
			<div id="box" style="border: 1px solid rgb(190, 190, 190)">
			<div id=btn_div>
			<input type="button" id="box_btn"style="width: 150px; height: 40px;" onclick="userChk()" value="본인인증">
			</div>
			<script type="text/javascript">
			function userChk(){
			var url = "send_sms_form";
		
			window.open(url, "_blank_1",
	               "toolbar=no, menubar=no, scrollbars=yes," +
	               " resizable=no, width=450, height=200");
			}
			</script>
			<p>정보통신만 이용 촉진 및 정보보호 등에 관한 법률 및 청소년 보호법의 규정에 의하여</p>
			<p>19세 미만의 청소년은 이용할 수 없습니다.</p>
		</div>

			<table>
				<tr><td>아이디 </td></tr>
				<tr><td><input type="text" name="id" value="${loginUser.id}" readonly></td></tr>
				<tr><td>생년월일 </td></tr>
				<tr><td><input type="date" name="bdate" value="${loginUser.bdate}"readonly></td></tr>
				<tr><td>이름 *</td></tr>
				<tr><td><input type="text" name="name" value="${loginUser.name}"></td></tr>
			</table>
			<div id="address" style="margin-top: 10px;">
				<p>전화번호</p>
				
				<c:if test="${reiid == null}">
				<input type="text" name="phone" value="${loginUser.phone}" readonly placeholder="본인인증을 해주세요">
				<input type="hidden" name="reiid" size="20" value="${loginUser.phone}">
				</c:if>
				<c:if test="${reiid != null}"> 
				<input type="text" name="phone" maxlength="11" value="${phone}" readonly>
				<input type="hidden" name="reiid" size="20" value="${phone}">
				</c:if> 
			</div>

			<table>
				<tr><td>비밀번호 *</td></tr>
				<tr><td><input type="password" name="pwd" value=""
						minlength="8"></td></tr>
				<tr><td>비밀번호 확인 *</td></tr>
				<tr><td><input type="password" name="pwdCheck"
						value="" minlength="8"></td></tr>
				<tr><td>이메일 *</td></tr>
				<tr><td><input type="email" name="email" value="${loginUser.email}"></td></tr>
				<tr><td>개인(신용)정보의
						수집.이용에 관한 동의</td></tr>
				
				<c:choose>
					<c:when test='${loginUser.agree1 eq "1"}'>
						<tr><td><input type="checkbox" name="agree1" value="1" id="agree1" checked="checked"></td></tr>
					</c:when>
					<c:otherwise>
						<tr><td><input type="checkbox" name="agree1" id="agree1" value="1"></td></tr>
					</c:otherwise>
				</c:choose>
				
				<tr><td>마케팅 수신 동의
					(sns를 통한 마케팅에 동의)</td></tr>
				<c:choose>
					<c:when test='${loginUser.agree2 eq "1"}'>
						<tr><td><input type="checkbox" name="agree2" value="1" id="agree2" checked="checked"></td></tr>
					</c:when>
					<c:otherwise>
						<tr><td><input type="checkbox" name="agree2" id="agree2" value="1"></td></tr>
					</c:otherwise>
				</c:choose>							
				<tr><td>주소</td></tr>
			</table>

			<div id="address">
				<input type="text" id="sample4_postcode" name="zipNum"
					value="${loginUser.zipNum}"
					style="width: 284px; height: 25px; font-size: 15px;"> <input
					type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"
					class="dup" style="height: 28px;"><br> 
					<input type="text" id="sample4_roadAddress" name="addr1"
					value="${loginUser.addr1}"
					style="width: 600px; height: 25px; font-size: 15px;"><br>
				<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"
					size="50"> <span id="guide"
					style="color: #999; display: none"></span> 
					<input type="text"
					id="sample4_detailAddress" name="addr2" value="${loginUser.addr2}"
					style="width: 600px; height: 25px; font-size: 15px;"><br>
				<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"
					size="50"> <input type="hidden" id="sample4_engAddress"
					placeholder="영문주소" size="50"><br>
			</div>
			<div id="btn_div">
				<input type="button" id="btn" style="width: 150px; height: 40px; margin-right:20px"
					value="수정" onclick="memberCheck()">
				<input type="button" id="btn" style="width: 150px; height: 40px; "
					value="취소" onclick="location.href='mypage'">
			</div>


		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
</div>
	</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%@ include file="../include/footer.jsp"%>

