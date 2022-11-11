<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%--board 참고함 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='<c:url value="/resources/js/step2.js"/>'></script>
</head>
<body>
	<div align="center">
		<h1>비밀번호 확인</h1>
		<form action="check_pass" name="formm" method="get">
			<input type="hidden" name="id" value="${loginUser.id}">
			<table style="width: 80%">
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" size="20"></td>
				</tr>
			</table>
			<br> <input type="submit" value=" 확 인 "
				onclick="return passCheck()"> <br>
			<br>${message}
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		<script type="text/javascript">
		function passCheck() {
			if(documant.formm.pass.value.length == 0){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			return true;	
		}
		</script>
	</div>
</body>
</html>