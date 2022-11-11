<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%> 
<link href="<c:url value="/resources/css/scrollbar.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/login.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/search_ID.css"/>" rel='stylesheet' />

<div id="search_page">

	<h2>아이디 찾기</h2>
	<div id="login">
		<form >
			<fieldset class="search_box">
				<p style="text-align: center">"${member.name}"님의 아이디는 "${member.id}"입니다</p>
				<br>
				<div id="tool">
					<a href="/member/step1">회원가입 |</a> 
					<a href="javascript:void(0)" onClick="javascript:goPost()"> 로그인 |</a> 
					<a href="/member/searchPW_Form"> 비밀번호 찾기</a>
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
