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
<link rel="stylesheet" type="text/css" href="/resources/css/admin_reviewDetail.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>

<body id="body">
	<div class="scrollBar">
		<!-- header-->
<%@ include file="../../include/adminheader.jsp"%>

		<!-- 리뷰상세-->

		<div id="main">
			<div id="title">
				<h2>리뷰</h2>
			</div>
			<form name="frm" action="/admin/notice/reviewDelete">
				<div id="box1">
									<div id="button">
						<input type="button" value="목록" style="padding: 3px 30px">
					</div>
					<input type="hidden" name="reviewno" value="${param.reviewno}">
					<table table frame="above">
						<tr>
							<td width="200px" bgcolor="#f4f4f4">제목</td>
							<td colspan="3" width="700px">${reviewVO.subject}</td>
							<td id="dot" width="100px" onclick="showPopup(false)"
								style="cursor: pointer"><span>⋮</span></td>
						</tr>
					</table>

					<div id="popup" class="hide">
						<div class="content">
							<p id="x" onclick="closePopup()" style="cursor: pointer">X</p>
							<br><p class="rBtn" style="cursor: pointer">삭제하기</p>
						</div>
					</div>

					<table table frame="above">
						<tr>
							<td width="200px" bgcolor="#f4f4f4">작성자</td>
							<td width="200px">${reviewVO.id}</td>
							<td width="200px" bgcolor="#f4f4f4">작성일자</td>
							<td width="200px"><fmt:formatDate value="${reviewVO.indate}" pattern="yyyy-MM-dd" type="date"/></td>
							<td width="100px" bgcolor="#f4f4f4">조회수</td>
							<td width="100px">${reviewVO.count}</td>
						</tr>
					</table>
					<div id="box1-1" class="uploadResult">
						<ul>
						</ul>
						<c:if test="${not empty reviewVO.img}">
							<img src="/resources/image/${reviewVO.img}">
						</c:if>
						<div id="box1-1-text" style="line-height:120%">${fn:replace(reviewVO.content,replaceChar,"<br/>")}</div>
					</div>

				</div>
				<input type='hidden' name='pageNum' value='<c:out value="${param.pageNum}"/>'>
			<input type='hidden' name='amount' value='<c:out value="${param.amount}"/>'>
			<input type='hidden' name='type' value='<c:out value="${param.type}"/>'>
			<input type='hidden' name='keyword' value='<c:out value="${param.keyword}"/>'>
			</form>
			<span class="title">댓글</span>
					<div id="replyDiv">
							<hr>
							<div class="panel-body">
								<!-- 댓글 들어옴 -->
							</div>
							<div class="panel-footer">
								<!-- 댓글 페이지 번호 들어올거임 -->
							</div>
							<div id="textareaDiv">
							<!-- 로그인유저 -->
							<sec:authorize access="isAuthenticated()">
							<span><sec:authentication property="principal.username" /></span>
								<input type="hidden" name='replyer' value="<sec:authentication property="principal.username" />">
								<textarea id="replyContent" name='reply' placeholder="댓글을 입력해 주세요"></textarea>
							</sec:authorize>
							<!-- 로그아웃유저 -->
							<sec:authorize access="isAnonymous()">
								<span>아이디</span>
								<textarea id="replyContent" name="replyContent" placeholder="댓글을 작성하려면 로그인 해주세요" readonly></textarea>
							</sec:authorize>
							<button id='modalRegisterBtn'>등록</button>
							</div>
					</div>
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
			function go_list() {
				var frm = document.frm;
				frm.action = "/admin/notice/review";
				frm.submit();
			}
			
			$(document).ready(function() {
				var frm = $("form");
				$('.rBtn').on("click", function(e) {
						if (confirm('삭제하시겠습니까?')) {
							frm.submit();
						} else {
							return false;
						}
				});
				$('input[type="button"]').on("click", function(e) {
					//버튼 기능 해제(submit)
					e.preventDefault();
					frm.attr("action", "/admin/notice/review").submit();
				});
			});
		</script>
		<script>
$(document).ready(function(){
	(function(){
		var reviewno = '<c:out value="${reviewVO.reviewno}"/>';
		
		$.getJSON("/review/getAttachList", {reviewno: reviewno}, function(arr){
	        
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