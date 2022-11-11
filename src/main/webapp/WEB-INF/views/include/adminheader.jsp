<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/header.css"/>" rel='stylesheet' />


</head>
<body>

	<header id="header">
		<section>
			<a id="logo">Somme</a>
			<nav id="top_menu">
				<ul>
					<li><a id="right_button"
						href="/main/">
						<img src="/resources/image/logout.png" width="32" height="31"></a></li>
				</ul>
			</nav>
			<div class="clear"></div>
		</section>
		<nav id="main_menu">
			<ul class="main_menu2">
				<li><a href="/admin/product/productList">상품리스트</a>
				<li><a href="/admin/order/orderList">주문리스트</a>
					<ul class="sub">
						<li><a href="/admin/order/orderList">주문리스트</a></li>
						<li><a href="/admin/order/cancelList">반품리스트</a></li>
					</ul></li>
				<li><a href="/admin/member/memberList">회원리스트</a></li>
				<li><a href="/admin/notice/notice">게시판리스트</a>
					<ul class="sub">
						<li><a href="/admin/notice/notice">공지사항</a></li>
						<li><a href="/admin/notice/review">리뷰</a></li>
						<li><a href="/admin/notice/qna">Q&A</a></li>
						<li><a href="/admin/notice/event">이벤트</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</header>

</body>
</html>