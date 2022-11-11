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
<title>Somme</title>
<link rel="stylesheet" type="text/css" href="/resources/css/banner.css">
<link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">
<link rel="stylesheet" type="text/css" href="/resources/css/QNA_detail.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>

@font-face {
	font-family: 'RIDIBatang';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff')
		format('woff');
	font-family: 'Molle';
	src: url('fonts/Molle-Italic.ttf') format('truetype');
}
</style>

</head>

<body>
	<div class="scrollBar">
		<!-- header-->
	<%@ include file="../include/header.jsp"%>

		<!-- 리뷰상세-->


		<div id="main">
			<div id="title">
				<h2>Q&A</h2>
			</div>
			<form name="frm" id="qnaForm" action="/qna/QNA">
			<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  			<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  			<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
  			<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  			<input type='hidden' name='qnano' value='<c:out value="${qnavo.qnano}"/>'>
				<div id="box1">
					<table table frame="above">
						<tr>
							<td width="200px" bgcolor="#f4f4f4">제목</td>
							<td colspan="4" width="700px">${qnavo.subject}</td>
							<td id="dot" width="100px">
							<sec:authorize access="isAuthenticated()">
								<span style="cursor: pointer" onclick="showPopup(false)">⋮</span>
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
							<c:if test="${not empty loginUser}">
								<span style="cursor: pointer" onclick="showPopup(false)">⋮</span>
							</c:if>
							</sec:authorize>
						</tr>
					</table>
					<div id="popup" class="hide">
						<div class="content">
							<p id="x" onclick="closePopup()" style="cursor: pointer">X</p>
							<br>
							<p class="modify" style="cursor: pointer">수정하기</p>
							<hr>
							<p class="modify" style="cursor: pointer">삭제하기</p>
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
						<div id="box1-1-text" style="line-height:120%">${fn:replace(qnavo.content,replaceChar,"<br/>")}</div>
					</div>

					<div id="admin">
						<hr>
						<span id="adminid">관리자 &nbsp;</span> <span id="admindate"><fmt:formatDate value="${qnavo.reindate}" pattern="yyyy-MM-dd" type="date"/></span>
						<c:choose>
							<c:when test="${not empty qnavo.reply}">
								<p style="line-height:120%">${fn:replace(qnavo.reply,replaceChar,"<br/>")}</p>
							</c:when>
							<c:otherwise>
								<p style="color: rgb(141, 141, 141);">(답변 대기중입니다.)</p>
							</c:otherwise>
						</c:choose>
					</div>

				</div>
				<div id="box2">
					<p></p>
					<div id="list">
						<button style="padding: 3px 30px; margin:0 0 50px 50px;">목록</button>
					</div>
					
				<div id="box2">
					<p></p>
					<table table frame="above">
						<tr>
							<td class="td1">다음글</td>
							<td class="td2">
							<c:choose>
								<c:when test="${not empty next.subject}">
									<c:choose>
										<c:when test="${next.re eq 2}">
											<span style="color: #cd2233;">[답변완료]</span>
										</c:when>
										<c:otherwise>
											<span style="color: #868686;">[답변대기]</span>
										</c:otherwise>
									</c:choose><a href="/qna/QNA_detail?qnano=${next.qnano}">${next.subject}</a>
								</c:when>
								<c:otherwise>
									<span style="color: #868686;">다음 글이 없습니다.</span>
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</table>
					<table table frame="above">
						<tr>
							<td class="td1">이전글</td>
							<td class="td2">
							<c:choose>
								<c:when test="${not empty prev.subject}">
									<c:choose>
										<c:when test="${prev.re eq 2}">
											<span style="color: #cd2233;">[답변완료]</span>
										</c:when>
										<c:otherwise>
											<span style="color: #868686;">[답변대기]</span>
										</c:otherwise>
									</c:choose><a href="/qna/QNA_detail?qnano=${prev.qnano}">${prev.subject}</a>
								</c:when>
								<c:otherwise>
									<span style="color: #868686;">이전 글이 없습니다.</span>
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</table>
	
				</div>
			</form>
		</div>

		<!-- 푸터 -->
	<%@ include file="../include/footer.jsp"%>
			<script>
			function showPopup() {
				document.getElementById("popup").style.display = "block";
			}
			function closePopup() {
				document.getElementById("popup").style.display = "none";
			}

			$(document).ready(function(){

				var qForm = $('form');
				$('#list button').on("click", function(e){
					qForm.submit();
				});
				$('.modify').on("click", function(e){
					e.preventDefault();
					var userid;
					var admin;
				    <sec:authorize access="hasRole('ROLE_ADMIN')">
				    	admin="ture";
			    	</sec:authorize>
					<sec:authorize access="isAuthenticated()">
					userid = "<sec:authentication property='principal.username' />";
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
					userid = "${loginUser.id}";
					</sec:authorize>
					var writer = "${qnavo.id}";
					if (((userid==writer) && ${qnavo.re eq 1}) || admin) {
						e.preventDefault();
						qForm.append("<input type='hidden' name='val' value='"+ $(this).text()+"'>");
						qForm.attr("action","/qna/check_pwd");
						qForm.submit();
					}else if(${qnavo.re eq 2}){
						alert("답변이 완료된 게시글 입니다.");
					}else {
						alert("작성자만 변경할 수 있습니다.");
					}
				});
			})
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
	</div>
</body>

</html>