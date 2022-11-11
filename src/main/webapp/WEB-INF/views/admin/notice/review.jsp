<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SommeAdmin</title>
<link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">
<link rel="stylesheet" type="text/css" href="/resources/css/productlist.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
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
</head>

<body>
<%@ include file="../../include/adminheader.jsp"%>

	<div id="table" align="center">
	<form id="reviewform" name="frm">
		<table class="list">
			<tr>
				<td colspan="10" style="border: gray; text-align: right">
			<h2 style="text-align: center">리뷰 게시판</h2><br>
				</td>
			</tr>

			<tr>
				<th>글번호</th>
				<th>제품</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th id="bestReviewList"><input type="button" value="베스트 리뷰"></th>
				<th><input type="button" value="선택삭제" onclick="fn_userDel()">
						<input
						style="vertical-align: middle; margin-left: 5px;"
						id="allCheck" type="checkbox" onclick="allChk(this);" /></th>
			</tr>

			<c:forEach var="reviewList" items="${reviewList}">
				<tr class="record">
					<td id="rno">${reviewList.reviewno}</td>
					<td>${reviewList.name_kr}</td>
					<td><a class="move" href="${reviewList.reviewno}">${reviewList.subject}
						<c:if test="${not empty reviewList.img}">
							<img width="15px" height="15px" src="/resources/image/file.png">
						</c:if>
						</a></td>
					<td>${reviewList.id}</td>
					<td><fmt:formatDate value="${reviewList.indate}" pattern="yyyy-MM-dd" type="date"/></td>
					<c:choose>
						<c:when test="${reviewList.best eq 1}">
							<td class='set' style="cursor: pointer" data-reviewno='${reviewList.reviewno}'><a>베스트리뷰 적용</a></td>
						</c:when>
						<c:otherwise>
							<td class='set' style="cursor: pointer" data-reviewno='${reviewList.reviewno}'><a style="color:rgb(232, 0, 0);">베스트리뷰 해제</a></td>
						</c:otherwise>
					</c:choose>
					<td><input name="RowCheck" type="checkbox"
							value="${reviewList.reviewno}"/></td>
				</tr>
			</c:forEach>
		</table>
		<input type='hidden' name='pageNum' value='${pageMaker.cri2.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri2.amount}'>
		<input type='hidden' name='keyword' value='${pageMaker.cri2.keyword}'>
		<input type='hidden' name='type' value='${pageMaker.cri2.type}'>
		</form>
					<form id='actionForm' action="/admin/notice/review" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri2.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri2.amount}'>
				<input type='hidden' name='type' value='${pageMaker.cri2.type}'>
				<input type='hidden' name='keyword' value='${pageMaker.cri2.keyword}'>
			</form>
				<div id="btn2" style="margin-top:40px;">
				<c:if test="${pageMaker.prev}">
					<a href="${pageMaker.startPage-1}"><button style="padding:0 6px;"> &lt; </button></a>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<a href="${num}"><span class="${pageMaker.cri2.pageNum == num ? 'bold':''}"> ${num} &nbsp;</span></a>
				</c:forEach>
				<c:if test="${pageMaker.next}">	
					<a href="${pageMaker.endPage +1}"><button style="padding:0 6px;"> &gt; </button></a>
				</c:if>
				</div>
				<div id="btn3">
				<form id="searchForm" action="/admin/notice/review">
					<input type='hidden' name='pageNum' value='${pageMaker.cri2.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.cri2.amount}'>
					<select name="type" style="font-size: 15px;">
						<option value="S" <c:out value="${pageMaker.cri2.type eq 'S' ? 'selected':''}"/>>제목</option>
						<option value="C" <c:out value="${pageMaker.cri2.type eq 'C' ? 'selected':''}"/>>내용</option>
						<option value="SC" <c:out value="${pageMaker.cri2.type eq 'SC' ? 'selected':''}"/>>제목+내용</option>
						<option value="W" <c:out value="${pageMaker.cri2.type eq 'W' ? 'selected':''}"/>>작성자</option>
						<option value="N" <c:out value="${pageMaker.cri2.type eq 'N' ? 'selected':''}"/>>상품명</option>
					</select> <span> <input type="text" name="keyword"
						placeholder="검색할 내용을 입력하세요"
						style="width: 300px; font-size: 15px; margin-top: 70px;"></span>
					<button>&nbsp; 검색&nbsp;</button>
				</form>
	</div>

<%@ include file="../../include/adminfooter.jsp"%> 
	<script>
		function allChk(obj) {
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
				alert("삭제할 게시글을 체크해 주세요");
				return;
			} else {
				var agree = confirm("삭제 하시겠습니까?");
				if (agree) {
					frm.action = "/admin/notice/reviewMultiDelete";
					frm.submit();
				}
			}

		}
		
		$(document).ready(function(){
			var resultNo = '<c:out value="${resultNo}"/>';
			check(resultNo);
			history.replaceState({},null,null);
			function check(resultNo){
				if(resultNo === '' || history.state){
					return;
				}
				if(parseInt(resultNo)>0){
					alert("완료되었습니다.");
				}
			}
			
			var formObj = $("#reviewform");

			$(".set").on("click", function(e){  
				var rno = $(this).data("reviewno"); 
				var set = $(this).eq(0).text();
				console.log(rno+", "+set);
				if(set == "베스트리뷰 적용"){
					formObj.append("<input type='hidden' name='best' value='2'>");
					formObj.append("<input type='hidden' name='reviewno' value='"+rno+"'>");
					formObj.attr("action","/admin/notice/bestSelect");
				}else{
					formObj.append("<input type='hidden' name='best' value='1'>");
					formObj.append("<input type='hidden' name='reviewno' value='"+rno+"'>");
					formObj.attr("action","/admin/notice/bestSelect");
				}
			formObj.submit();
			});
			var aForm = $("#actionForm");
			$("#btn2 a").on("click",function(e){
				e.preventDefault();
				aForm.find("input[name='pageNum']").val($(this).attr("href"));
				aForm.submit();
			});
			$(".move").on("click", function(e){
		        e.preventDefault();
		        aForm.append("<input type='hidden' name='reviewno' value='"+ $(this).attr("href")+"'>");
		        aForm.attr("action","/admin/notice/review_detail"); //action 수정
		        aForm.submit();
		      });
			var sForm = $('#searchForm');
			$('#searchForm button').on("click", function(e) {
				e.preventDefault();
			    if (!sForm.find("input[name='keyword']").val()) {
			        alert("검색어를 입력하세요");
			        return false;
			    }
			    sForm.find("input[name='pageNum']").val("1");
			    sForm.submit();
			});
			$("input[type='checkbox']input[name='type']").on('click', function() {
					  sForm.find("input[name='keyword']").val('2');
			    	  sForm.append("<input type='hidden' name='type' value='"+ $(this).val()+"'>");
			    	  sForm.submit();
			      
			    });
				var kw = $("input[name='keyword']").val();
			$('#bestReviewList').on("click", function(e) {
				 if(kw==2){
		    		  sForm.find("input[name='keyword']").val('');
		    		  sForm.find("input[name='pageNum']").val("1");
			    	  sForm.append("<input type='hidden' name='type' value=''>");
		    	  }else{
		    		  sForm.find("input[name='type']").val('');
					  sForm.find("input[name='keyword']").val('2');
					  sForm.find("input[name='pageNum']").val("1");
			    	  sForm.append("<input type='hidden' name='type' value='B'>");
			    	  }
		    	  sForm.submit();
			});

		});﻿
	</script>
</body>

</html>