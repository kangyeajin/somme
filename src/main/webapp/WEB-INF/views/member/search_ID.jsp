<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="/resources/css/scrollbar.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/login.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/search_ID.css"/>" rel='stylesheet' />
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
        <h2>아이디 찾기</h2>
        <div id="login">
            <form method="post" action="/member/search_ID">            				
		<fieldset class="search_box">
				<div class="search">
					<label for="name"></label> <input type="text" name="name"
						placeholder="이름" size="15">
				</div>
				<div class="search">
					<label for="phone"></label> <input type="text" name="phone"
						placeholder="전화번호(- 제외 입력)" size="15">
				</div>
				<blockquote>
					<input type="submit" value="아이디 찾기" class="submit" style="height:50px;">
				</blockquote>

				<div id="tool">
					<a href="/member/step1">회원가입 |</a> 
					<a href="/member/loginForm"> 로그인 |</a> 
					<a href="/member/searchPW_Form"> 비밀번호 찾기</a>
				</div><br>
				<div style="text-align: center; color: #df0202">${message}</div>
			</fieldset>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
        </div>
    </div>
    
<%@ include file="../include/footer.jsp"%>