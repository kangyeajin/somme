<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Somme</title>
<link rel="stylesheet" href="/resources/css/review_list.css?ver=1">
<link rel="stylesheet" type="text/css" href="/resources/css/sidebar_list.css">
<link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
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
	<div class="scrollBar">
		<!-- header-->
	<%@ include file="../include/header.jsp"%>

		<section id="review_main">
			<aside id="sidebar">
				<div>
					<ul id="sidebar_list">
						<li><a href="/notice/notice">공지사항</a></li>
						<li><a href="/review/review_best">리뷰</a></li>
						<li><a href="/qna/QNA">Q&A</a></li>
					</ul>
				</div>
			</aside>
			<form name="frm">
				<section id="right">
					<div class="review_title">
						<p>베스트 리뷰</p>
					</div>
					<div id="review_list">
					<sec:authorize access="isAuthenticated()">
				<input type="hidden" name='id' value="<sec:authentication property="principal.username" />">
			</sec:authorize>
			<!-- 로그아웃유저 -->
			<sec:authorize access="isAnonymous()">
				<c:if test="${not empty loginUser}">
				<input type="hidden" name='id' value="${loginUser.id}">
				</c:if>
			</sec:authorize>
						<c:forEach var="BestreviewList" items="${BestreviewList}" varStatus="status">
								<%-- <input type="hidden" name="prodno" value="${BestreviewList.prodno}"> --%>
							<div class="review">
							<div data-aos="fade-up" data-aos-duration="500" data-aos-offset="100" data-aos-delay="200">
								<a class="detail" href="${BestreviewList.reviewno}"> 
							<c:url value="/display" var="img">
							<c:param name="fileName" value="${BestreviewList.attachVO.uploadPath}/${BestreviewList.attachVO.uuid}_${BestreviewList.attachVO.fileName}" />
						  </c:url>
							<c:choose>
								<c:when test="${not empty BestreviewList.img}">
									<img src="/resources/image/${BestreviewList.img}">
								</c:when>
								<c:otherwise>
									<img class="pop" src="${img}" onerror="this.src='/resources/image/${BestreviewList.image}'">
								</c:otherwise>
							</c:choose>
									<figcaption><strong>${BestreviewList.name_kr}</strong>
									<p><img style="width:30px; height:30px;" src="/resources/image/lovew.png">
										${BestreviewList.loveCount}
									<img style="width:30px; height:30px;" src="/resources/image/replyw.png">
										${BestreviewList.replyCount}</p>
									</figcaption>
									
								</a>
							</div>
							</div>
						</c:forEach>
						<c:if test="${empty BestreviewList}">
					<p style='color:#898989; margin:180px 0 0 300px;'>아직 베스트 리뷰가 없습니다.</p>
				</c:if>
					</div>
				</section>
			</form>

		</section>
		<!--review_main-->

	<%@ include file="../include/footer.jsp"%>
	</div>
<script>
	AOS.init();
</script>
<script type="text/javascript">
$(document).ready(function(){
	var form = $('form');
	$('.detail').on('click', function(e){
		e.preventDefault();
		form.append("<input type='hidden' name='reviewno' value='"+$(this).attr("href")+"'>");
		form.attr("action","/review/review_best_detail"); //action 수정
		form.submit();
	});
});
</script>
</body>
</html>