<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
										
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Somme</title>
<link rel="stylesheet" type="text/css" href="/resources/css/banner.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/scrollbar.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/review_detail.css">
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

<body id="body">
	<div class="scrollBar">
		<!-- header-->
		<%@ include file="../include/header.jsp"%>

		<!-- 리뷰상세-->

		<div id="main">
			<div id="title">
				<h2>리뷰</h2>
			</div>
			
				<div id="box1">
					
					<table table frame="above">
						<tr>
							<td width="200px" bgcolor="#f4f4f4">제목</td>
							<td colspan="3" width="700px">${reviewVO.subject}</td>
							<td id="dot" width="100px">
							<sec:authorize access="isAuthenticated()">
								<span style="cursor: pointer" onclick="showPopup(false)">⋮</span>
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
							<c:if test="${not empty loginUser}">
								<span style="cursor: pointer" onclick="showPopup(false)">⋮</span>
							</c:if>
							</sec:authorize>
								</td>
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
							<td width="200px">${reviewVO.id}</td>
							<td width="200px" bgcolor="#f4f4f4">작성일자</td>
							<td width="200px"><fmt:formatDate value="${reviewVO.indate}"
									pattern="yyyy-MM-dd" type="date" /></td>
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
						<div id="box1-1-text" style="line-height: 120%">${fn:replace(reviewVO.content,replaceChar,"<br/>")}</div>
					</div>
					<form id="loveForm">
			<sec:authorize access="isAuthenticated()">
				<input type="hidden" name='id' value="<sec:authentication property="principal.username" />">
			</sec:authorize>
			<!-- 로그아웃유저 -->
			<sec:authorize access="isAnonymous()">
				<c:if test="${not empty loginUser}">
				<input type="hidden" name='id' value="${loginUser.id}">
				</c:if>
			</sec:authorize>
			<div id="love">
					<div class="loveCount">
						<!-- 총개수 들어옴 -->
					</div>
					<div class="love-body">
						<!-- 하트들어옴 -->
					</div>
			</div>	
				</form>
					<form name="frm" id="reviewForm" action="/product/detail#box2">
					<div id="list">
						<button>목록</button>
					</div>
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
								<input type='hidden' name='reReplynum' value=''>
								<textarea id="replyContent" name='reply' placeholder="댓글을 입력해 주세요"></textarea>
							</sec:authorize>
							<!-- 로그아웃유저 -->
							<sec:authorize access="isAnonymous()">
							<c:choose>
								<c:when test="${not empty loginUser}">
								<input type="hidden" name='replyer' value="${loginUser.id}">
								<input type='hidden' name='reReplynum' value=''>
								<span>${loginUser.id}</span>
								<textarea id="replyContent" name='reply' name="replyContent" placeholder="댓글을 입력해 주세요"></textarea>
								</c:when>
								<c:otherwise>
								<span>아이디</span>
								<textarea id="replyContent" name="replyContent" placeholder="댓글을 작성하려면 로그인 해주세요" readonly></textarea>
								</c:otherwise>
							</c:choose>
							</sec:authorize>
							<button id='modalRegisterBtn'>등록</button>
							</div>
					</div>
					<input type="hidden" name="reviewno" value="${reviewVO.reviewno}">
					<input type="hidden" name="prodno" value="${reviewVO.prodno}">
					<input type='hidden' name='pageNum' value='${cri.pageNum}'>
					<input type='hidden' name='amount' value='${cri.amount}'>
					<input type='hidden' name='type' value='${cri.type}'> 
					<input type='hidden' name='keyword' value='${cri.keyword}'>
					</form>
		</div>
		
		<form id="otherDetail" action="/review/review_detail">
				<div id="box2">
					<table table frame="above">
						<tr>
							<td class="td1">다음글</td>
							<td class="td2"><c:choose>
									<c:when test="${not empty next.subject}">
										<a class="other" data-oper='next' href="${next.reviewno}">
										${next.subject}&nbsp;<strong>[${next.replyCount}]</strong></a>
									</c:when>
									<c:otherwise>
										<span style="color: #868686;">다음글이 없습니다.</span>
									</c:otherwise>
								</c:choose></td>
						</tr>
					</table>
					<table table frame="above">
						<tr>
							<td class="td1">이전글</td>
							<td class="td2"><c:choose>
									<c:when test="${not empty prev.subject}">
										<a class="other" data-oper='prev' href="${prev.reviewno}">
										${prev.subject}&nbsp;<strong>[${prev.replyCount}]</strong></a>
									</c:when>
									<c:otherwise>
										<span style="color: #868686;">이전글이 없습니다.</span>
									</c:otherwise>
								</c:choose></td>
						</tr>
					</table>
				</div>
					<input type="hidden" name="reviewno" value="${reviewVO.reviewno}">
					<input type="hidden" name="prodno" value="${reviewVO.prodno}">
					<input type='hidden' name='pageNum' value='${cri.pageNum}'>
					<input type='hidden' name='amount' value='${cri.amount}'>
					<input type='hidden' name='type' value='${cri.type}'> 
					<input type='hidden' name='keyword' value='${cri.keyword}'>
			</form>
		</div>


		<!-- 푸터 -->
		<%@ include file="../include/footer.jsp"%>
<script type="text/javascript" src="/resources/js/reply.js"></script>
	<script>
	$(document).ready(function(){
	/* console.log("============="); */
	
	var reviewnoValue = '<c:out value="${reviewVO.reviewno}"/>';
	var replyUL = $(".panel-body");	//댓글 들어오는 ul
	var replyerChk;

	showList(1)
	
	//댓글목록 가져오기
	function showList(page){
		console.log("show list "+page);
											//page(파라미터값)가 없을 때는 1로 설정
		replyService.getList({reviewno:reviewnoValue,page: page|| 1 }, 
			function(replyCnt, list){
				console.log("replyCnt: " +replyCnt);
				console.log(list)
				
				//만약에 page번호가 -1이면
				if(page == -1){
					//(찐)마지막페이지로 감		=>댓글 작성할 때 써먹을거임
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				}
				
				var str="";
				
				if(list == null || list.length == 0){
					//replyUL.html("");
					return;
				}
				for(var i =0, len =list.length || 0; i<len; i++){
					if(list[i].nth){
						str += "<span class='rechat'>";
					}
						str +="<ul class='chat'><li class='clearfix' data-replyno='"+list[i].replyno+"'>";
					if(list[i].nth){
						str += "<span>└</span>";
					}
					    str += list[i].replyer+"</li>"; 
					    str +="    <li class='reply-content'>"+list[i].reply;
					    	var id;
					    	var admin;
					    <sec:authorize access="isAuthenticated()">
					    	id="<sec:authentication property='principal.username' />";
					    </sec:authorize>
					    <sec:authorize access="hasRole('ROLE_ADMIN')">
					    	admin="ture";
				    	</sec:authorize>
				    	<sec:authorize access="isAnonymous()">
				    		id = "${loginUser.id}";
						</sec:authorize>
					    if((id == list[i].replyer) || admin){
					    	str +="<img id='modalRemoveBtn' data-rrr='"+list[i].reReplyno+"' data-re='"+list[i].reSum+"' data-replyer='"+list[i].replyer+"' data-replyno='"+list[i].replyno+"' src='/resources/image/delete.png'>";
					    }
					    if(id && !list[i].nth){
					    	str +="<img id='modalRereplyBtn' data-nth='"+list[i].nth+"' data-replyno='"+list[i].replyno+"' data-replyer='"+list[i].replyer+"' data-replyno='"+list[i].replyno+"' src='/resources/image/rereply.png'></li>";
					    }
					    str +="    <li class='pull-right text-muted'>"
					        +replyService.displayTime(list[i].replyDate)+"</li></ul><hr style='margin-top:7px'>";
					 if(list[i].nth){
							str += "</span>";
					 }
				}
				
				replyUL.html(str);
				
				showReplyPage(replyCnt);//페이지 출력하는 함수 시행
				
			});//end function
	}//end showList
	
	var pageNum = 1;
	var replyPageFooter = $(".panel-footer");
	
	//댓글 페이지 번호 출력
	function showReplyPage(replyCnt){
		//현재 페이지가 13일때  1.3을 올림하면 2로 해서 20이 마지막 페이지가 됨.
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9;
		
		var prev = startNum != 1;
		var next = false;	//next버튼 막아둠
		
		//마지막 페이지(20)를 10곱한 값(200)이 총 댓글수보다 크면
		//빈 페이지가 있는 상태이므로
		if(endNum * 10 >= replyCnt){
			//총 댓글수를 10으로 나눠서 올림한 값을 맨끝 페이지로 정함.(그리고 next 못누름)
			endNum = Math.ceil(replyCnt/10.0);
		}
		
		//총 댓글수보다 작으면 next버튼 사용 가넝한.
		if(endNum * 10 < replyCnt){
			next = true;
		}
		
		var str = "<ul class='pagination pull-right'>";
		
		//이전 버튼이 true면 시작번호 -1해줌(1~10, 11~20 이 숫자 조절해주는거)
		if(prev){
			str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		}
		
		//전체 페이지수 만큼 반복
		for(var i = startNum; i<=endNum; i++){
			//현재 페이지가 i이면 active클래스 붙여주자
			var active = pageNum == i? "bold":"";
			str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"&nbsp;</a></li>";
		}

		//next가 true면 끝번호 +1해줌(1~10, 11~20 이 숫자 조절해주는거)
		if(next){
			str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
		}
		
		str += "</ul></div>";
		
		console.log(str);
		
		replyPageFooter.html(str); // $(".panel-footer")에 페이지 붙여줍니당
	}
	
	//페이지 번호를 클릭했을 때 새로운 댓글을 가져옴
	replyPageFooter.on("click","li a", function(e){
		//a태그 기능 제거하고
		e.preventDefault();
		console.log("page click");
		
		//클릭한 값을 담아서
		var targetPageNum = $(this).attr("href");
		
		console.log("targetPageNum: "+ targetPageNum);
		
		//현재 페이지에 넣어줌
		pageNum = targetPageNum;
		
		//해당 페이지목록을 띄움
		showList(pageNum);
	})
	
	
	//var modal = $(".modal");
	var modal = $("#reviewForm");
	var modalInputReply = modal.find("textarea[name='reply']");
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	var reReplynum = modal.find("input[name='reReplynum']");
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	var modalRereplyBtn = $("#modalRereplyBtn");
	
	/* 토큰 설정 */
	$(document).ajaxSend(function(e,xhr,options){
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});
	
	//댓글 추가
	modalRegisterBtn.on("click",function(e){
		e.preventDefault();
		console.log("reReplynum============"+reReplynum.val())
		if(!reReplynum.val()){
			//댓글 정보 담아서
			var reply = {
				reply : modalInputReply.val(),
				replyer:modalInputReplyer.val(),
				reviewno:reviewnoValue,
				nth:"0"
			};
			//insert해줌
			replyService.add(reply, function(result){
				modal.find("textarea").val("");
				showList(-1);
			});
		}else{
			//댓글 정보 담아서
			var reply = {
				reply : modalInputReply.val(),
				replyer:modalInputReplyer.val(),
				reviewno:reviewnoValue,
				nth:"1",
				reReplyno: reReplynum.val()
			};
			//insert해줌
			replyService.add(reply, function(result){
				modal.find("textarea").val("");
				modal.find("input[name='reReplynum']").val("");
				$("#replyContent").attr("placeholder", "댓글을 입력해 주세요.");
				showList(pageNum);
			});
		}
	});

	//리댓 눌렀으면
	$('.panel-body').on("click", "#modalRereplyBtn", function(e){
		e.preventDefault();
		modal.find("input[name='reReplynum']").val($(this).data("replyno"));
		$("#replyContent").attr("placeholder", "@"+$(this).data("replyer"));
	});

	//삭제하기 눌렀으면
	$('.panel-body').on("click", "#modalRemoveBtn", function(e){
		var replyer = $(this).data("replyer");
		var replyno = $(this).data("replyno");
		var reReplyno = $(this).data("rrr");
		var reSum = $(this).data("re");
		console.log(replyer, replyno, reSum, reReplyno)
		if(reSum != 0){
			alert("답댓글이 달린 댓글은 삭제할 수 없습니다.");
		}else if(confirm('선택한 댓글을 삭제 하시겠습니까?')){
			replyService.remove(replyno, function(result){} )
			var reply = {
				reReplyno: reReplyno
			};
			replyService.removeDown(reply, function(result){showList(pageNum)} )
		}else
			return false;
	});
	
});
	
	var csrfHeaderName ="${_csrf.headerName}"; 
    var csrfTokenValue="${_csrf.token}";
</script>

		<script>
			function showPopup() {
				document.getElementById("popup").style.display = "block";
			}
			function closePopup() {
				document.getElementById("popup").style.display = "none";
			}
			$(document).ready(function(){

				var rForm = $('#reviewForm');
				$('#list button').on("click", function(e){
					e.preventDefault();
					rForm.submit();
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
					var writer="${reviewVO.id}";
					if (userid==writer || admin){
						e.preventDefault();
						rForm.append("<input type='hidden' name='val' value='"+ $(this).text()+"'>");
						rForm.attr("action","/review/check_pwd"); //action 수정
						rForm.submit();
					}else {
						alert("작성자만 변경할 수 있습니다.");
					}
				});
				var dForm = $('#otherDetail');
				$('.other').on("click",function(e){
					//버튼 기능 해제(submit)
					e.preventDefault();
					
					var operation= $(this).data("oper");
					console.log(operation);
					
					if(operation === 'next'){
						dForm.find("input[name='reviewno']").val($(this).attr("href"));
					}else if(operation === 'prev'){
						dForm.find("input[name='reviewno']").val($(this).attr("href"));
					}
					//조건문 다 돌렷으면 이제 submit 하셈~~
					dForm.submit();
				});
			})
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
		           str += "<img src='/resources/image/file.png'></a>";
		           str += "</div>";
		           str +"</li>";
		         }
		       });
		       
		       $(".uploadResult ul").html(str);
		       
		});
	})();
});
</script>
<script type="text/javascript" src="/resources/js/love.js"></script>
<script>
	$(document).ready(function(){
		lForm =$("#loveForm");
		var reviewno= '<c:out value="${reviewVO.reviewno}"/>';
		var id;
		<sec:authorize access="isAuthenticated()">
		id = "<sec:authentication property='principal.username' />";
		</sec:authorize>
		<sec:authorize access="isAnonymous()">
		if("${loginUser.id}"){
			id = "${loginUser.id}";
		}else { id = "x"; }
		</sec:authorize>
		var loveDiv = $(".love-body");	//하트 들어오는 div
		var countDiv = $(".loveCount");	//하트 총 갯수 들어오는 div
		
		showlove();
		lovecount();
		
		//유저의 하트 가져오기
		function showlove(){
			var love = {
				reviewno: reviewno,
				id: id
			};
			loveService.getList(love, 
				function(list){
					console.log(list)
					
					var str="";
					
					//좋아요를 누른 흔적이 있는 유저일때
					if(list){
						//검정이나 빨강하트
						if(list.loveyn == 1){
							str += "<img class='loveBtn' data-loveyn='"+list.loveyn+"' data-loveno='"+list.loveno+"' style='width:30px; height:30px' src='/resources/image/love_full.png'>";
						}else{
							str += "<img class='loveBtn' data-loveyn='"+list.loveyn+"' data-loveno='"+list.loveno+"' style='width:30px; height:30px' src='/resources/image/love.png'>";
						}
					//누른적 없으면 걍 검정
					}else{
						str += "<img class='loveBtn' style='width:30px; height:30px' src='/resources/image/love.png'>";
					}
					
					loveDiv.html(str);
					
				});//end function
		}//end showList
		
		//하트총 개수 가져오기
		function lovecount(){
			
			loveService.getCount({reviewno:reviewno}, 
				function(count){
					console.log(count)
					
					var str="";
					
					str += "<span>"+count+"</span>"
					
					countDiv.html(str);
					
				});//end function
		}//end
		
		//하트 누르면
		$('.love-body').on("click", ".loveBtn", function(e){
			e.preventDefault();
			var loveyn =  $(this).data("loveyn");
			var loveno =  $(this).data("loveno");
			console.log("============"+loveyn+", "+id+", "+loveno+", "+reviewno)
		//아이디 없을 때
		if(id == "x"){
			alert("로그인이 필요합니다.");
		//누른 적 있을 때
		}else if(loveno){
			if(loveyn == 1){
				var love = {
					reviewno: reviewno,
					id : id,
					loveno: loveno,
					loveyn : loveyn
				};
				loveService.love(love, function(result){	
					showlove();
					lovecount();
				})
				
			//비었으면
			}else{
				var love = {
					reviewno: reviewno,
					id : id,
					loveno: loveno,
					loveyn : loveyn
				};
				loveService.love(love, function(result){
					showlove();
					lovecount();
				})
			}
		//첨 눌렀을 때
		}else{
				var love = {
					reviewno: reviewno,
					id : id,
					loveno: loveno,
					loveyn : loveyn
				};
				loveService.add(love, function(result){	
					showlove();
					lovecount();
				})
				loveyn=1;
		}
			
		});
		
	});

</script>
	</div>
</body>

</html>