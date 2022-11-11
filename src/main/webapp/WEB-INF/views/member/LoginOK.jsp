<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<link href="<c:url value="/resources/css/scrollbar.css"/>"
	rel='stylesheet' />
<link href="<c:url value="/resources/css/login.css"/>" rel='stylesheet' />

<c:if test="${empty loginUser}">
	<jsp:forward page='main.jsp' />
</c:if>
<div class="scrollBar">
	<div id="loginpage">
		<h2>방문을 환영합니다</h2>
		<div id="login">
			<form method="post" action="WineshopServlet?command=">
				<input type="hidden" name="name" value="${loginUser.name}">
				<input type="hidden" name="name" value="${loginUser.id}">
				<input type="hidden" name="prodno" value='<c:out value="${prodno}"/>' /> 
				<fieldset class="login_box">
					<div style="text-align: center">
						<p>안녕하세요. ${loginUser.name}(${loginUser.id})님
						<p>
							<br>
					</div>
					<br>
					<div id="tool">
						<a href="/main/">홈 | </a> <a href="/member/Mycart_list">마이페이지 </a><br>
						<br>
						<hr>
						<c:choose>
							<c:when test='${prodno == null || prodno == ""}'></c:when>
							<c:otherwise>
							<br>
								<a href='/product/detail?prodno=<c:out value="${prodno}"/>'
								   style="color:red">
								 이전 상품 이어서 보기</a>
							</c:otherwise>
						</c:choose>
						<br>
						<div style="text-align: center">${message}</div>
					</div>
				</fieldset>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>