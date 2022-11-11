<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="<c:url value="/resources/css/scrollbar.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/sidebar_list2.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/my_cart_list.css"/>" rel='stylesheet' />

<%@ include file="../include/header.jsp"%>

<script src='<c:url value="/resources/js/step2.js"/>'></script>

<style>
#container {
	width: 600px;
	font-family: 'RIDIBatang';
	font-size: 16px;
	text-decoration: none;
	float: left;
	margin-left: 150px;
}

#container table {
	line-height: 35px;
	width: 550px;
	margin: 0 auto;
}

#btn {
	font-family: 'RIDIBatang';
	width: 150px;
	height: 40px;
	border-radius: 3px;
	margin-right: -4px;
	border: 1px solid #881824;
	background-color: rgba(0, 0, 0, 0);
	color: #881824;
	padding: 5px;
	font-size: 20px;
	text-align: center;
}

#btn:hover {
	color: white;
	background-color: #881824;
}

#btn_div {
	text-align: center;
	padding-top: 50px;
	padding-bottom: 20px;
}

td {
	padding: 20px;
}

p {
	font-size: 20px;
	font-weight: bold;
	margin: 0 auto;
	padding-bottom: 15px;
	width: 600px;
	border-bottom: solid 3px #a1a1a1;
}
</style>
<section id="side_current_cart">

		<aside id="sidebar">
			<div>
				<ul id="sidebar_list" list-style="none">
					<input id="check-btn" type="checkbox" checked />
					<li><label for="check-btn">나의 쇼핑</label></li>
					<ul class="menubars">
						<li><a href="/member/Mycart_list">주문내역</a></li>
						<li><a href="/member/Mycart_cancellist">반품내역</a></li>
					</ul>
					<input id="check-btn2" type="checkbox" checked />
					<li><label for="check-btn2">개인 정보</label></li>
					<ul class="menubars2">
						<li><a href="mypage" style="color: black;">회원정보</a></li>
						<li onclick="open_win('update','update')" style="cursor : pointer;" >
							<a>회원정보수정</a></li>
						<li onclick="open_win('delete','delete')" style="cursor : pointer;" >
							<a>회원탈퇴</a></li>
					</ul>
				</ul>
			</div>
		</aside>
	<div id="container">
		<p id="current_item" style="padding-top: 70px">회원 정보</p>
		<table style="background-color: #eeeeee; margin-top: 30px">
			<tr>
				<td width="100px">이름</td>
				<td>${loginUser.name}</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<fmt:formatNumber var="phone_num" value="${loginUser.phone}" pattern="000,0000,0000"/>
				<td><c:out value="${fn:replace(phone_num, ',', '-')}"/></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${loginUser.id}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${loginUser.email}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>[${loginUser.zipNum}] ${loginUser.addr1}/
					${loginUser.addr2}</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>${loginUser.bdate}</td>
			</tr>
		</table>


		<div id="btn_div" style="padding: 60px">
			<input type="submit" id="btn"
				style="width: 150px; height: 40px; margin-right: 20px" value="정보 수정"
				onclick="open_win('update','update')">
			<input type="submit" id="btn" style="width: 150px; height: 40px;"
				value="회원 탈퇴"
				onclick="open_win('delete','delete')">
		</div>

	</div>

</section>

<%@ include file="../include/footer.jsp"%>
