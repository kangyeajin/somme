<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Somme</title>
<link rel="stylesheet" type="text/css" href="css/banner.css">
<link rel="stylesheet" type="text/css" href="/resources/css/notice_detail.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<style>
	@font-face {
      font-family: 'Molle';
      src: url('/resources/fonts/Molle-Italic.ttf') format('truetype');
    }
    @font-face {
    font-family: 'RIDIBatang';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
	}
</style>

</head>
<body>
	<!-- header-->
	<%@ include file="../include/header.jsp"%>

	<!-- 리뷰상세-->
	<div id="main">
		<div id="title">
			<h2>공지사항</h2>
		</div>
		<form name="frm" id="listForm" action="/notice/notice" >
			<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
			<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
			<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
			<div id="box1">
				<table table frame="above">
					<tr>
						<td width="200px" bgcolor="#f4f4f4">제목</td>
						<td width="800px">${noticeVO.subject}</td>
					</tr>
				</table>
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

				<div id="button">
					<input type="submit" value="목록" style="padding: 3px 30px">
				</div>
			</div>
			<div id="box2">
				<table table frame="above">
					<tr>
						<td class="td1">다음글</td>
						<td class="td2">
							<c:choose>
								<c:when test="${not empty next.subject}">
									<a href="/notice/notice_detail?noticeno=${next.noticeno}">${next.subject}</a>
								</c:when>
								<c:otherwise>
									<span style="color: #868686;">다음글이 없습니다.</span>
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
									<a href="/notice/notice_detail?noticeno=${prev.noticeno}">${prev.subject}</a>
								</c:when>
								<c:otherwise>
									<span style="color: #868686;">이전글이 없습니다.</span>
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
		console.log("view image");
		var liObj = $(this);
		
		if(liObj.data("type")){
			var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
		}else{
			self.loaction ="/download?fileName="+path
		}
	});
	
});
</script>
</body>

</html>