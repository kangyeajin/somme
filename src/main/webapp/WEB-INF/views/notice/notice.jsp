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
<link rel="stylesheet" type="text/css" href="/resources/css/sidebar_list.css">
<link rel="stylesheet" type="text/css" href="/resources/css/notice.css">
<link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">
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

.bold{ font-weight: bold;}
</style>

</head>
<body>
<div class="scrollBar">
	<!-- header-->
	<%@ include file="../include/header.jsp"%>

	<!-- 공지-->
	<div id="main">

		<div id="sidebar">
			<div>
				<ul id="sidebar_list" list-style="none">
	                <li><a href="/notice/notice">공지사항</a></li>
					<li><a href="/review/review_best">리뷰</a></li>
					<li><a href="/qna/QNA">Q&A</a></li>
				</ul>
			</div>
		</div>

		<form name="frm" method="post">
			<div id="main_box">
				<div id="title_box">
					<h1>공지사항</h1>
				</div>
				<div id="table_box">
					<table table frame="above" cellspacing="0">
						<tr style="background-color: #f4f4f4;">
							<th width="100px">번호</th>
							<th width="500px">제목</th>
							<th width="80px">작성자</th>
							<th width="100px">작성일</th>
							<th width="70px">조회수</th>
						</tr>
						<c:forEach var="noticeList" items="${noticeList}"
							varStatus="status">
							<tr>
								<td>${noticeList.noticeno}</td>
								<td style="text-align:left; padding-left:30px"><a class="move" href="${noticeList.noticeno}">${noticeList.subject}</a></td>
								<td>${noticeList.id}</td>
								<td><fmt:formatDate value="${noticeList.indate}" pattern="yyyy-MM-dd" type="date"/></td>
								<td>${noticeList.count}</td>
							</tr>
						</c:forEach>
					</table>
					<c:if test="${empty noticeList}">
					<p style='color:#898989; margin:70px 90px 0 0;'> 게시글이 없습니다.</p>
				</c:if>
				</div>
			</div>
		</form>
			<form id='actionForm' action="/notice/notice" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
				<input type='hidden' name='type' value='${pageMaker.cri.type}'>
			</form>
			<div id="main_footer">
				<div id="main_footer_box">
					<div id="btn_pge">
					<c:if test="${pageMaker.prev}">
						<a href="${pageMaker.startPage -1}"><button style="padding:0 6px;">&lt;</button></a>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<a href="${num}"><span class="${pageMaker.cri.pageNum == num ? 'bold':''}"> ${num}&nbsp;</span></a>
					</c:forEach>
						
					<c:if test="${pageMaker.next}">
						<a href="${pageMaker.endPage +1}"><button style="padding:0 6px;">&gt;</button></a>
					</c:if>
					</div>
					<div id="btn_creat">
						<br>
					</div>
				</div>
				<div id="input">
				<form id="searchForm" action="/notice/notice">
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<select name="type" style="font-size: 15px;">
					<option value="S"
						<c:out value="${pageMaker.cri.type eq 'S' ? 'selected':''}"/>>제목</option>
					<option value="C"
						<c:out value="${pageMaker.cri.type eq 'C' ? 'selected':''}"/>>내용</option>
					<option value="SC"
						<c:out value="${pageMaker.cri.type eq 'SC' ? 'selected':''}"/>>제목+내용</option>
				</select>
					 <span> <input type="text"
						name="keyword" placeholder="검색할 내용을 입력하세요" 
						style="width: 300px; font-size: 15px; margin-top: 70px;"></span>
					<button>&nbsp; 검색&nbsp;</button>
				</form>
				</div>
			</div>


	</div>

	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp"%>
	</div>
<script>

$(document).ready(function(){
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
        actionForm.attr("action","/notice/notice_detail"); //action 수정
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
});
</script>
</body>
</html>