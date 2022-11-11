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
<script src="/resources/js/notice.js" type="text/javascript"></script>
<style>
[type="button"] {
	all: unset;
}

[type="button"]:hover {
	text-decoration: underline;
	cursor:pointer;
	color:red;
}
.text_chk:hover{
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
		<form id="noticeform" name="frm" action="/admin/notice/notice_write">
		<input type='hidden' name='pageNum' value='${pageMaker.cri2.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri2.amount}'>
		<input type='hidden' name='keyword' value='${pageMaker.cri2.keyword}'>
		<input type='hidden' name='type' value='${pageMaker.cri2.type}'>
		<input type='hidden' name='noticeno'>
			<table class="list">
				<tr>
					<td colspan="10" style="border: gray; text-align: right">
						<h2 style="text-align: center">공지사항 게시판</h2> 
						<span class="text_chk">공지글 작성</span>
					</td>
				</tr>

				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>수정</th>
					<th><input type="button" value="선택삭제" onclick="fn_userDel()">
						<input
						style="vertical-align: middle; margin-left: 5px;"
						id="allCheck" type="checkbox" onclick="allChk(this);" /></th>
				</tr>

				<c:forEach var="noticeList" items="${noticeList}">
					<tr class="record">
						<td>${noticeList.noticeno}</td>
						<td><a class="move" href="${noticeList.noticeno}">${noticeList.subject}</a></td>
						<td><fmt:formatDate value="${noticeList.indate}" pattern="yyyy-MM-dd" type="date"/></td>
						<td><a class="nno" href="${noticeList.noticeno}">수정하기</a></td>
						<td><input name="RowCheck" type="checkbox"
							value="${noticeList.noticeno}" /></td>

					</tr>
				</c:forEach>
			</table>
		</form>
				<form id='actionForm' action="/admin/notice/notice" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri2.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri2.amount}'>
				<input type='hidden' name='keyword' value='${pageMaker.cri2.keyword}'>
				<input type='hidden' name='type' value='${pageMaker.cri2.type}'>
			</form>
			<div id="main_footer">
				<div id="main_footer_box">
					<div id="btn_pge">
					<c:if test="${pageMaker.prev}">
						<a href="${pageMaker.startPage -1}"><button style="padding:0 6px;">&lt;</button></a>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<a href="${num}"><span class="${pageMaker.cri2.pageNum == num ? 'bold':''}"> ${num}&nbsp;</span></a>
					</c:forEach>
						
					<c:if test="${pageMaker.next}">
						<a href="${pageMaker.endPage +1}"><button style="padding:0 6px;">&gt;</button></a>
					</c:if>
					</div>
					<div id="btn_creat">
						<br>
					</div>
				</div>
				<div id="input" style="margin-bottom: 60px;">
				<form id="searchForm" action="/admin/notice/notice">
				<input type='hidden' name='pageNum' value='${pageMaker.cri2.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri2.amount}'>
				<select name="type" style="font-size: 15px;">
					<option value="S"
						<c:out value="${pageMaker.cri2.type eq 'S' ? 'selected':''}"/>>제목</option>
					<option value="C"
						<c:out value="${pageMaker.cri2.type eq 'C' ? 'selected':''}"/>>내용</option>
					<option value="SC"
						<c:out value="${pageMaker.cri2.type eq 'SC' ? 'selected':''}"/>>제목+내용</option>
				</select>
					 <span> <input type="text"
						name="keyword" placeholder="검색할 내용을 입력하세요" 
						style="width: 300px; font-size: 15px;"></span>
					<button>&nbsp; 검색&nbsp;</button>
				</form>
				</div>
			</div>
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
					frm.action = "/admin/notice/noticeMultiDelete";
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
		 	var f = $('#noticeform');
			$('.text_chk').on("click", function(e){
				/* if(${!empty subject} || ${!empty content} ){
					var agree = confirm("이어서 작성 하시겠습니까?");
					if (agree){
						f.attr("action","/notice/notice_write"); 
					}
				} */
				f.submit();
			});
			$('.nno').on("click", function(e){
				e.preventDefault();
				f.find("input[name='noticeno']").val($(this).attr("href"));
				f.attr("action","/admin/notice/notice_update").submit();
			});
			
			var actionForm = $('#actionForm');
			$("#btn_pge a").on("click",function(e){
				e.preventDefault();
				console.log('click');
				//pageNum의 value를 href에 붙여줘(find의 value를 val로 바꿔줘)
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
		    $(".move").on("click", function(e){
		        e.preventDefault();
		        actionForm.append("<input type='hidden' name='noticeno' value='"+ $(this).attr("href")+"'>");
		        actionForm.attr("action","/admin/notice/notice_detail"); //action 수정
		        actionForm.submit();
		      });
		    var searchForm = $('#searchForm');
		    $('#searchForm button').on("click", function(e){
		 		if(!searchForm.find("input[name='keyword']").val()){
		    		alert("검색어를 입력하세요")
		    		return false;
		 		}
		 		
		 		//pageNum의 값을 1로 설정
		 		searchForm.find("input[name='pageNum']").val("1");
		 		e.preventDefault();
		 		
		 		searchForm.submit();
		    });
		})﻿;
	</script>
</body>

</html>