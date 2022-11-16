<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="/resources/css/header.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/footer.css"/>" rel='stylesheet' />
<script src='<c:url value="/resources/js/jquery.js"/>'></script>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<style>
	@font-face {
      font-family: 'RIDIBatang';
      src: url('/resources/fonts/RIDIBatang.otf') format('woff');
      font-family: 'Molle';
      src: url('/resources/fonts/Molle-Italic.ttf') format('truetype');
    }
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.2.min.js"></script>

<script>
	function go_searchh() {
		var foormm = document.foormm;
		if (foormm.search.value == "") {
			foormm.search.focus();
			alert("검색할 내용을 입력해 주세요.");
			return false;
		} else {
			document.foormm.submit();
			foormm.action = "/product/productSearch";
			foormm.submit();
		}
	}
	function go_searchhh() {
		var foormm = document.foormmm;
		if (foormm.search.value == "") {
			foormm.search.focus();
			alert("검색할 내용을 입력해 주세요.");
			return false;
		} else {
			document.foormm.submit();
			foormm.action = "/product/productSearch";
			foormm.submit();
		}
	}
	$(document).ready(function() {
		var jbOffset = $('#main_menu').offset();
		$(window).scroll(function() {
			if ($(document).scrollTop() > jbOffset.top) {
				$('#main_menu').addClass('jbFixed');
				$('#main_menu3').addClass('imgFixed');
				$('.main_menu2').addClass('jbFixed');
				$('.input-container2').addClass('searchFixed');
			} else {
				$('#main_menu').removeClass('jbFixed');
				$('#main_menu3').removeClass('imgFixed');
				$('.main_menu2').removeClass('jbFixed');
				$('.input-container2').removeClass('searchFixed');
			}
		});
	});
</script>
<!-- header -->
<header id="header">
	<section>
		<a id="logo" href="/main/">Somme</a>
		<nav id="top_menu" style="width: 370px">

			<c:choose>
			
			<c:when test="${not empty sessionScope.loginUser}">
				<li onclick="alert('로그아웃 하셨습니다')"><a href="/member/logout">${loginUser.id}님 [logout]</a></li>
				<li><a id="right_button" href="/member/Mycart_list"> <img
						src="/resources/image/마이페이지.png" width="32" height="31">
				</a></li>
				<li><a id="right_button" href="/cart/"> <img
						src="/resources/image/장바구니.png" width="30" height="30"></a></li>
			</c:when>
			
			<c:otherwise>
			<!-- 로그인유저 -->
				<sec:authorize access="isAuthenticated()">
					<li onclick="alert('로그아웃 하셨습니다')"><a href="/member/logout">
								<sec:authentication property="principal.username" />님 [logout]</a></li>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li>
					<a id="right_button" href="/admin/product/productList">
					<img src="/resources/image/마이페이지.png" width="32" height="31">
					</a>
					</li>
					</sec:authorize>
					
					<sec:authorize access="hasRole('ROLE_MEMBER')">
					<li>
					<a id="right_button" href="/member/Mycart_list">
					<img src="/resources/image/마이페이지.png" width="32" height="31">
					</a>
					</li>
					<li><a id="right_button" href="/cart/"> <img
							src="/resources/image/장바구니.png" width="30" height="30"></a></li>
					</sec:authorize>
				</sec:authorize>
				
				<!-- 로그아웃 유저 -->
				<sec:authorize access="isAnonymous()">
					<li onclick="alert('로그아웃 하셨습니다')">
					<a href="/member/logout"></a></li>
					<li><a id="right_button" href="/member/loginForm"> <img
							src="/resources/image/마이페이지.png" width="32" height="31">
					</a></li>
					<li><a id="right_button" href="/member/loginForm"> <img
							src="/resources/image/장바구니.png" width="30" height="30"></a></li>
				</sec:authorize>
			</c:otherwise>
			</c:choose>
		</nav>

		<form name="foormm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		
			<div class="input-container">
				<input class="effect-1" type="text" name="search"
					placeholder="오늘 마시고 싶은 와인은?" /> <span class="focus-border"></span>
				<button
					style="background-color: #881824; color: white; border: none; width: 40px; height: 20px; border-radius: 5px;"
					onClick="go_searchh()">검색</button>
			</div>
		</form>
		<div class="clear"></div>
	</section>
	<nav id="main_menu">
		<ul class="main_menu2">
			<li><a href="/product/wine_list/">와인</a>
				<ul class="sub">
					<li><a href="/product/wine_list">종류별</a></li>
					<li><a href="/product/wine_contry">국가별</a></li>
				</ul></li>
			<li><a href="/wineselect/wineselect">취향별 추천</a></li>
			<li><a href="/notice/notice">공지사항</a>
				<ul class="sub">
					<li><a href="/notice/notice">공지사항</a></li>
					<li><a href="/review/review_best">리뷰</a></li>
					<li><a href="/qna/QNA">Q&A</a></li>
				</ul></li>
			<li><a href="/notice/event">이벤트</a></li>
		</ul>

		<!-- 로그인 상태 유저 -->
		<c:choose>
			<c:when test="${not empty sessionScope.loginUser}">
				<ul id="main_menu3">
				<li><a id="right_button" href="/cart/cart/"> <img
						src="/resources/image/장바구니w.png" width="32" height="31">${loginUser.id}님 [logout]</a></li>

				<li><a id="right_button" href="/member/Mycart_list"> <img
						src="/resources/image/마이페이지w.png" width="30" height="30">
				</a></li>
				<li onclick="alert('로그아웃 하셨습니다')"><a href="/member/logout">
				</a></li>
			</ul>
			</c:when>
			<c:otherwise>
			<!-- 로그인 유저 -->
				<sec:authorize access="isAuthenticated()">
				
					<sec:authorize access="hasRole('ROLE_ADMIN')">
					<ul id="main_menu3">
						<li><a id="right_button" href="/admin/product/productList"> 
						<img src="/resources/image/마이페이지w.png" width="32" height="31" >
						</a></li>
						<li onclick="alert('로그아웃 하셨습니다')">
						<a style="padding-bottom:10px" href="/member/logout">
							<sec:authentication property="principal.username" />님 [logout]
						</a>
						</li>
					</ul>
					</sec:authorize>

					<sec:authorize access="hasRole('ROLE_MEMBER')">
					<ul id="main_menu3">
						<li><a id="right_button" href="/cart/cart/"> <img
								src="/resources/image/장바구니w.png" width="32" height="31">
									<sec:authentication property="principal.username" />님 [logout]</a></li>
		
						<li><a id="right_button" href="/member/Mycart_list"> <img
								src="/resources/image/마이페이지w.png" width="30" height="30">
						</a></li>
						<li onclick="alert('로그아웃 하셨습니다')"><a href="/member/logout">
						</a></li>
					</ul>
					</sec:authorize>
					
				</sec:authorize>
				<!-- 로그아웃 유저 -->
				<sec:authorize access="isAnonymous()">
					<ul id="main_menu3">
						<li><a id="right_button" href="/member/loginForm"> <img
								src="/resources/image/장바구니w.png" width="32" height="31"></a></li>
		
						<li><a id="right_button" href="/member/loginForm"> <img
								src="/resources/image/마이페이지w.png" width="30" height="30">
						</a></li>
						<li onclick="alert('로그아웃 하셨습니다')"><a href="/member/logout">
						</a></li>
					</ul>
				</sec:authorize>
			</c:otherwise>
		</c:choose>
		


		<div class="clear"></div>
		<form name="foormmm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		
			<div class="input-container2">
				<input class="effectt-1" type="text" name="search"
					placeholder="오늘 마시고 싶은 와인은?" /> <span class="focus-border"></span>
				<button
					style="background-color: #AC7E7E; color: white; border: none; width: 40px; height: 20px; border-radius: 5px;"
					onClick="go_searchhh()">검색</button>
			</div>
		</form>
	</nav>
</header>