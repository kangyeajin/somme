<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Somme</title>
<link href="<c:url value="/resources/css/header.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/footer.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/banner.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/main-best.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/slide.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/scroll.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/scrollbar.css"/>" rel='stylesheet' />
<style>
@font-face {
	font-family: 'RIDIBatang';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff')
		format('woff');
	font-family: 'Molle';
	src: url('/resources/fonts/Molle-Italic.ttf') format('truetype');
}

.pop {
	width:1050px;
	height:250px;
}
#chat {
    position: fixed;
    right: 50px;
    bottom: 50px;
}
</style>

</head>

<body>
	<div class="scrollBar">
		<!-- header-->
		<%@ include file="include/header.jsp"%>

		<!-- 슬라이드 -->
		<div class="slide slide_wrap">
			<div class="slide_item item1"
				onClick="location.href='../product/detail?prodno=7'"></div>
			<div class="slide_item item2"
				onClick="location.href='../product/detail?prodno=1'"></div>
			<div class="slide_item item3"
				onClick="location.href='../product/detail?prodno=4'"></div>
			<div class="slide_prev_button slide_button">◀</div>
			<div class="slide_next_button slide_button">▶</div>
			<ul class="slide_pagination"></ul>
		</div>
		<script src='<c:url value="/resources/js/slide.js"/>'></script>

<a href="/main/chat"><img id="chat" src="/resources/image/speech-bubble.png"></a>

		<section id="scroll">

			<!-- 베스트 와인 -->
			<section id="bestwine">
				<div class="main_title">
					<p>Best Wine</p>
					<hr size="2" width="200px" noshade>
				</div>

				<div id="BestwineList">

					<c:forEach var="main" items="${mainlist}">
						<div class="wine-item">
							<div class="sa sa-up" data-sa-delay="200">
								<div class="for_fig">
									<a
										href="/product/detail?prodno=${main.prodno}">
										<img src="../resources/image/${main.image}" class="wine-img">
										<figcaption>자세히보기</figcaption>
									</a>
								</div>
								<div class="wine-name">
									<a href="detail.html">${main.name_kr} <br>${main.name_en}
									</a>
									<p>
										<fmt:formatNumber type="number" maxFractionDigits="3"
											value="${main.price}" />
										원
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</section>

			<!-- 이벤트 배너 -->
			<section id="event">
				<div>
					<p>Event</p>
					<hr class="line" size="2" width="200px" margin-bottom="30px"
						noshade>
				</div>
				<div>
					<ul>
						<c:forEach var="uploadEventList" items="${uploadEventList}" varStatus="status">
						<c:url value="/display" var="img">
							<c:param name="fileName" value="${uploadEventList.attachVO.uploadPath}/${uploadEventList.attachVO.uuid}_${uploadEventList.attachVO.fileName}" />
	  					</c:url>
							<li><div class="sa sa-right">
									<a href="${uploadEventList.url}">
									<c:choose>
										<c:when test="${not empty uploadEventList.img}">
											<img class="pop" src="/resources/image/${uploadEventList.img}">
										</c:when>
										<c:otherwise>
											<img class="pop" src="${img}">
										</c:otherwise>
										</c:choose>
										<span style="display:none">"${uploadEventList.popimg}"</span>
							      </a></li>
						</c:forEach>
					</ul>
				</div>
			</section>


			<script>
			$(document).ready(function(){
				$(".pop").on("click", function(e){
					var img = $(this);    
					var popimg = img.next().text().replace(/\"/gi, "");
					var set = img.eq(0).text();   

					console.log(set);
					console.log(popimg);

					if (popimg != '') {
						window.open('/resources/image/'+popimg,'popimg','width=532,height=758,location=no,status=no,scrollbars=no');
					}
				});
			});
			
			
// Scroll Animation (sa, 스크롤 애니메이션)
const saDefaultMargin = 300;
let saTriggerMargin = 0;
let saTriggerHeight = 0;
const saElementList = document.querySelectorAll('.sa');

const saFunc = function() {
  for (const element of saElementList) {
    if (!element.classList.contains('show')) {
      if (element.dataset.saMargin) {
        saTriggerMargin = parseInt(element.dataset.saMargin);
      } else {
        saTriggerMargin = saDefaultMargin;
      }

      if (element.dataset.saTrigger) {
        saTriggerHeight = document.querySelector(element.dataset.saTrigger).getBoundingClientRect().top + saTriggerMargin;
      } else {
        saTriggerHeight = element.getBoundingClientRect().top + saTriggerMargin;
      }

      if (window.innerHeight > saTriggerHeight) {
        let delay = (element.dataset.saDelay) ? element.dataset.saDelay : 0;
        setTimeout(function() {
          element.classList.add('show');
        }, delay);
      }
    }
  }
}

window.addEventListener('load', saFunc);
window.addEventListener('scroll', saFunc);
</script>
<div id="map" style="width:100%;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=032bd5ba761b4feee934c74147210b98"></script>

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.26787261422963, 127.00054115942547), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(37.26787261422963, 127.00054115942547); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	var iwContent = '<div style="padding:5px;">Somme</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(37.26787261422963, 127.00054115942547); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker); 
	
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);    
</script>
		</section>

		<!-- footer -->
		<%@ include file="include/footer.jsp"%>