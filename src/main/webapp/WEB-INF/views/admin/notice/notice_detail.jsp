<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	pageContext.setAttribute("replaceChar", "\n");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SommeAdmin</title>
<link rel="stylesheet" type="text/css" href="/resources/css/banner.css">
<link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">
<link rel="stylesheet" type="text/css" href="/resources/css/admin_reviewDetail.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

</head>
<body>
	<div class="scrollBar">
		<!-- header-->
		<%@ include file="../../include/adminheader.jsp"%>

		<!-- 리뷰상세-->
		<div id="main">
			<div id="title">
				<h2>공지사항</h2>
			</div>
			<form name="frm" action="/admin/notice/noticeDelete">
			<input type='hidden' name='pageNum' value='<c:out value="${param.pageNum}"/>'>
			<input type='hidden' name='amount' value='<c:out value="${param.amount}"/>'>
			<input type='hidden' name='type' value='<c:out value="${param.type}"/>'>
			<input type='hidden' name='keyword' value='<c:out value="${param.keyword}"/>'>
			<input type="hidden" name="noticeno" value="${param.noticeno}">
				<div id="box1">
					<div id="button">
						<input type="button" value="목록" style="padding: 3px 30px">
					</div>
					<table table frame="above">
						<tr>
							<td width="200px" bgcolor="#f4f4f4">제목</td>
							<td width="700px">${noticeVO.subject}</td>
							<td id="dot" width="100px" onclick="showPopup(false)"
								style="cursor: pointer"><span>⋮</span></td>
						</tr>
					</table>
					<div id="popup" class="hide">
						<div class="content">
							<p id="x" onclick="closePopup()" style="cursor: pointer">X</p>
							<br>
							<p class='nBtn' data-oper='update' style="cursor: pointer">수정하기</p>
							<hr>
							<p class='nBtn' data-oper='delete' style="cursor: pointer">삭제하기</p>
						</div>
					</div>
					<table table frame="above">
						<tr>
							<td width="200px" bgcolor="#f4f4f4">작성자</td>
							<td width="200px">${noticeVO.id}</td>
							<td width="200px" bgcolor="#f4f4f4">작성일자</td>
							<td width="200px"><fmt:formatDate value="${noticeVO.indate}"
									pattern="yyyy-MM-dd" type="date" /></td>
							<td width="100px" bgcolor="#f4f4f4">조회수</td>
							<td width="100px">${noticeVO.count}</td>
						</tr>
					</table>
					<div id="box1-1" class="uploadResult">
						<ul>
						</ul>
						<c:if test="${not empty noticeVO.img}">
							<img src="/resources/image/${noticeVO.img}">
						</c:if>
						<div id="box1-1-text" name="content" style="line-height: 120%">${fn:replace(noticeVO.content,replaceChar,"<br/>")}</div>

					</div>

				</div>

			</form>
		</div>

		<!-- 푸터 -->
		<%@ include file="../../include/adminfooter.jsp"%>
	</div>
<script>
	function showPopup() {
		document.getElementById("popup").style.display = "block";
	}
	function closePopup() {
		document.getElementById("popup").style.display = "none";
	}
	$(document).ready(function() {
		var frm = $("form");
		$('.nBtn').on("click", function(e) {
			//버튼 기능 해제(submit)
			e.preventDefault();

			//현재 객체의 내가 정의한 data중에 oper값을 가져와(remove, modify 등...)
			var operation = $(this).data("oper");
			console.log(operation);

			if (operation === 'update') {
				//formObj의 attr속성값을 바꿔줘(action을 remove로)
				frm.attr("action", "/admin/notice/notice_update");
				frm.submit();
			} else {
				if (confirm('삭제하시겠습니까?')) {
					frm.submit();
				} else {
					return false;
				}
			}
		});
		$('input[type="button"]').on("click", function(e) {
			//버튼 기능 해제(submit)
			e.preventDefault();
			frm.attr("action", "/admin/notice/notice").submit();
		});
	});
	
$(document).ready(function(){
	(function(){
		
		var noticeno = '<c:out value="${noticeVO.noticeno}"/>';
		
		$.getJSON("/admin/notice/getAttachList", {noticeno: noticeno}, function(arr){
	        
		       console.log(arr);
		       
		       var str = "";
		       
		       $(arr).each(function(i, attach){
		       
		         //image type
		         if(attach.fileType){
		           var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/"+attach.uuid +"_"+attach.fileName);
		           
		           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
		           str += "<img src='/display?fileName="+fileCallPath+"'>";
		           str += "</div>";
		           str +"</li>";
		         }else{
		             
		           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
		           str += "<span> "+ attach.fileName+"</span><br/>";
		           str += "<img style='width:30px; height:30px' src='/resources/image/file2.png'></a>";
		           str += "</div>";
		           str +"</li>";
		         }
		       });
		       
		       $(".uploadResult ul").html(str);
		});
	})();
	
	$(".uploadResult").on("click","li",function(e){
		var liObj = $(this);
		var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
		if(!liObj.data("type")){
			self.location ="/download?fileName="+path
		}
	});
	
});
</script>
</body>

</html>