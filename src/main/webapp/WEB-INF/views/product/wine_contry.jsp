<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Somme</title>
<link rel="stylesheet" type="text/css" href="/resources/css/wine_list.css?var=1">
<link rel="stylesheet" type="text/css" href="/resources/css/scroll.css">
<link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">

<style>
@font-face {
	font-family: 'RIDIBatang';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff')
		format('woff');
	font-family: 'Molle';
	src: url('/resources/fonts/Molle-Italic.ttf') format('truetype');
}
</style>

</head>
<body>
	<div class="scrollBar">
		<!-- header-->
		<%@ include file="../include/header.jsp"%>

		<!-- top banner -->
		<div id="winelistbanner">
			<div class="banner-img">
				<img src="/resources/image/winelistbanner2.jpg" alt="">
			</div>
			<div class="banner-text">
				<h2>WINE</h2>
				<strong class="sub_title">국가별</strong>
			</div>
		</div>

		<!--product list-->

		<section id="item">
			<div id="category">
				<div class="itemlist-filter00">
					<ul>
						<li><a href="/product/wine_list"><div class="filter-item">종류별</div>
						</a></li>
						<li><a href="/product/wine_contry"><div class="filter-item" style="background-color: gray; color: white">국가별</div>
						</a></li>
					</ul>
				</div>

				<div class="itemlist-filter">
					<ul>
						<li><a href="javascript:kindall()"><div class="filter-item clicked">전체</div></a></li>
						<li><a href="javascript:FRANCE()"><div class="filter-item">프랑스</div></a></li>
						<li><a href="javascript:ITALY()"><div class="filter-item">이탈리아</div></a></li>
						<li><a href="javascript:SPAIN()"><div class="filter-item">스페인</div></a></li>
						<li><a href="javascript:GERMANY()"><div class="filter-item">독일</div></a></li>
						<li><a href="javascript:USA()"><div class="filter-item">미국</div></a></li>
						<li><a href="javascript:CHILE()"><div class="filter-item">칠레</div></a></li>
						<li><a href="javascript:AUSTRALIA()"><div class="filter-item">호주</div></a></li>
					</ul>
				</div>
			</div>

			<div id="itemlist">
				<jsp:include page="../product/product_list.jsp"></jsp:include>
			</div>
		</section>

		<script src="/resources/js/wine_list.js?ver=5"></script>

		<!-- 푸터 -->
		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>