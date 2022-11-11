<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
[type="button"],[type="submit"] {
	all: unset;
}

[type="button"]:hover ,[type="submit"]:hover {
	text-decoration: underline;
	cursor:pointer;
	color:red;
}
</style>
</head>

<body>
<%@ include file="../../include/adminheader.jsp"%>

	<div id="table" align="center">
	<form name="frm" action="/admin/notice/event_write">
	<input type='hidden' name='eventno'>
		<table class="list">
			<tr>
				<td colspan="10" style="border: gray; text-align: right">
			<h2 style="text-align: center">이벤트 게시판</h2>
			<button type="submit">이벤트 작성</button>
				</td>
			</tr>

			<tr>
				<th>작성일</th>
				<th>사진</th>
				<th>이름(연결 페이지)</th>
				<th>수정</th>
				<th><input type="button" value="선택삭제" onclick="fn_userDel()">
						<input
						style="vertical-align: middle; margin-left: 5px;"
						id="allCheck" type="checkbox" onclick="allChk(this);" /></th>
				<th>설정</th>
			</tr>

			<c:forEach var="eventList" items="${eventList}" varStatus="status">
						<c:url value="/display" var="url">
							<c:param name="fileName" value="${eventList.attachVO.uploadPath}/${eventList.attachVO.uuid}_${eventList.attachVO.fileName}" />
						</c:url>
				<tr class="record">
					<td><fmt:formatDate value="${eventList.indate}" pattern="yyyy-MM-dd" type="date"/></td>
					<td>
					<c:choose>
					<c:when test="${not empty eventList.img}">
						<img style="vertical-align: middle" width="300px" height="70px" src="/resources/image/${eventList.img}">
					</c:when>
					<c:otherwise>
						<img style="vertical-align: middle" width="300px" height="70px" src="${url}">
					</c:otherwise>
					</c:choose>
					</td>
					<td><a href='${eventList.url}'>${eventList.subject}</a></td>
                    <td><a class="update" href="${eventList.eventno}">수정하기</a></td>
                    <td><input name="RowCheck" type="checkbox"
							value="${eventList.eventno}" /></td>
					<c:choose>
						<c:when test="${eventList.upload eq 1}">
							<td class='set'><a style="cursor: pointer">배너 올리기</a></td>
						</c:when>
						<c:otherwise>
							<td class='set'><a style="color:rgb(232, 0, 0); cursor: pointer">배너 내리기</a></td>
						</c:otherwise>
					</c:choose>
					<td style="display:none">${eventList.eventno}</td>
				</tr>
			</c:forEach>
		</table>
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
					frm.action = "/admin/notice/eventMultiDelete";
					frm.submit();
				}
			}
		}
	</script>
	<script>
$(document).ready(function(){
		   
	var formObj = $("form");

	$(".set").on("click", function(e){   
		e.preventDefault();
		var str = ""        
		var tdArr = new Array();    // 배열 선언                    
		// 현재 클릭된 Row(<tr>)        
		var td = $(this);    
		var eno = td.next().text();  
		var set = td.eq(0).text();   

		console.log(set);
		console.log(eno);
		if(set == "배너 올리기"){
			formObj.append("<input type='hidden' name='upload' value='2'>");
			formObj.find("input[name='eventno']").val(eno);
		}else{
			formObj.append("<input type='hidden' name='upload' value='1'>");
			formObj.find("input[name='eventno']").val(eno);
		}
			formObj.attr("action","/admin/notice/eventUpload");
			formObj.submit();
	});
	$('.update').on("click", function(e){
		e.preventDefault();
		formObj.find("input[name='eventno']").val($(this).attr("href"));
		formObj.attr("action","/admin/notice/event_update").submit();
	});
		   
});
</script>
</body>

</html>