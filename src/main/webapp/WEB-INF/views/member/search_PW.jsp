<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="/resources/css/login.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/scrollbar.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/search_PW.css"/>" rel='stylesheet' />
<%@ include file="../include/header.jsp"%> 

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

</style>

<div id="search_page">
        <h2>비밀번호 찾기</h2>
        <div id="login">
            <form method="post" action="/member/search_PW">            				
		<fieldset class="search_box">
				<div class="search">
					<label for="id"></label> <input type="text" name="id"
						placeholder="아이디" size="15">
				</div>
				<div class="search">
					<label for="pwd"></label> <input type="text" name="name"
						placeholder="이름" size="15">
				</div>
				<div class="search">
					<label for="email"></label> <input type="text" name="email"
						placeholder="이메일" size="15">
				</div>
				<blockquote>
					<input type="submit" value="비밀번호 찾기" class="submit" style="height:50px;">
				</blockquote>
				<div id="tool">
				<a href="/member/step1">회원가입 |</a> 
				<a href="/member/searchID_Form"> 아이디 찾기 |</a> 
				<a href="/member/loginForm"> 로그인 |</a> 
				</div><br>
				<div style="text-align: center; color: #df0202">${message}</div>
			</fieldset>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
        </div>
    </div>
    
<%@ include file="../include/footer.jsp"%>