<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="/resources/css/chat.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/scrollbar.css"/>" rel='stylesheet' />
<%@ include file="include/header.jsp"%>

<div class="scrollBar">

<div class="outer">
<div class="container">
<h4>실시간 채팅으로 대화를 나눠보세요!</h4>

<iframe src="https://service.dongledongle.com/Wineshop" frameborder="0" width="100%" height="800vh"></iframe>

<div class="buttons">
<input type="submit" id="btn" value="뒤로가기" onClick="history.back()">
<input type="button" id="btn" value="회원가입" onclick="location.href='../member/step1'">
</div>
</div>
</div>
</div>

<%@ include file="include/footer.jsp"%>