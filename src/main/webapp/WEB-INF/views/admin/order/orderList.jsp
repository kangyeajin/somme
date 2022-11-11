<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 리스트</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/memberlist.css?ver=1">
<link rel="stylesheet" type="text/css"
	href="/resources/css/scrollbar.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">

	function go_search() {
		var theForm = document.frm;
		theForm.action = "/admin/order/orderList";
		theForm.submit();
	}

	function allChk(obj)  {
	    const checkboxes = document.getElementsByName('RowCheck');
	    checkboxes.forEach((checkbox) => {
	      checkbox.checked = obj.checked;
	    })
	    
	    var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length - 1;
		var check = obj.checked;
		if (check) {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox")
					chkObj[i].checked = true;
			}
		} else {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox") {
					chkObj[i].checked = false;
				}
			}
		}
	  }

	function go_order_save() {
		var count = 0;
		if (document.frm.RowCheck.length == undefined) {
			if (document.frm.RowCheck.checked == true) {
				count++;
			}
		} else {
			for (var i = 0; i < document.frm.RowCheck.length; i++) {
				if (document.frm.RowCheck[i].checked == true) {
					count++;
				}
			}
		}
		if (count == 0) {
			alert("주문처리할 항목을 선택해 주세요.");
		} else {
			document.frm.action = "/admin/order_save";
			document.frm.submit();
		}
	}
	
	$(document).ready(function(){
		var aForm = $("#actionForm");
		
		$("#btn_pge a").on("click",function(e){
			e.preventDefault();
			aForm.find("input[name='pageNum']").val($(this).attr("href"));
			aForm.submit();
		});
		
		   //검색
		   var searchForm = $('#searchForm');   //변수에 form의 값을 담아줌
		    $("#searchForm button").on("click", function(e){
		        console.log("=========================")
		       if(!searchForm.find("option:selected").val()){//옵션을 선택하지 않은 경우
		          alert("검색종류를 선택하세요");
		          return false;
		       }
		       if(!searchForm.find("input[name='keyword']").val()){//검색 키워드를 입력하지 않은 경우
		          alert("키워드를 입력하세요");
		          return false;
		       }
		       searchForm.find("input[name='pageNum']").val("1");//페이지의 첫번째로 이동
		        e.preventDefault();//버튼의 기본 이벤트 동작을 막음
		       
		        searchForm.submit();
		        console.log("==========submit===========")
		      });
		   
		    var sForm = $('#searchForm');
		    var kw = $("input[name='keyword']").val();
		    
			$('#orderCheck').on("click", function(e) {
				 if(kw==1){
					 searchForm.find("input[name='keyword']").val('');
					 searchForm.find("input[name='pageNum']").val("1");
					 searchForm.find("input[name='type']").val('');
		    	  }else{
		    		  searchForm.find("input[name='type']").val('');
		    		  searchForm.find("input[name='keyword']").val('1');
		    		  searchForm.find("input[name='pageNum']").val("1");
		    		  searchForm.append("<input type='hidden' name='type' value='R'>");
		    		  //searchForm.append("<input type='hidden' name='type' value='"+ $(this).val()+"'>");
			    	  }
		    	  sForm.submit();
			});
		   
	});
	
</script>

<style>
[type="button"] {
	all: unset;
}

[type="button"]:hover {
	text-decoration: underline;
	cursor: pointer;
	color: red;
}

/* -----orderList------- */
.list tr#search td {
	font-family: 'RIDIBatang';
	font-size: 14px;
	border: solid 1px white;
}
</style>

</head>

<body>
	<%@ include file="../../include/adminheader.jsp"%>

	<div id="table" align="center">
		<form name="frm" method="get">
			<input type='hidden' name='pageNum' value='${pageMaker.cri2.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri2.amount}'>
			<input type='hidden' name='keyword' value='${pageMaker.cri2.keyword}'>
			<input type='hidden' name='type' value='${pageMaker.cri2.type}'>

			<table class="list">
				<tr>
					<td colspan="10" style="border: gray; text-align: right">
						<h2 style="text-align: center; margin-bottom:25px">주문리스트</h2>
					</td>
				</tr>
				<tr>
					<th id="orderCheck"><input type="button" value="주문번호(처리여부)"></th>
					<th>주문자</th>
					<th>상품명</th>
					<th>수량</th>
					<th>가격</th>
					<th>우편번호</th>
					<th>배송지</th>
					<th>전화</th>
					<th>주문일</th>
					<th><input type="button" value="주문처리(입금확인)" onClick="go_order_save()"> <input
						style="boder: none; vertical-align: middle; margin-left: 5px;"
						id="allCheck" type="checkbox" onclick="allChk(this);" /></th>
				</tr>

				<c:forEach var="orderList" items="${orderList}">
					<tr class="record">
						<td><c:choose>
								<c:when test='${orderList.result=="1"}'>
									<span style="font-weight: bold; color: red"><c:out
											value="${orderList.detailno}" /></span>
									(미처리)
								</c:when>
								<c:otherwise>
									<span style="font-weight: bold; color: blue"><c:out
											value="${orderList.detailno}" /></span>
									(처리완료)
								</c:otherwise>
							</c:choose></td>
						<td><c:out value="${orderList.name}" /></td>
						<td><c:out value="${orderList.name_kr}" /></td>
						<td><c:out value="${orderList.num}" /></td>
						<td><fmt:formatNumber type="number" maxFractionDigits="3"
								value="${orderList.price * orderList.num + 2500}" />원</td>
						<td><c:out value="${orderList.zipNum}" /></td>
						<td><c:out value="${orderList.addr1}" /> <c:out
								value="${orderList.addr2}" /></td>
						<td><fmt:formatNumber var="licsNo" value="${orderList.phone}"
								pattern="000,0000,0000" /> <c:out
								value="${fn:replace(licsNo, ',', '-')}" /></td>
						<td><fmt:formatDate value="${orderList.indate}" /></td>
						<td><c:choose>
								<c:when test='${orderList.result=="1"}'>
									<input type="checkbox" name="RowCheck"
										value='<c:out value="${orderList.detailno}"/>'>
								</c:when>
								<c:otherwise>
									<input type="checkbox" checked="checked" disabled="disabled">
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</table>
		</form>

		<form id='actionForm' action="/admin/order/orderList" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri2.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri2.amount}'>
			<input type='hidden' name='keyword' value='${pageMaker.cri2.keyword}'>
			<input type='hidden' name='type' value='${pageMaker.cri2.type}'>
		</form>

		<div id="main_footer">
			<div id="main_footer_box">
				<div id="btn_pge" style="margin-top:20px;">
					<c:if test="${pageMaker.prev}">
						<a href="${pageMaker.startPage -1}"><button
								style="padding: 0 6px;">&lt;</button></a>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<a href="${num}"><span
							class="${pageMaker.cri2.pageNum == num? 'bold':''}">
								${num}&nbsp;</span></a>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<a href="${pageMaker.endPage +1}"><button
								style="padding: 0 6px;">&gt;</button></a>
					</c:if>
				</div>
			</div>

			<form id='searchForm' action="/admin/order/orderList" method='get'>
				<div id="input" style="margin-bottom: 100px;">
					<input type='hidden' name='pageNum' value='${pageMaker.cri2.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.cri2.amount}'>

					<select name="type" style="font-size: 15px; font-family:'RidiBatang';">
						<option value="N" <c:out value="${pageMaker.cri2.type eq 'N' ? 'selected':''}"/>>주문자명</option>
						<option value="P" <c:out value="${pageMaker.cri2.type eq 'P' ? 'selected':''}"/>>상품명</option>
						<option value="R" <c:out value="${pageMaker.cri2.type eq 'R' ? 'selected':''}"/>>처리여부</option>
						<option value="NP" <c:out value="${pageMaker.cri2.type eq 'NP' ? 'selected':''}"/>>주문자명 or 상품명</option>
						<option value="NR" <c:out value="${pageMaker.cri2.type eq 'NR' ? 'selected':''}"/>>주문자명 or 처리여부</option>
						<option value="NPR" <c:out value="${pageMaker.cri2.type eq 'NPR' ? 'selected':''}"/>>주문자명 or 상품명 or 처리여부</option>
					</select>
					
					<span> 
					 <input type="text" name="keyword" placeholder="검색할 내용을 입력하세요"
						style="width: 300px; font-size: 15px; margin-top: 70px;"
						value='<c:out value="${pageMaker.cri2.keyword}"/>'> 
					</span>
					
					<button class='btn-default'>&nbsp; 검색&nbsp;</button>
				</div>
			</form>
		</div>
	</div>

	<%@ include file="../../include/adminfooter.jsp"%>
</body>

</html>