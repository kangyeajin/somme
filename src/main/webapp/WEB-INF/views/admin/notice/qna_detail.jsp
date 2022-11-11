<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SommeAdmin</title>
<link rel="stylesheet" type="text/css" href="/resources/css/banner.css">
<link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">
<link rel="stylesheet" type="text/css" href="/resources/css/admin_qnaDetail.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/resources/js/qna_detail.js" type="text/javascript"></script>
</head>

<body>
	<div class="scrollBar">
		<!-- header-->
<%@ include file="../../include/adminheader.jsp"%>

		<!-- 리뷰상세-->

		<div id="main">
			<div id="title">
				<h2>Q&A</h2>
			</div>
			<form name="frm" action="/admin/notice/qnaDelete">
				<div id="box1">
					<div id="button">
						<input id="list" type="button" value="목록" style="padding: 3px 30px">
					</div>
					<table table frame="above">
						<tr>
							<td width="200px" bgcolor="#f4f4f4">제목</td>
							<td colspan="4" width="700px">${qnavo.subject}</td>
							<td id="dot" width="100px" onclick="showPopup(false)"
								style="cursor: pointer"><span>⋮</span></td>
						</tr>
					</table>
					<div id="popup" class="hide">
						<div class="content">
							<p id="x" onclick="closePopup()" style="cursor: pointer">X</p>
							<br>
							<p class='qBtn' data-oper='delete' style="cursor: pointer">삭제하기</p>
						</div>
					</div>
					<table table frame="above">
						<tr>
							<td width="200px" bgcolor="#f4f4f4">작성자</td>
							<td width="200px">${qnavo.id}</td>
							<td width="200px" bgcolor="#f4f4f4">작성일자</td>
							<td width="200px"><fmt:formatDate value="${qnavo.indate}" pattern="yyyy-MM-dd" type="date"/></td>
							<td width="100px" bgcolor="#f4f4f4">조회수</td>
							<td width="100px">${qnavo.count}</td>
						</tr>
					</table>

					<div id="box1-1" class="uploadResult">
						<ul>
						</ul>
						<c:if test="${not empty qnavo.img}">
							<img src="/resources/image/${qnavo.img}">
						</c:if>
						<div id="box1-1-text" style="line-height: 120%">${fn:replace(qnavo.content,replaceChar,"<br/>")}</div>
					</div>
					<c:if test="${not empty qnavo.reply}">
						<input type="button" value="수정하기" style="position: relative; top:340px; left:50px; padding: 3px 30px"
							class='qBtn' data-oper='update'>
					</c:if>
					<div id="admin">
						<hr>
						<span id="adminid">관리자 &nbsp;</span> <span id="admindate"
							name="reindate"><fmt:formatDate value="${qnavo.reindate}" pattern="yyyy-MM-dd" type="date"/></span>
						<c:choose>
							<c:when test="${not empty qnavo.reply}">
								<p style="line-height: 120%">${fn:replace(qnavo.reply,replaceChar,"<br/>")}</p>
							</c:when>
							<c:otherwise>
								<p>
									<tr>
										<td colspan="2" class="col2"><textarea name="reply" id="reply"
												cols="100" rows="10"></textarea></td>
									</tr>
									<input type="submit" class='qBtn' data-oper='answer' value="답변 등록" style="padding: 3px 30px">
								</p>
							</c:otherwise>
						</c:choose>
					</div>



				</div>
			<input type='hidden' name='pageNum' value='<c:out value="${param.pageNum}"/>'>
			<input type='hidden' name='amount' value='<c:out value="${param.amount}"/>'>
			<input type='hidden' name='type' value='<c:out value="${param.type}"/>'>
			<input type='hidden' name='keyword' value='<c:out value="${param.keyword}"/>'>
			<input type="hidden" name="qnano" value='<c:out value="${param.qnano}"/>'>
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
				var frmObj = $("form");
				$('.qBtn').on("click", function(e) {
					//버튼 기능 해제(submit)
					e.preventDefault();

					//현재 객체의 내가 정의한 data중에 oper값을 가져와(remove, modify 등...)
					var operation = $(this).data("oper");
					console.log(operation);

					if (operation === 'update') {
						frmObj.attr("action", "/admin/notice/qnaUpdate");
					}else if (operation === 'answer') {
						if(frm.reply.value == ""){
							alert("내용을 입력해 주세요");
							return false;
						}else
							frmObj.attr("action", "/admin/notice/qnaUpdate");
					}else {
						if (confirm('삭제하시겠습니까?')) {
							frmObj.submit();
						} else {
							return false;
						}
					}
					frmObj.submit();
				});
				$('#list').on("click", function(e) {
					//버튼 기능 해제(submit)
					e.preventDefault();
					frmObj.attr("action", "/admin/notice/qna").submit();
				});
			});
		</script>
				<script>
$(document).ready(function(){
	(function(){
		var qnano = '<c:out value="${qnavo.qnano}"/>';
		
		$.getJSON("/qna/getAttachList", {qnano: qnano}, function(arr){
	        
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
});
</script>
</body>

</html>