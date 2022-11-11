<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Somme</title>
<link rel="stylesheet" type="text/css" href="/resources/css/pay_done.css">
<link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">

<style>
@font-face {
   font-family: 'RIDIBatang';
   src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
   font-family: 'Molle';
   src: url('/resources/fonts/Molle-Italic.ttf') format('truetype');
}
</style>

</head>
<body>
  <div class="scrollBar">
  <!-- header-->
  <%@ include file="../include/header.jsp"%>
  
<section id="payment">

  <div id="title">
    <h1>주문 완료</h1>
    <div>
        <span>1. 장바구니</span>
        <span>></span>
        <span>2. 주문/결제</span>
        <span>></span>
        <span id="title_1">3. 주문 완료</span>
    </div>
    </div>

  <div id="pay_done">
    <p id="item">주문내역</p>

<c:forEach items="${paymentlist}" var="paymentlist">
      <div class="pay_done_list">
      <ul>
        <li><a href="detail.html"><img src='/resources/image/<c:out value="${paymentlist.image}"/>' alt="red"></a></li>
        <li id="item_name"><span><a href='/product/detail?prodno=<c:out value="${paymentlist.prodno}"/>'>
        	<c:out value="${paymentlist.name_kr}"/> <br> <c:out value="${paymentlist.name_en}"/> </a></li>
        <li>
          <table id="money">
            <tr>
                <ul class="area_count_2">
                  <li>총 상품금액(<span id='result2'><c:out value="${paymentlist.no}"/></span>개)</li>
                  <li><span id="price2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paymentlist.price*paymentlist.no}" /></span>원</li>
                </ul>
            </tr>
          </table>        
        </li>
      </ul>
    </div>
</c:forEach>

    <div id="all_price">
      <p>총 결제금액<fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice}"/>원</p>
    </div>

      <div id="done">
        <ul>
          <li><img src="/resources/image/done.png"></li>
          <li>상품 구매에 성공했습니다 !</li>
        </ul>
    </div>

  </div>
</section>

  <!-- 푸터 -->
  <%@ include file="../include/footer.jsp"%>
  
  <script src="/resources/js/detail.js"></script>
  </div>

</body>
</html>