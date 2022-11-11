<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 주문 내역</title>
<link href="<c:url value="/resources/css/scrollbar.css"/>"
	rel='stylesheet' />
<link href="<c:url value="/resources/css/sidebar_list2.css"/>"
	rel='stylesheet' />
<link href="<c:url value="/resources/css/my_cart_list.css"/>"
	rel='stylesheet' />

<script src='<c:url value="/resources/js/step2.js"/>'></script>

<style>
.cartbox {
	box-sizing: border-box;
	border: 3px solid #881824;
	padding: 20px;
	position: relative;
	margin-top: 80px;
	margin-bottom: 76px;
	margin-left: 100px;
	width: 700px;
	height: 300px;
	border-radius: 50px;
}

.innerbox {
	margin-top: 30px;
	text-align: center;
}

.innerbox h3 {
	color: #DF0101;
	margin-top: 30px;
}
</style>
</head>
<body>

	<!-- header -->
	<%@ include file="../include/header.jsp"%>

	<!-- 사이드 바 -->
	<section id="side_current_cart">
		<aside id="sidebar">
			<div>
				<ul id="sidebar_list" list-style="none">
					<input id="check-btn" type="checkbox" checked />
					<li><label for="check-btn">나의 쇼핑</label></li>
					<ul class="menubars">
						<li><a href="/member/Mycart_list" style="color: black;">주문내역</a></li>
						<li><a href="/member/Mycart_cancellist">반품내역</a></li>
					</ul>
					<input id="check-btn2" type="checkbox" checked />
					<li><label for="check-btn2">개인 정보</label></li>
					<ul class="menubars2">
						<li><a href="mypage">회원정보</a></li>
						<li onclick="open_win('update','update')" style="cursor: pointer;">
							<a>회원정보수정</a>
						</li>
						<li onclick="open_win('delete','delete')" style="cursor: pointer;">
							<a>회원탈퇴</a>
						</li>
					</ul>
				</ul>
			</div>
		</aside>

		<div id="current_cart_item">
			<p id="current_item">최근 주문 상품</p>

			<form name="form1" method="post">
				<c:choose>
					<c:when test="${orderList.size() == 0}">
						<div class="cartbox">
							<div class="innerbox">
								<img src="/resources/image/emptycart.png">
								<h3 style="color: red; text-align: center;">최근 주문한 상품이
									없습니다.</h3>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<table id="cartList">
							<tr>
								<th style="width: 100px;">주문일자</th>
								<th style="width: 80px;">주문번호</th>
								<th>상품명</th>
								<th style="width: 130px;">결제 금액</th>
								<th style="width: 80px;">주문 상세</th>
							</tr>

							<c:forEach var="orderList" items="${orderList}">
								<tr>
									<td><fmt:formatDate value="${orderList.indate}"
											type="date" /></td>
									<td><c:out value="${orderList.orderno}" /></td>
									<td><c:out value="${orderList.name_kr}" /></td>
									<td><fmt:formatNumber type="number" maxFractionDigits="3"
											value="${orderList.price}" />원</td>
									<td><a
										href='/member/order_detail?orderno=<c:out value = "${orderList.orderno}"/>'>조회
									</a></td>
								</tr>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
			</form>
			<p id="space"></p>

			<p id="current_item">주문처리 완료 내역</p>
			<form name="form2" method="post">
				<c:choose>
					<c:when test="${orderOKList.size() == 0}">
						<div class="cartbox">
							<div class="innerbox">
								<img src="/resources/image/emptycart.png">
								<h3 style="color: red; text-align: center;">주문처리 완료 내역이
									없습니다.</h3>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<table id="cartList">
							<tr>
								<th style="width: 100px;">주문일자</th>
								<th style="width: 80px;">주문번호</th>
								<th>상품명</th>
								<th style="width: 130px;">결제 금액</th>
								<th style="width: 80px;">주문 상세</th>
							</tr>
							<c:forEach var="orderOKList" items="${orderOKList}">
								<tr>
									<td><fmt:formatDate value="${orderOKList.indate}"
											type="date" /></td>
									<td><c:out value="${orderOKList.orderno}" /></td>
									<td><c:out value="${orderOKList.name_kr}" /></td>
									<td><fmt:formatNumber type="number" maxFractionDigits="3"
											value="${orderOKList.price}" />원</td>
									<td><a
										href='/member/order_detail?orderno=<c:out value = "${orderOKList.orderno}"/>'>조회
									</a></td>
								</tr>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
			</form>
			<div id="buttons" style="float: right;">
				<input type="button" value="쇼핑 계속하기" class="cancel"
					onclick="location.href='/main/'">
			</div>
		</div>

		<script type="text/javascript">
$(document).ready(function() {
    $(".move").on("click", function(e){
        e.preventDefault();
        //클릭된 href값(bno)를 input에 담아 갖고감 - 페이지 값들은 form안에 이미 있음
        actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
        actionForm.attr("action","/board/get"); //action 수정
        actionForm.submit();
      });
}
</script>
		<!-- footer -->
		<%@ include file="../include/footer.jsp"%>
	</section>
</body>
</html>