<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='<c:url value="/resources/js/step2.js"/>'></script>
</head>
<body>
<div >
<div style="text-align: center; margin-top: 10px;"><h2>아이디 중복 확인</h2></div>
<div style="text-align: center; margin-top: 30px;">
<form action="id_check_form" method="post" name="formm">
	아이디  <input type="text" name="id" value="${id}">
		<input type="submit" value="중복체크"><br><br>
		<c:if test="${result == 1}">
			<script type="text/javascript">
			opener.document.formm.id.value="";
			</script>
			${id} 는 이미 사용 중인 아이디 입니다.
		</c:if>
		<c:if test="${result == -1}">
			${id} 는 사용 가능한 아이디 입니다.
			<input type="button" value="사용" class="cancel" onclick="idok()">
		</c:if>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</div>
</div>
</body>
</html>