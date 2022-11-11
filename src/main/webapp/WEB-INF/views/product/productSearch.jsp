<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>Somme</title>
<link rel="stylesheet" type="text/css" href="/resources/css/wine_list.css">
<link rel="stylesheet" type="text/css" href="/resources/css/scroll.css">
<link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">
<link rel="stylesheet" type="text/css" href="/resources/css/productSearch.css">

<script src="/resources/js/wine_list.js"></script>
	
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

</head>
<body>
<body>
	<div class="scrollBar">

		<!-- header-->
		<%@ include file="../include/header.jsp"%>

		<!-- top banner -->
		<div id="winelistbanner">
			<div class="banner-img">
				<img src="/resources/image/winelistbanner3.jpg" alt="">
			</div>
			<div class="banner-text">
				<h2>WINE</h2>
				<strong class="sub_title">검색 결과</strong>
			</div>
		</div>


		<section id="slist">
			<div id="SearchList">

				<c:forEach var="search" items="${productListS}">
					<div class="wine-item">
						<div class="sa sa-up" data-sa-delay="200">
							<div class="for_fig">
								<a href='/product/detail?prodno=<c:out value="${search.prodno}"/>'>
									<img src='/resources/image/<c:out value="${search.image}"/>' class="wine-img"/>
									<figcaption>자세히보기</figcaption>
								</a>
							</div>
							<div class="wine-name">
								<a href='/product/detail?prodno=<c:out value="${search.prodno}"/>'>
								<c:out value="${search.name_kr}" /> <br>
					<c:out value="${search.name_en}" /> </a>
					<p><fmt:formatNumber type="number" maxFractionDigits="3" value="${search.price}"/>원
					</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>

		<script>
      // Scroll Animation (sa, 스크롤 애니메이션)
      const saTriggerMargin = 300;
      const saElementList = document.querySelectorAll('.sa');

      const saFunc = function() {
        for (const element of saElementList) {
          if (!element.classList.contains('show')) {
            if (window.innerHeight > element.getBoundingClientRect().top + saTriggerMargin) {
              element.classList.add('show');
            }
          }
        }
      }

      window.addEventListener('load', saFunc);
      window.addEventListener('scroll', saFunc);
	</script>

		<!-- 푸터 -->
		<%@ include file="../include/footer.jsp"%>
	</div>

</body>


</html>