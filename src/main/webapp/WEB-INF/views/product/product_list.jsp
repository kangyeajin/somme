<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script src="/resources/js/wine_list.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Somme</title>

<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 

<link rel="stylesheet" type="text/css" href="/resources/css/wine_list.css?var=3">
<link rel="stylesheet" type="text/css" href="/resources/css/scroll.css?var=2">

<c:forEach items="${productList}" var="productList">
	<div class="wine-item">
		<div class="wine-item-inner">
			<div data-aos="fade-up">
				<div class="for_fig">
					<a href='/product/detail?prodno=<c:out value="${productList.prodno}"/>'>
						<img src='/resources/image/<c:out value="${productList.image}"/>' />
						<figcaption>자세히보기</figcaption>
					</a>
				</div>
				<div class="winename">
					<a href='/product/detail?prodno=<c:out value="${productList.prodno}"/>'><c:out
							value="${productList.name_kr}" /> <br>
					<c:out value="${productList.name_en}" /> </a>
					<p><fmt:formatNumber type="number" maxFractionDigits="3" value="${productList.price}"/>원
					</p>
				</div>
			</div>
		</div>
	</div>
</c:forEach>

<div class="clear"></div>

<script>
	AOS.init();
</script>

