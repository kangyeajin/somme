<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div >
<div style="text-align: center; margin-top: 10px;"><h2>본인 인증</h2></div>
<div style="text-align: center; margin-top: 30px;">
<form action="WineshopServlet?command=id_send_sms" method="post" name="forrmm">

		<c:if test="${phone == null}">
		전화번호  <input type="text" name="phone" placeholder="숫자만 입력해주세요">
		<input type="submit" value="인증번호 요청" onclick="javascript: forrmm.action='send_sms';"><br><br>
		</c:if>
		<c:if test="${phone != null}">
		전화번호<input type="text" name="phone" value="${phone}"><br><br>
		</c:if> 

		<c:if test="${code == null}">
		인증번호 입력 : <input type="text" name="code" style="width:100px">
		</c:if>
		<c:if test="${code != null}"> 
		인증번호 입력 : <input type="text" name="Ucode" style="width:100px"><br>
		<input type="hidden" name="Tcode" value="${code}">
		<input type="button" value="완료" class="cancel" onclick="userok()">
		<script type="text/javascript">
		
		function userok(){
			if(forrmm.Ucode.value != forrmm.Tcode.value){
				alert("틀리셨습니다");
				return false;
			}else{
				opener.formm.phone.value = document.forrmm.phone.value;
				opener.formm.reiid.value = document.forrmm.phone.value;
				alert("본인인증을 완료하였습니다.");
				self.close();
			}
		}
		</script>
		</c:if>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</div>
</div>
</body>
</html>