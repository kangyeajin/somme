<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Somme</title>
<link href="/resources/css/notice_login.css" rel='stylesheet' />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<script>
		
		$(document).ready(function(){
			$('.btn').on("click", function(e){
				var f = $('form');
				e.preventDefault();
				if($(this).val()=="확인"){
					if (!$("input[name='pwd']").val()) {
						alert("비밀번호를 입력하세요.");
						return false;
					}else
						f.submit();
				}else if($(this).val()=="취소"){
					f.attr("action","/review/review_detail");
					
					f.submit();
				}
			});
		})
	</script>
	<%@ include file="../include/header.jsp"%>
	<div class="scrollBar">

		<div id="loginpage">
			<h2>비밀번호를 입력하세요</h2>
			<div id="login">
				<form action="/review/check_success" name="frm">
				<input type='hidden' name='reviewno' value='<c:out value="${param.reviewno}"/>'>
				<input type='hidden' name='prodno' value='<c:out value="${param.prodno}"/>'>
				<input type='hidden' name='val' value='<c:out value="${param.val}"/>'>
				<input type='hidden' name='pageNum' value='<c:out value="${param.pageNum}"/>'>
  				<input type='hidden' name='amount' value='<c:out value="${param.amount}"/>'>
  				<input type='hidden' name='type' value='<c:out value="${param.type}"/>'>
  				<input type='hidden' name='keyword' value='<c:out value="${param.keyword}"/>'>
					<fieldset class="login_box">
						<div class="login">
							<div class="login">
								<label for="pwd"></label> <input type="password" name="pwd"
									placeholder="비밀번호" size="15">
							</div>
						</div>

						<div id="btns">
							<input class="btn" type="submit" value="취소" style="height: 50px;">
							<input class="btn" id="y" type="submit" value="확인"
								style="height: 50px;"><br>
						</div>
						<br>
						<span style="display: table; margin: 0 auto; color:#b11424;">${msg}</span>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>