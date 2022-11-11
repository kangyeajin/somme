<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ include file="../include/header.jsp" %>  
<link href="<c:url value="/resources/css/scrollbar.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/sidebar_list2.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/my_cart_list.css"/>" rel='stylesheet' />
<script type="text/javascript" src="/resources/js/step2.js"></script>

<section id="side_current_cart">
<aside id="sidebar">
	<div>
		<ul id="sidebar_list" list-style="none">
			<input id="check-btn" type="checkbox" checked />
			<li><label for="check-btn">나의 쇼핑</label></li>
			<ul class="menubars">
				<li><a href="/member/Mycart_list" >주문내역</a></li>
				<li><a href="/member/Mycart_cancellist" style="color: black;">반품내역</a></li>
			</ul>
			<input id="check-btn2" type="checkbox" checked />
			<li><label for="check-btn2">개인 정보</label></li>
			<ul class="menubars2">
				<li><a href="WineshopServlet?command=mypage">회원정보</a></li>
				<li
					onclick="open_win('WineshopServlet?command=check_pass_form','update')"
					style="cursor: pointer;"><a>회원정보수정</a></li>
				<li
					onclick="open_win('WineshopServlet?command=check_pass_form','delete')"
					style="cursor: pointer;"><a>회원탈퇴</a></li>
			</ul>
		</ul>
	</div>
</aside>

	<div id="current_cart_item">
		<c:choose>
			<c:when test="${orderList.size() == 0}">

				<div class="cartbox">
					<div class="innerbox">
						<img src="/resources/image/emptycart.png">
						<h3 style="color: red; text-align: center;">주문한 상품이 없습니다.</h3>
					</div>
				</div>
			</c:when>
			<c:otherwise>
						<p id="current_item">주문자 정보</p>

						<table id="cartList" class="listmargin">
							<tr>
								<th>주문일자</th>
								<th>주문번호</th>
								<th>주문자</th>
								<th>주문총액</th>
							</tr>
							<tr>
								<td><fmt:formatDate value="${orderList[0].indate}" type="date"/></td>
								<td><c:out value="${orderList[0].orderno}"/></td>
								<td><c:out value="${orderList[0].name}"/></td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice}"/>원</td>
							</tr>
						</table>

						<p id="current_item">배송 정보</p>

						<table id="addrlist" class="listmargin">
							<tr>
								<th>주문자</th>
								<td><c:out value="${orderList[0].name}"/></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>
									<fmt:formatNumber var="licsNo" value="${orderList[0].phone}" pattern="000,0000,0000"/>
									<c:out value="${fn:replace(licsNo, ',', '-')}" />
								</td>
							</tr>
							<tr>
								<th>배송주소</th>
								<td>(<c:out value="${orderList[0].zipNum}"/>)
								 	 <c:out value="${orderList[0].addr1}"/>
								 	 <c:out value="${orderList[0].addr2}"/>
								</td>							</tr>
							<tr>
								<th>배송메세지</th>
								<td>
								 	 <c:out value="${orderList[0].message}"/>
								</td>
							</tr>
						</table>

						<p id="current_item">주문 상세</p>
				<c:forEach var="orderList" items="${orderList}">
						<div class="current_item_list">
							<ul>
								<li><a
									href='/product/detail?prodno=<c:out value="${orderList.prodno}"/>'>
										<img src="/resources/image/${orderList.image}" alt="red">
								</a></li>
								<li id="item_name"><span><a
										href='/product/detail?prodno=<c:out value="${orderList.prodno}"/>'>
											<c:out value="${orderList.name_kr}"/>
											<br> 
											<c:out value="${orderList.name_en}"/>
									</a></li>
								<li>
									<table id="pay">
										<tr>
											<td><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${orderList.price}" />원</td>
										</tr>
										<tr>
											<td>${orderList.num}개</td>
										</tr>
									</table>
								</li>
								<li>
									<table id="money">
										<tr>
											<td><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${orderList.price * orderList.num}" />원
											</td>
											<td><fmt:formatDate value="${orderList.indate}"
													type="date" /></td>
											<td>
		 										<c:choose>
         											<c:when test='${orderList.result=="3"}'> 진행중 </c:when>
         											<c:otherwise> <span style="color:blue"> 처리완료 </span></c:otherwise>
         										</c:choose>
											</td>
										</tr>
									</table>
								</li>
							</ul>
						</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</section>


<%@ include file="../include/footer.jsp" %> 
