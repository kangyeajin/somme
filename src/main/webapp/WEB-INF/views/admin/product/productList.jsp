<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../../include/adminheader.jsp"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SommeAdmin</title>

<link href="<c:url value="/resources/css/productlist.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/scrollbar.css"/>" rel='stylesheet' />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


</head>

<style>
[type="button"] {
   all: unset;
}

[type="button"]:hover {
   text-decoration: underline;
   cursor:pointer;
   color:red;
}
.bold{ font-weight: bold;}
</style>

<body>

  	<script>
function allChk(obj){
    var chkObj = document.getElementsByName("RowCheck");
    var rowCnt = chkObj.length - 1;
    var check = obj.checked;
    if (check) {﻿
        for (var i=0; i<=rowCnt; i++){
         if(chkObj[i].type == "checkbox")
             chkObj[i].checked = true;
        }
    } else {
        for (var i=0; i<=rowCnt; i++) {
         if(chkObj[i].type == "checkbox"){
             chkObj[i].checked = false;
         }
        }
    }
} 

function fn_userDel() {
    var userid = "";
    var memberChk = document.getElementsByName("RowCheck");
    var chked = false;
    var indexid = false;
    for (i = 0; i < memberChk.length; i++) {
        if (memberChk[i].checked) {
            if (indexid) {
                userid = userid + '-';
            }
            userid = userid + memberChk[i].value;
            indexid = true;
        }
    }
    if (!indexid) {
        alert("삭제할 상품을 선택해주세요");
        return;
    }else{
	    var agree = confirm("삭제 하시겠습니까?");
	    if (agree) {
	    	frm.action = "/admin/product/multiDelete";
			frm.submit();
	    }
    }

}

$(document).ready(function(){
	var aForm = $("#actionForm");
	
	$("#btn_pge a").on("click",function(e){
		e.preventDefault();
		console.log('click');
		aForm.find("input[name='pageNum']").val($(this).attr("href"));
		aForm.submit();
	});
	
    //조회페이지 이동 시 페이지 값을 같이 넘김
    $(".move").on("click", function(e){
        e.preventDefault();
        //클릭된 href값(bno)를 input에 담아 갖고감 - 페이지 값들은 form안에 이미 있음
        aForm.append("<input type='hidden' name='prodno' value='"+ $(this).attr("href")+"'>");
        aForm.attr("action","/admin/product/productUpdate"); //action 수정
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
	
});﻿
</script>

	<div id="table" align="center">
	    <form name="frm" method="post">
	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	    <input type='hidden' name='pageNum' value='${pageMaker.cri2.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri2.amount}'>
		<table class="list">
			<tr>
				<td colspan="10" style="border: gray; text-align: right">
				<h2 style="text-align: center">상품리스트</h2>
				<a href="/admin/product/productWrite">상품 등록</a></td>
			</tr>
			
			<tr>
		         <th>상품번호</th>
		         <th>상품명</th>
		         <th>영문명</th>
		         <th>국가</th>
		         <th>종류</th>
		         <th>가격</th>
		         <th>베스트와인</th>
		         <th>수정</th>
		         <th><input type="button" value="선택삭제" onclick="fn_userDel()">
					<input style="boder: none; vertical-align: middle; margin-left: 5px;"
					id="allCheck" type="checkbox" onclick="allChk(this);" /></th>
			</tr>
			
			<c:forEach var="product" items="${productList}">
				<tr class="record">
					<td>${product.prodno}</td>
					<td>${product.name_kr}</td>
					<td>${product.name_en}</td>
					<td>${product.kind_con}</td>
					<td>${product.kind}</td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.price}"/> 원</td>
					<td>${product.mainprod}</td>
					<td>
					  <a class='move' href='<c:out value="${product.prodno}"/>'>상품 수정</a>
					</td>
					<td><input type="checkbox" name="RowCheck" value="${product.prodno}"/></td>
				</tr>
			</c:forEach>
		</table>
		</form>

		<form id='actionForm' action="/admin/product/productList" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri2.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri2.amount}'>
			<input type='hidden' name='keyword' value='${pageMaker.cri2.keyword}'>
			<input type='hidden' name='type' value='${pageMaker.cri2.type}'>
			
		</form>

		<div id="main_footer">
			<div id="main_footer_box">
				<div id="btn_pge">
					<c:if test="${pageMaker.prev}">
						<a href="${pageMaker.startPage -1}">
						<button style="padding: 0 6px;">&lt;</button></a>
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
		</div>
		
		<form id='searchForm' action="/admin/product/productList" method='get'>
		<div id="input" style="margin-bottom: 100px;">
		<select name="type" style="font-size: 15px;">
			<option
				<c:out value='${(pageMaker.cri2.type == "N")? "selected" : ""}'/>
					value="N">상품명</option>
			<option
				<c:out value='${(pageMaker.cri2.type == "NE")? "selected" : ""}'/>
					value="NE">상품명+영문명</option>
			<option
				<c:out value='${(pageMaker.cri2.type == "K")? "selected" : ""}'/>
					value="K">종류</option>
			<option
				<c:out value='${(pageMaker.cri2.type == "C")? "selected" : ""}'/>
					value="C">국가
				</option>
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
	
<%@ include file="../../include/adminfooter.jsp"%> 
	
</body>
</html>