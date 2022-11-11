<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Somme detail</title>
<link rel="stylesheet" type="text/css" href="/resources/css/detail.css?ver=1">
<link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">
<script src="/resources/js/jquery.js" type="text/javascript"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>

<style>
@font-face {
   font-family: 'RIDIBatang';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff')
      format('woff');
   font-family: 'Molle';
   src: url('/resources/fonts/Molle-Italic.ttf') format('truetype');
}
.bold{ font-weight: bold;}
</style>

</head>

<body>

  <!-- header-->
  <%@ include file="../include/header.jsp"%>

   <form name="detail_form" method="post">
      <input type="hidden" name="userid" value='<c:out value="${loginUser.id}"/>' /> 
      <input type="hidden" name="prodno" value='<c:out value="${product.prodno}"/>' /> 
      <input type="hidden" name="no" value="quantity" /> 
      <input type="hidden" name="cC" value='<c:out value="${checkCart}"/>'>
      <input type="hidden" name="cP" value='<c:out value="${checkPayment}"/>'>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
     
      <div class="scrollBar">


         <section id="item_detail_main">

            <section id="summary">
               <!--제품사진-->
               <section id="summary1">
                  <div class="wrap">
                     <img class="target"
                        src='/resources/image/<c:out value="${product.image}"/>'
                        data-zoom="2" />
                  </div>
               </section>

               <!--제품정보-->
               <section id="summary2">
                  <div class="item_info">
                     <p class="prd_name">
                        <c:out value="${product.name_kr}" />
                     </p>
                     <p class="prd_en_name">
                        <c:out value="${product.name_en}" />
                     </p>
                     <p class="prd_text">
                        <c:out value="${product.content_1}" />
                     </p>
                     <p class="prd_from">
                        원산지 : <a href='<c:out value="${product.kind_con}"/>'><c:out
                              value="${fn:toUpperCase(product.kind_con)}" /></a>
                     </p>
                     <p id="origin_price">
                        <c:out value="${product.price}" />
                     </p>
                  </div>

                  <div class="area_count">
                     <div class="area_count_1">
                        <div class="area_count_box">
                           <p class="count">수량</p>
                           <div class="option_btn_tools">

                              <ul>
                                 <li><input type='button' class="minus_btn"
                                    onclick='count("minus")' value='━' /></li>
                                 <li><input type='text' name="quantity" class="quantity"
                                    value="1" /></li>
                                 <li><input type='button' class="plus_btn"
                                    onclick='count("plus")' value='╋' /></li>
                                 <li><span id="price"> <fmt:formatNumber
                                          type="number" maxFractionDigits="3"
                                          value="${product.price}"/></span>원</li>
                              </ul>

                           </div>
                        </div>
                     </div>
                     <ul class="area_count_2">
                        <li>총 상품금액(<span id='result2' value=1>1</span>개)
                        </li>
                        <li><span id="price2"> <fmt:formatNumber
                                 type="number" maxFractionDigits="3" value="${product.price}"/></span>원</li>
                     </ul>
                  </div>
                  <c:choose>
                     <c:when test='${not empty sessionScope.loginUser}'>
                        <ul class="buy_btn">
                           <li><a><button onclick="go_cart2()">구매하기</button></a>
                              <div class="clear"></div></li>
                           <li>
                              <button class="submit">
                                 <a href="javascript:go_cart();">장바구니</a>
                              </button>
                              <div class="clear"></div>
                           </li>
                        </ul>
                     </c:when>
                     
                     <c:otherwise>
                     <sec:authorize access="isAnonymous()">
                        <ul class="buy_btn">
                           <li>
                              <button>
                                 <a href="javascript:go_login();">구매하기</a>
                              </button>
                              <div class="clear"></div>
                           </li>
                           <li>
                              <button>
                                 <a href="javascript:go_login();">장바구니</a>
                              </button>
                              <div class="clear"></div>
                           </li>
                        </ul>
                     </sec:authorize>
                     
                     <sec:authorize access="isAuthenticated()">
                        <ul class="buy_btn">
                           <li><a><button onclick="go_cart2()">구매하기</button></a>
                              <div class="clear"></div></li>
                           <li>
                              <button class="submit">
                                 <a href="javascript:go_cart();">장바구니</a>
                              </button>
                              <div class="clear"></div>
                           </li>
                        </ul>
                      </sec:authorize>
                     </c:otherwise>
                  </c:choose>
               </section>
               <!-- section summary2 -->

            </section>

            <section id="item_detail">
               <div class="detail_nav">
                  <a href="#item_detail_image">제품 상세</a> <span>/</span> <a
                     href="#box2">구매평</a>
               </div>
               <div id="item_detail_image">
                  <img src='/resources/image/<c:out value="${product.content_2}"/>'>
               </div>
               <div class="detail_nav" style="margin-top: 30px">
                  <a href="#item_detail_image">제품 상세</a> <span>/</span> <a
                     href="#box2">구매평</a>
               </div>
            </section>
   </form>

   <!-- 리뷰목록 -->
   <script>
   function go_login() {
      document.detail_form.action = "/member/go_login";
      document.detail_form.submit();
   }
   
      function go_cart() {
         if(detail_form.cC.value == 1){ //값이 이미 담겨있는 경우
            if(confirm("이미 담긴 상품입니다. 추가하시겠습니까?")){
               alert("추가되었습니다.");
               document.detail_form.action = "/cart/cart_insert";
               document.detail_form.submit();
            }else{
               document.detail_form.action = "/product/detail?prodno="+<c:out value="${product.prodno}"/>;
            }
         
         }else if(detail_form.cC.value == 0){ //값이 담겨있지 않은 경우
            alert("장바구니에 상품을 담았습니다.");
            document.detail_form.action = "/cart/cart_insert";
            document.detail_form.submit();
         
         }else{
            document.detail_form.action = "/member/login_form";
         }
      }
      
      function go_cart2() {
            document.detail_form.action = "/cart/cart_insert_buy";
            document.detail_form.submit();
      }
</script>


   <form name="frm" id="reviewForm" action="/review/review_detail" >
      <section id="review_table">
         <div id="review_btn">
            <button class="review_Button">구매평 작성</button>
         </div>
         <div id="box2">
            <p></p>
            <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
            <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
            <input type='hidden' name='type' value='${pageMaker.cri.type}'>
            <input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
            <input type="hidden" name="prodno" value="${product.prodno}">
            <table table frame="above" cellspacing="0">
               <tr style="background-color: #f4f4f4;">
                  <th width="100px">번호</th>
                  <th width="750px">제목</th>
                  <th width="150px">작성자</th>
                  <th width="100px">작성일</th>
                  <th width="100px">조회수</th>
               </tr>
               <c:forEach var="reviewList" items="${reviewList}"
						varStatus="status">
						<tr>
							<td>${reviewList.reviewno}</td>
							<td style="text-align:left; padding-left:20px"><a class="move"
								href="${reviewList.reviewno}">${reviewList.subject}&nbsp;<strong>[${reviewList.replyCount}]</strong>
									<c:if
										test="${not empty reviewList.img}">
										<img width="15px" height="15px" src="/resources/image/file.png">
									</c:if>
							</a></td>
							<td>${reviewList.id}</td>
							<td><fmt:formatDate value="${reviewList.indate}" pattern="yyyy-MM-dd" type="date"/></td>
							<td>${reviewList.count}</td>
						</tr>
					</c:forEach>
            </table>
      </form>
         <form id='actionForm' action="/product/detail#box2" method='get'>
            <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
            <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
            <input type='hidden' name='type' value='${pageMaker.cri.type}'>
            <input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
            <input type="hidden" name="prodno" value="${product.prodno}" />
         </form>
            <div id="btn2">
            <c:if test="${pageMaker.prev}">
               <a href="${pageMaker.startPage-1}"><button style="padding:0 6px;"> &lt; </button></a>
            </c:if>
            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
               <a href="${num}"><span class="${pageMaker.cri.pageNum == num ? 'bold':''}"> ${num} &nbsp;</span></a>
            </c:forEach>
            <c:if test="${pageMaker.next}">   
               <a href="${pageMaker.endPage +1}"><button style="padding:0 6px;"> &gt; </button></a>
            </c:if>
            </div>
            <div id="btn3">
            <form id="searchForm" action="/product/detail#box2">
               <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
               <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
               <input type="hidden" name="prodno" value="${product.prodno}">
               <select name="type" style="font-size: 15px;">
                  <option value="S" <c:out value="${pageMaker.cri.type eq 'S' ? 'selected':''}"/>>제목</option>
                  <option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected':''}"/>>내용</option>
                  <option value="SC" <c:out value="${pageMaker.cri.type eq 'SC' ? 'selected':''}"/>>제목+내용</option>
                  <option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected':''}"/>>작성자</option>
               </select> <span> <input type="text" name="keyword"
                  placeholder="검색할 내용을 입력하세요"
                  style="width: 300px; font-size: 15px; margin-top: 70px;"></span>
               <button>&nbsp; 검색&nbsp;</button>
            </form>
            </div>
         </div>
      </section>


   </section>
   <!-- section main -->

   <!-- footer -->
   <%@ include file="../include/footer.jsp"%>

   </div>
   <script src="/resources/js/detail.js?ver=1"></script>
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

      var aForm = $("#actionForm");
      $("#btn2 a").on("click",function(e){
         e.preventDefault();
         aForm.find("input[name='pageNum']").val($(this).attr("href"));
         aForm.submit();
      });
      var sForm = $('#searchForm');
      $('#searchForm button').on("click", function(e) {
         e.preventDefault();
          if (!sForm.find("input[name='keyword']").val()) {
              alert("검색어를 입력하세요");
              return false;
          }
          sForm.find("input[name='pageNum']").val("1");
          sForm.submit();
      });
      var dForm = $('#reviewForm');
      $('.move').on("click", function(e) {
         e.preventDefault();
         dForm.append("<input type='hidden' name='reviewno' value='" + $(this).attr("href") + "'>");
         dForm.submit();
      });
      $('.review_Button').on("click", function(e) {
         e.preventDefault();
         var id;
         var admin;
		 <sec:authorize access="hasRole('ROLE_ADMIN')">
		   	admin="ture";
	     </sec:authorize>
         if((detail_form.cP.value == 0) && !admin){
        	 alert("구매한 상품만 리뷰 작성이 가능합니다.");
        	 return false;
         }
         if(${not empty loginUser}){
            id = "${loginUser.id}";
         }else{
         <sec:authorize access="isAuthenticated()">
            id = "<sec:authentication property='principal.username' />";
         </sec:authorize>
         }
         if (id) {
            dForm.attr("action","/review/review_write");
         }else {
            alert("로그인이 필요한 항목입니다.");
            dForm.attr("action","/member/loginForm");
         }
            dForm.submit();
      });
   }); 
   
</script>   
</body>

</html>