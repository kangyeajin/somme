<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
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
<script src="/resources/js/qna.js" type="text/javascript"></script>
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

body {
	onload: "hidefield()";
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
			<form name="frm" id="detailForm" action="/qna/QNA_detail">
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			<input type='hidden' name='type' value='${pageMaker.cri.type}'>
			<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
				<div id="sidebar">
					<div>
						<ul id="sidebar_list" list-style="none">
							<li><a href="/notice/notice">공지사항</a></li>
							<li><a href="/review/review_best">리뷰</a></li>
							<li><a href="/qna/QNA">Q&A</a></li>
						</ul>
					</div>
				</div>

				<div id="main_box">
					<div id="title_box">
						<h1>Q&A</h1>
					</div>
					<div id="table_box">
						<table table frame="above" cellspacing="0">
							<tr style="background-color: #f4f4f4;">
								<th width="100px">답변상태</th>
								<th width="505px">제목</th>
								<th width="90px">작성자</th>
								<th width="85px">작성일</th>
								<th width="70px">조회수</th>
							</tr>
							<c:forEach var="qnaList" items="${qnaList}" varStatus="status">
								<tr>
									<c:choose>
										<c:when test="${qnaList.re eq 2}">
											<td style="color: #cd2233;">답변완료</td>
										</c:when>
										<c:otherwise>
											<td>답변대기</td>
										</c:otherwise>
									</c:choose>
									<td style="text-align:left; padding-left:30px"><a class="move" 
										href="${qnaList.qnano}">${qnaList.subject}
											<c:if test="${not empty qnaList.img}">
												<img width="15px" height="15px" src="/resources/image/file.png">
											</c:if>
									</a></td>
									<td>${qnaList.id}</td>
									<td><fmt:formatDate value="${qnaList.indate}" pattern="yyyy-MM-dd" type="date"/></td>
									<td>${qnaList.count}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</form>
			<form id='actionForm' action="/qna/QNA" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type' value='${pageMaker.cri.type}'>
				<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
			</form>
			<form name="frm" id="writeForm" action="/qna/QNA_write_form">
				<div id="main_footer">
					<div id="main_footer_box">
						
						<div id="btn_pge">
						<c:if test="${pageMaker.prev}">
							<a href="${pageMaker.startPage -1}"><button style="padding:0 6px;">&lt;</button></a>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<a href="${num}"><span class="${pageMaker.cri.pageNum == num? 'bold':''}"> ${num}&nbsp;</span></a>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<a href="${pageMaker.endPage +1}"><button style="padding:0 6px;"> &gt; </button></a>
						</c:if>
						</div>
						<div id="btn_creat">
							<button>글작성</button>
						</div>
					</div>
				</div>
			</form>
					<div id="input" style="margin-bottom: 100px;">
					<form id="qSearchForm" action="/qna/QNA">
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
						<select name="type" style="font-size: 15px;">
							<option value="S" <c:out value="${pageMaker.cri.type eq 'S' ? 'selected':''}"/>>제목</option>
							<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected':''}"/>>내용</option>
							<option value="SC" <c:out value="${pageMaker.cri.type eq 'SC' ? 'selected':''}"/>>제목+내용</option>
							<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected':''}"/>>작성자</option>
						</select> 
						<span> <input type="text" name="keyword"
							placeholder="검색할 내용을 입력하세요"
							style="width: 300px; font-size: 15px; margin-top: 70px;"></span>
						<button>&nbsp; 검색&nbsp;</button>
					</form>
					</div>
				</div>
			</div>

		<!-- 푸터 -->
	<%@ include file="../include/footer.jsp"%>
	<script>

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
	var aForm = $('#actionForm');
	$("#btn_pge a").on("click",function(e){
		e.preventDefault();
		aForm.find("input[name='pageNum']").val($(this).attr("href"));
		aForm.submit();
	});
	var sForm = $('#qSearchForm');
	$('#qSearchForm button').on("click", function(e){
		if(!sForm.find("input[name='keyword']").val()){
			alert("검색어를 입력하세요");
			return false;
		}
		sForm.find("input[name='pageNum']").val("1");
		sForm.submit();
	});
	var dForm = $('#detailForm');
	$('.move').on("click", function(e){
		e.preventDefault();
		dForm.append("<input type='hidden' name='qnano' value='"+$(this).attr("href")+"'>");
		dForm.submit();
	});
	var wForm = $('#writeForm');
	$('#btn_creat').on("click", function(e){
		e.preventDefault();
		var id;
		if(${not empty loginUser}){
			id = "${loginUser.id}";
		}else{
		<sec:authorize access="isAuthenticated()">
			id = "<sec:authentication property='principal.username' />";
		</sec:authorize>
		}
		if (id) {
			wForm.attr("action","/qna/QNA_write"); //action 수정
		}else {
			alert("로그인이 필요한 항목입니다.");
			wForm.attr("action","/member/loginForm"); //action 수정
		}
			wForm.submit();
	});
	
})
</script>
	</div>
</body>
</html>