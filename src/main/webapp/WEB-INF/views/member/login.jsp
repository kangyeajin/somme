<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<link href="<c:url value="/resources/css/login.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/scrollbar.css"/>"
	rel='stylesheet' />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<style>
input[type=submit] {
	background-color: #BDBDBD;
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	cursor: pointer;
	border-radius: 5px;
}

input[type="submit"]:hover {
	background-color: #A4A4A4;
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	cursor: pointer;
	border-radius: 5px;
}
#Kbtn:hover {
	color: white;
}
</style>

<body>
	<div class="scrollBar">

		<div id="loginpage">
			<h2>로그인</h2>
  
			<div id="login">
				<div id="switch">
					<p>
						<a href="/admin/main">관리자</a>
					</p>
				</div>
				<form role="form" method="post" action="/login" name="formm">
				<input type="hidden" name="prodno" value='<c:out value="${prodno}"/>' /> 
					<fieldset class="login_box">
						<div class="login">
							<label for="id"></label>
							<c:choose>
								<c:when test="${empty id}">
								<input placeholder="아이디" name="username" type="text" size="15" autofocus>
									<div class="login">
										<label for="pwd"></label> 
										<input placeholder="비밀번호"
										name="password" type="password" size="15" value="">
									</div>
								</c:when>

								<c:otherwise>
								<input placeholder="아이디" name="username" type="text" size="15" autofocus value="${id}"> 
									<div class="login">
										<label for="pwd"></label> 
										<input placeholder="비밀번호"
										name="password" type="password" size="15" value="">
									</div>
								
								</c:otherwise>
							</c:choose>
						</div>

						<input class="btn" type="submit" value="로그인" style="height: 50px;"><br>
						
						<!-- 카카오 로그인 -->
						<a class="p-2"
							href="https://kauth.kakao.com/oauth/authorize?client_id=30f63685c78dac2b5b5affd97dbf0daf&redirect_uri=http://localhost:8090/member/kakaoLogin&response_type=code">
							 <div id="Kbtn" style="background-color: #fbe300; text-align: center; height: 30px; padding-top: 17px; border-radius: 5px; margin-top:5px;">카카오 로그인</div>
						</a>


						<div id="tool">
							<a href="/member/step1">회원가입 |</a> <a
								href="/member/searchID_Form"> 아이디 찾기 |</a> <a
								href="/member/searchPW_Form"> 비밀번호 찾기</a>
						</div>
						
						<br>
	
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div style="text-align: center">${message} ${error} ${logout}</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
<%@ include file="../include/footer.jsp"%>
