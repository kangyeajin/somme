<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Somme</title>
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
   integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
   crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/resources/css/cart.css?ver=2">
<link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">
<style>
@font-face {
   font-family: 'RIDIBatang';
   src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
   font-family: 'Molle';
   src: url('/resources/fonts/Molle-Italic.ttf') format('truetype');
}

/* 선택상품 주문 버튼 */
#goorder div.buttongroup input {
   font-family: 'RIDIBatang';
   font-size: 16px;
   width: 160px;
   height: 50px;
   border-radius: 5px 5px 5px 5px;
   margin-right: -4px;
   border: 1px solid #881824;
   background-color: rgba(0, 0, 0, 0);
   color: #881824;
   padding: 5px;
   font-size: 20px;
   text-align: center;
   padding: 8px 5px;
}

#mycart {
   border: 1px solid rgb(255, 255, 255);
}

#goorder div.buttongroup input:hover {
   color: white;
   background-color: #881824;
}

div#select_all {
   /* border: 1px solid red; */
   margin-top: 30px;
   margin-bottom: 15px;
}

#title {
  position: relative;
}

.cartbox {
  box-sizing: border-box;
  border: 3px solid #881824;
  padding: 20px;
  position: relative;
  margin-top : 80px;
  margin-left: 600px;
  margin-bottom : 76px;
  width: 700px;
  height: 300px;
  border-radius: 50px;
}

.innerbox {
  margin-top: 30px;
  text-align: center;
}

.innerbox h3 {
  color: #DF0101;
  margin-top: 30px;
}

</style>
</head>
<body>
   <div class="scrollBar">
      <!-- header-->
      <%@ include file="../include/header.jsp"%>

      <section id="mycart">

         <div id="title">
            <h1>장바구니</h1>
            <div>
               <span id="title_1">1. 장바구니</span> <span>></span> <span>2.
                  주문/결제</span> <span>></span> <span>3. 주문 완료</span>
            </div>
         </div>

         <!-- 장바구니 -->
         <form name="orderform" id="orderform" method="post" action="order/payment" class="orderform">
         	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="hidden" name="userid" value='<c:out value="${userid}"/>'>
            <c:choose>
               <c:when test="${CartList.size() == 0}">
               
               <div class="cartbox">
                     <div class="innerbox">
                        <img src="/resources/image/emptycart.png">
                     <h3 style="color: red; text-align: center;">장바구니가 비었습니다.</h3>
                  </div>
               </div>
               
               </c:when>
               <c:otherwise>

            <div class="basketdiv" id="basket">

               <div id="cart_item">
                  <p id="item">장바구니</p>

                  <div id="select_all">
                     <input type='checkbox' name='buy_all' value='selectall'
                        checked="checked" onclick='selectAll(this)' /> <b>전체 선택</b>
                  </div>

                  <c:forEach items="${CartList}" var="cartlist">
                     <input type="hidden" name="prodno" value='<c:out value="${cartlist.prodno}"/>'>
                     <input type="hidden" name="cartno" value='<c:out value="${cartlist.cartno}"/>'>
                     <div class="row data">
                        <div class="subdiv">
                           <div class="check">
                              <input type="checkbox" name="buy" value='<c:out value="${cartlist.cartno}"/>' checked="checked"
                                 onclick="javascript:basket.checkItem();">&nbsp;
                           </div>
                           <a href='/product/detail?prodno=<c:out value="${cartlist.prodno}"/>'> 
                           <div class="img">
                              <img src='/resources/image/<c:out value="${cartlist.image}"/>' width="60">
                           </div>
                           <div class="pname">
                              <span><c:out value="${cartlist.name_kr}"/></span><br> <span>(<c:out value="${cartlist.name_en}"/>)</span>
                           </div>
                           </a>
                        </div>


                        <div class="subdiv">
                           <div class="basketprice">
                              <input type="hidden" name="p_price"
                                 id='p_price<c:out value="${cartlist.cartno}"/>' class="p_price"
                                 value="${cartlist.price}"/>
                              <fmt:formatNumber type="number" maxFractionDigits="3"
                                 value="${cartlist.price}"/>원
                           </div>
                           <div class="num">
                              <div class="updown">

                                 <span style="cursor: pointer;"
                                    onclick='javascript:basket.changePNum(<c:out value="${cartlist.cartno}"/>);'><i
                                    class="fas fa-thin fa-minus down"></i></span> <input type="text"
                                    name="quantity" id='p_num<c:out value="${cartlist.cartno}"/>' size="2"
                                    maxlength="4" class="p_num" value='<c:out value="${cartlist.no}"/>'
                                    onkeyup='javascript:basket.changePNum(<c:out value="${cartlist.cartno}"/>);'></input>

                                 <span style="cursor: pointer;"
                                    onclick='javascript:basket.changePNum(<c:out value="${cartlist.cartno}"/>);'><i
                                    class="fas fa-thin fa-plus up"></i></span>
                              </div>
                           </div>
                           <div class="sum">
                              <fmt:formatNumber type="number" maxFractionDigits="3"
                                 value="${cartlist.price*cartlist.no}"/>원
                           </div>
                        </div>

                        <div class="subdiv">
                           <div class="basketcmd">
                              <a
                                 href='/cart/delete?userid=<c:out value="${loginUser.id}"/>
                                 		&cartno=<c:out value="${cartlist.cartno}"/>'
                                 class="abutton">삭제</a>
                           </div>
                        </div>
                     </div>
                  </c:forEach>

                  <div id="last">
                     <div class="right-align basketrowcmd">
                        <a href="javascript:void(0)" class="abutton"
                           onclick="javascript:basket.delCheckedItem();">선택상품삭제</a> <a
                           href='/cart/deleteAll?userid=<c:out value="${loginUser.id}"/>'
                           class="abutton">장바구니비우기</a>
                     </div>

                     <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수:
                        <c:out value="${cVo.sumNo}"/>개</div>
                     <div class="bigtext right-align box blue summoney"
                        id="sum_p_price">합계금액: <fmt:formatNumber value="${cVo.sumPrice}" pattern="#,###,###"/>원</div>

                  </div>

               </div>
               <div id="goorder" class="">
                  <div class="clear"></div>
                  <div class="buttongroup center-align cmd">
                  <input type="button" value="선택한 상품 주문" onclick="fn_userDel()">
                  </div>
               </div>
            </div>
               </c:otherwise>
            </c:choose>
         </form>
      </section>
   </div>
   
   <script>
function fn_userDel() {

    var userid = "";
    var memberChk = document.getElementsByName("buy"); //value="${cartlist.cartno}"를 심어둠 > 체크 되면 값이 넘어갈 수 있도록 함 (배열로 받음)
    var chked = false;
    var indexid = false;
    for (i = 0; i < memberChk.length; i++) {
        if (memberChk[i].checked) {
            if (indexid) {
                userid = userid + '-';
            }
            userid = userid + memberChk[i].value;
            indexid = true;
        }
    }
    if (!indexid) {
        alert("주문할 상품을 선택해주세요");
        return;
    }else{
	    var agree = confirm("주문 하시겠습니까?");
	    if (agree) {
	    	orderform.action = "/cart/payment";
	    	orderform.submit();
	    }
    }
}﻿
</script>


   <!-- 푸터 -->
   <%@ include file="../include/footer.jsp"%>

   <script src="/resources/js/cart_detail.js"></script>
   <script src="/resources/js/step1.js"></script>
   <script src="/resources/js/cart.js?ver=2"></script>
   </div>
</body>

</html>