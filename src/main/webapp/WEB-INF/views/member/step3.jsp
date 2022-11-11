<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="/resources/css/step3.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/scrollbar.css"/>" rel='stylesheet' />
<%@ include file="../include/header.jsp"%> 
	<div class="scrollBar">
 <!--회원가입-->
    <div id="step3">
        <div id="title">
            <h1>회원가입</h1>
            <div>
                <span>1. 이용약관 동의</span>
                <span>></span>
                <span>2. 회원정보 입력</span>
                <span>></span>
                <span id="title_1">3. 회원가입 완료</span>
            </div>
        </div>
        <div id="main">
            <div>
                <img src="/resources/image/welcome.png">
                <h2><span>Somme&nbsp;</span> 회원가입을 진심으로 환영합니다.</h2>
                <p>회원가입이 정상적으로 처리되었습니다.</p>
            </div>
            <div id="btn_div"><a href="loginForm"><button id="btn">로그인</button></a></div>
        </div>
    </div>
	</div>
<%@ include file="../include/footer.jsp"%>