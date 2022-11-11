<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%> 
<link href="<c:url value="/resources/css/scrollbar.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/login.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/search_ID.css"/>" rel='stylesheet' />

<div id="search_page">

	<h2>비밀번호 찾기</h2>
	<div id="login">
		<form >
			<fieldset class="search_box">
				<p style="text-align: center">회원님의 비밀번호는 "1234"로 초기화 되었습니다. <br>
				마이페이지에서 비밀번호를 변경해주세요.</p>
				<br>
				<div id="tool">
					<a href="/member/step1">회원가입 |</a> 
					<a href="/member/searchID_Form"> 아이디 찾기 |</a>
					<a href="javascript:void(0)" onClick="javascript:goPost()"> 로그인 |</a> 
				</div>
				<script type="text/javascript">
				function goPost(){
					    let f = document.createElement('form');
					    f.setAttribute('method', 'get');
					    f.setAttribute('action', 'loginForm?id=${member.id}');
					    document.body.appendChild(f);
					    f.submit();
					}

				</script>
			</fieldset>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</div>
</div>



<%@ include file="../include/footer.jsp"%>
