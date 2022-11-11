<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Somme</title>
  <link rel="stylesheet" type="text/css" href="/resources/css/payment.css?ver=3">
  <link rel="stylesheet" type="text/css" href="/resources/css/step1.css">
  <link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">
  
  <script src="http://code.jquery.com/jquery-latest.js"></script> 
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>

  <script>
   var IMP = window.IMP; // 생략가능
   IMP.init('imp17544072'); // <-- 본인 가맹점 식별코드 삽입

  </script>
  
  <style>
    @font-face {
      font-family: 'RIDIBatang';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
      font-family: 'Molle';
      src: url('/resources/fonts/Molle-Italic.ttf') format('truetype');
    }
  </style>

</head>
<body onload="hidefield()" onload="value()">
  <div class="scrollBar">
  <!-- header-->
  <%@ include file="../include/header.jsp"%>

    <div id="title">
      <h1>주문/결제</h1>
      <div>
        <span>1. 장바구니</span>
        <span>></span>
        <span id="title_1">2. 주문/결제</span>
        <span>></span>
        <span>3. 주문 완료</span>
      </div>
    </div>
      <!-- 상품 목록 테이블 -->
    <div id="payment_cart">
      <table id="item_list">
        <tr id="payment_title">
          <td colspan="2">상품정보</td>
          <td>판매가</td>
          <td>수량</td>
          <td>총상품금액</td>
        </tr>

	<c:forEach items="${ProdList}" var="ProdList">
        <tr class="payment_item">
          
          <td style="width: 150px;"> <a href='/product/detail?prodno=<c:out value="${ProdList.prodno}"/>'>
          <img src='/resources/image/<c:out value = "${ProdList.image}"/>' alt="red"></a></td>
          <td id="item_name" name="name_kr" align="left" style="width: 200px;">
          
          <a href='/product/detail?prodno=<c:out value="${ProdList.prodno}"/>'>
          <c:out value = "${ProdList.name_kr}"/> <br> <c:out value = "${ProdList.name_en}"/> </a></td>
          	
          <td><span id="price1"><fmt:formatNumber type="number" maxFractionDigits="3" value="${ProdList.price}" /></span>원</td>
          <td><c:out value = "${ProdList.no}"/>개</td>
          
          <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${ProdList.price*ProdList.no}" />원</td>
        </tr>
	</c:forEach>

        <tr id="payment_val">
          <td colspan="6"><span id='result1'> 총 금액 
          <fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice}" /></span>원 
             + 배송비 <span id='result2'>
             <fmt:formatNumber type="number" maxFractionDigits="3" value="${delivery}" />
             </span>원 
             = <span id='result3'>
             <fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice+delivery}" /></span>원</td>
        </tr>
      </table>
      
      <!-- 배송지 정보 테이블 -->
	<form method="post" name="frm" id="frm" action='/order/pay_done'>
	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<c:forEach items="${ProdList}" var="ProdList">
			<input type="hidden" id="cartno" name="cartno" value='<c:out value = "${ProdList.cartno}"/>'>
		</c:forEach>
 		<input type="hidden" name="totalPrice" value='<c:out value = "${totalPrice+delivery}"/>'>
        <div id="payment_addr">
          <h3>배송지 정보</h3>
          <ul>
            <li>
              <p>배송지 선택</p>

            </li>
            <li><label><input type="radio" class="radio-value" name="addr" value="old" checked>기본배송지</label></li>
            <li><label><input type="radio" class="radio-value" name="addr" value="new">신규배송지</label></li>

          </ul>
          <hr>

          <ul id="input">
            <li id="name">
               <input type="text" class="name" name="name" style="width: 150px;" value='<c:out value = "${AddrList.name}"/>' 
                     placeholder="이름을 입력해주세요">
            </li>
            <li id="tel">
            	<fmt:formatNumber var="phone_num" value="${AddrList.phone}" pattern="000,0000,0000"/>
               <input type="tel" class="tel" name="tel" style="width: 200px;" value='<c:out value = "${fn:replace(phone_num, ',', '-')}"/>' 
                      placeholder="전화번호를 입력해주세요">
            </li>

            <li id="post">
              <div id="address" >
                <input type="text" id="sample4_postcode" value='<c:out value = "${AddrList.zipNum}"/>' class="zipNum" name="zipNum" placeholder="우편번호">
                <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" ><br>
                <input type="text" id="sample4_roadAddress" class="addr1" name="addr1" placeholder="도로명주소" value='<c:out value = "${AddrList.addr1}"/>' style="width:600px;"><br>
                <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" size="50">
                <span id="guide" style="color:#999;display:none"></span>
                <input type="text" id="sample4_detailAddress" class="addr2" name="addr2" value='<c:out value = "${AddrList.addr2}"/>' placeholder="상세주소를 기입해주세요"style="width:600px;"><br>
                <input type="hidden" id="sample4_extraAddress" placeholder="참고항목" size="50">
                <input type="hidden" id="sample4_engAddress" placeholder="영문주소" size="50" ><br>
              </div>
            </li>
            
            <script type="text/javascript">
              function hidefield() {
                document.getElementById('self').style.display = 'none';
              }

              function showfield(name) {
                if (name == 'direct') {
                  document.getElementById('payment').style.display = "none";
                  document.getElementById('self').style.display = "block";
                }
                else {
                  document.getElementById('payment').style.display = "block";
                  document.getElementById('self').style.display = "none";
                }
              }
            </script>

            <p><c:out value = "${prodname}"/></p>
            
            <select style="width: 450px;" name="message" id="payment" onchange="showfield(this.options[this.selectedIndex].value)">
              <option value="부재시 경비실에 맡겨 주세요." selected>부재시 경비실에 맡겨 주세요.</option>
              <option value="현관문 앞에 놓아주세요.">현관문 앞에 놓아주세요.</option>
              <option value="배송 전 연락 부탁드립니다.">배송 전 연락 부탁드립니다.</option>
              <option value="안전하고 빠른 배송 부탁드립니다.">안전하고 빠른 배송 부탁드립니다.</option>
              <option name="direct" value="direct">직접입력</option>
            </select>
            <div id="self"><input type="text" id="payment" name="whatever" style="width: 450px;" placeholder="요청사항을 직접 입력해주세요" required ></div>
          </ul>
        </div>

        <!-- 주문자 정보 -->
        <div id="payment_self">
          <h3>주문자 정보</h3>
          <p><c:out value = "${AddrList.name}"/></p>
          <ul id="self_notice">
            <li id="name">
            <fmt:formatNumber var="phone_num" value="${AddrList.phone}" pattern="000,0000,0000"/>
            <input type="text" name="phone" style="width: 150px;" value="${fn:replace(phone_num, ',', '-')}" placeholder="전화번호 수정" required></label>
            </li>
            
            <li id="tel"><input type="text" name="email" style="width: 200px;" value='<c:out value = "${AddrList.email}"/>' placeholder="메일 수정" required></label></li>

          </ul>
          <br><br><br><br>
          <br><br>
          <p style="line-height:170%;font-size:14px;color:gray">주문자 정보로 결제관련 정보가 제공됩니다.<br>정확한 정보로 등록되었는지 확인해주세요.</p>
        </div>

        <!-- 최종 결제 테이블 -->
        <div id="payment_last">
          <h3>결제 정보</h3>
          <hr>
          <div id="box">
            <span id="first"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice+delivery}"/>원</span>
            <span id="last_val">최종결제 금액</span>
          </div>

          <span style="margin-left: 52px;"></span>
          <div id="pay">
            <div id="left">
              <p>결제 방식</p>
              <div id="div1">
                <div class="div2" id="card" onclick="return productCheck2()" >신용카드</div>
                <div class="div2" id="kakao" onclick="return productCheck2()" >삼성페이</div>
                <div class="div2" id="admin" onclick="open_win('/order/check_form','ad_check'); toggleBtn1();">
            		무통장 입금</div>
                <div class="div2" id="admin" onclick="open_win('/order/visit_form','visit'); toggleBtn1();">
                                   방문 포장</div>
              </div>
            </div>
          </div>

        </div>
        <div id="next">
            <input type="button" id='btn1' value="주문하기" onclick="return productCheck()" style="visibility : hidden;">
        </div>
	</form>
	
    	</div>

   <!-- 푸터 -->
  <%@ include file="../include/footer.jsp"%>
  
      <script>
      function toggleBtn1() {
    	  // 토글 할 버튼 선택 (btn1)
    	  const btn1 = document.getElementById('btn1');
    	  
    	  //기본값을 hidden으로 지정
    	  btn1.style.visibility = 'hidden';
    	  
    	  // btn1 숨기기 (visibility: hidden)
    	  if(btn1.style.visibility !== 'hidden') {
    	    btn1.style.visibility = 'hidden';
    	  }
    	  // 버튼 보이기 (visibility: visible)
    	  else {
    	    btn1.style.visibility = 'visible';
    	  }
    	  
    	}
      
         function productCheck() {
            if (document.frm.name.value.length == 0) {
               alert("이름을 입력해주세요.");
               frm.name.focus();
               return false;
            } else if (document.frm.tel.value.length == 0) {
               alert("전화번호를 입력해주세요.");
               frm.tel.focus();
               return false;
            } else if (document.frm.addr1.value.length == 0) {
               alert("주소를 입력해주세요.");
               frm.address.focus();
               return false;
            } else{
               frm.action = "/order/pay_done";
               document.frm.submit();
               return true;
            }
         }

         function productCheck2() {
             if (document.frm.name.value.length == 0) {
                alert("이름을 입력해주세요.");
                frm.name.focus();
                return false;
             } else if (document.frm.tel.value.length == 0) {
                alert("전화번호를 입력해주세요.");
                frm.tel.focus();
                return false;
             } else if (document.frm.addr1.value.length == 0) {
                alert("주소를 입력해주세요.");
                frm.address.focus();
                return false;
             } else{
                requestPay();
                return true;
             }
          }
         
         function requestPay() {
            var prodname = $("#prodname").val();
            var price = $("#price").val();
            var email = $("#email").val();
            var name = $("#name").val();
            var phone = $("#phone").val();
            var addr = $("#addr").val();
            var zipnum = $("#zipnum").val();
            
            // IMP.request_pay(param, callback) 결제창 호출
            IMP.request_pay({
               pg : 'html5_inicis',
               pay_method : 'card',
               merchant_uid : 'merchant_' + new Date().getTime(),
               name : prodname,//상품명
               amount : price,//상품가격
               buyer_email : email,//주문자 이메일
               buyer_name : name,//주문자명
               buyer_tel : phone,//전화번호
               buyer_addr : addr,//주소
               buyer_postcode : zipnum//우편번호
            }, 
            
            function(rsp) {
               var operForm = $("#frm");
               
               if (rsp.success) {
                  var msg = '결제가 완료되었습니다.';
                  msg += '고유ID : ' + rsp.imp_uid;
                  msg += '상점 거래ID : ' + rsp.merchant_uid;
                  msg += '결제 금액 : ' + rsp.paid_amount;
                  msg += '카드 승인번호 : ' + rsp.apply_num;
                  alert(msg);
                  operForm.attr("action","/order/pay").submit();
                  //location.replace('/order/pay')
                		  
               } else {
                  var msg = '결제에 실패하였습니다.';
                  msg += '에러내용 : ' + rsp.error_msg;
                  alert(msg);
                  
                  //operForm.add()
                  //operForm.attr("action","/order/pay").submit();
               }
            });
         }
         
         var div2 = document.getElementsByClassName("div2");
         function handleClick(event) {
            if (event.target.classList[1] === "clicked") {
               event.target.classList.remove("clicked");
            } else {
               for (var i = 0; i < div2.length; i++) {
                  div2[i].classList.remove("clicked");
               }
               event.target.classList.add("clicked");
            }
         }

         function init() {
            for (var i = 0; i < div2.length; i++) {
               div2[i].addEventListener("click", handleClick);
            }
         }
         init();
         
         //팝업 창 띄우기
         function open_win(url, name) {
            var popX = (window.screen.width / 2) - (popWidth / 2);
            var popY= (window.screen.height / 2) - (popHeight / 2);
               window.open(url, name, 
               'status=no, height= 500 , width=500 , left='+ popX + ', top='+ popY );
            window.resizeTo(1400, 740);
         }
         
         $('.radio-value').on('click', function() {

             var valueCheck = $('.radio-value:checked').val(); // 체크된 Radio 버튼의 값을 가져옵니다.

             if ( valueCheck == 'old' ) {
                 $('.name').val('${AddrList.name}');
                 $('.name').attr('readonly', true);
                 $('.tel').val('${AddrList.phone}');
                 $('.tel').attr('readonly', true);
                 $('.zipNum').val('${AddrList.zipNum}');
                 $('.zipNum').attr('readonly', true);
                 $('.addr1').val('${AddrList.addr1}');
                 $('.addr1').attr('readonly', true);
                 $('.addr2').val('${AddrList.addr2}');
                 $('.addr2').attr('readonly', true);  
             } else if ( valueCheck == 'new' ){
                 $('.name').attr('readonly', false);
                 $('.name').focus();
                 $('.tel').attr('readonly', false);
                 $('.tel').focus();
                 $('.zipNum').attr('readonly', false);
                 $('.zipNum').focus();
                 $('.addr1').attr('readonly', false);
                 $('.addr1').focus();
                 $('.addr2').attr('readonly', false);
                 $('.addr2').focus();
             }
         });
      </script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="/resources/js/step2.js"></script>

</div>
   <input type="hidden" id="prodname" value='<c:out value = "${prodname}"/>'>
   <input type="hidden" id="price" value='<c:out value = "${totalPrice+delivery}"/>'>
   <input type="hidden" id="email" value='<c:out value = "${AddrList.email}"/>'>
   <input type="hidden" id="name" value='<c:out value = "${totalPrice+delivery}"/>'>
   <input type="hidden" id="phone" value='<c:out value = "${AddrList.name}"/>'>
   <input type="hidden" id="addr" value='<c:out value = "${AddrList.addr1}"/>'>
   <input type="hidden" id="zipnum" value='<c:out value = "${AddrList.zipNum}"/>'>
</body>
</html>