<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<title>Somme</title>
<link rel="stylesheet" type="text/css" href="/resources/css/wine_list.css?var=3">
<link rel="stylesheet" type="text/css" href="/resources/css/scroll.css?var=2">
<link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">

<style>
@font-face {
	font-family: 'RIDIBatang';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff')
		format('woff');
	font-family: 'Molle';
	src: url('/resources/fonts/Molle-Italic.ttf') format('truetype');
	
	
}

</style>

</head>
<body>
	<body>
	<div class="scrollBar">
  
    <!-- header-->
	<%@ include file="../include/header.jsp"%>
	
  <!-- top banner -->
  <div id="winelistbanner">
    <div class="banner-img">
      <img src="/resources/image/winelistbanner.jpg" alt="">
    </div>
    <div class="banner-text">
      <h2>WINE</h2>
      <strong class="sub_title">종류별</strong>
    </div>
  </div>
  
  <!--product list-->
  <section id="item">

    <div id="category">
      <div class="itemlist-filter00">
        <ul>
          <li>
            <a href="/product/wine_list">
              <div class="filter-item" style="background-color:gray; color:white">종류별</div>
            </a>
          </li>
          <li>
            <a href="/product/wine_contry">
              <div class="filter-item">국가별</div>
            </a>
          </li>
        </ul>
      </div>

      <div class="itemlist-filter">
        <ul>
          <li><a href="javascript:all()"><div class="filter-item clicked" >전체</div></a></li>
          <li><a href="javascript:WHITE()"><div class="filter-item">화이트</div></a></li>
          <li><a href="javascript:RED()"><div class="filter-item">레드</div></a></li>
          <li><a href="javascript:ROSE()"><div class="filter-item">로제</div></a></li>
          <li><a href="javascript:SPARKLING()"><div class="filter-item">스파클링</div></a></li>
        </ul>
      </div>
    </div>

		<div id="itemlist">
			<jsp:include page="../product/product_list.jsp"></jsp:include>
		</div>
		</section>

  <script src="/resources/js/wine_list.js?ver=3"></script>

	<!-- 푸터 -->
		<%@ include file="../include/footer.jsp"%>
	</div>

</body>


</html>