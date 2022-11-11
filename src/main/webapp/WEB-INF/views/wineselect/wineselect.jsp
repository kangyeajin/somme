<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Somme</title>
<link rel="stylesheet" href="/resources/css/wineselect.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/resources/js/wineselect.js?ver=1"></script>

</head>
<body>
	<div id="wineselect">
		<div id="wineSelect_start">
			<p class="logo"><a href="/main/">Somme</a></p>
			<h2>당신은 지금 이런 와인을 마시고 싶다</h2>
			<h4>본격 와인 고르기 독심술 테스트</h4>
			<div id="wineselect_box">
				<div class="image">
					<img src="/resources/image/wineselect.jpg">
				</div>
				<div class="wineselect_box2">
				<p style="margin-bottom:30px">현재 총 ${count}명이 참여했습니다. </p>
					<button>시작하기</button>
				</div>
			</div>
		</div>
		<form name="frm" id="resultForm" action="/wineselect/wineselect_result">
			<div id="Q1">
				<div id="wineSelect_main">
					<p class="logo"><a href="/main/">Somme</a></p>
					<div id="wineselect_box">
						<div>
							<span>1/5</span>
							<progress value="0" max="100" id="jb"></progress>
						</div>
						<p class="num">Q1.</p>
						<p class="content">와인을 사러 간 당신, 어떤 와인이 필요한가요?</p>
						<div class="wineselect_box2">
							<button type="button" value='1'>레드
								와인</button>
							<button type="button" value='2'>화이트
								와인</button>
							<button type="button" value='3'>스파클링
								와인</button>
							<button type="button" value='1'>뭐든
								좋아요</button>
						</div>
					</div>
				</div>
			</div>
			<div id="Q2">
				<div id="wineSelect_main">
					<p class="logo"><a href="/main/">Somme</a></p>
					<div id="wineselect_box">
						<span>2/5</span>
						<div>
							<progress value="20" max="100" id="jb"></progress>
						</div>
						<p class="num">Q2.</p>
						<p class="content">좀 더 선호하는 와인의 특징은?</p>
						<div class="wineselect_box2">
							<button type="button" value='1'>부드럽고 은은한 여운</button>
							<button type="button" value='2'>입안을 깔끔하게 잡아주는 산미</button>
							<button type="button" value='3'>안주에 가려지지 않는 묵직함</button>
							<button type="button" value='1'>모든것을 아우르는 밸런스</button>
						</div>
					</div>
				</div>
			</div>
			<div id="Q3">
				<div id="wineSelect_main">
					<p class="logo"><a href="/main/">Somme</a></p>
					<div id="wineselect_box">
						<span>3/5</span>
						<div>
							<progress value="40" max="100" id="jb"></progress>
						</div>
						<p class="num">Q3.</p>
						<p class="content">오늘따라 끌리는 아로마는?</p>
						<div class="wineselect_box2">
							<button type="button" value='1'>꽃이나 과일향</button>
							<button type="button" value='2'>허브와 향신료</button>
							<button type="button" value='2'>바닐라와 오크</button>
							<button type="button" value='2'>견과류와 토스트</button>
						</div>
					</div>
				</div>
			</div>
			<div id="Q4">
				<div id="wineSelect_main">
					<p class="logo"><a href="/main/">Somme</a></p>
					<div id="wineselect_box">
						<span>4/5</span>
						<div>
							<progress value="60" max="100" id="jb"></progress>
						</div>
						<p class="num">Q4.</p>
						<p class="content">누구와 마실 와인인가요?</p>
						<div class="wineselect_box2">
							<button type="button">저 혼자 마실 거예요</button>
							<button type="button">가족과 마실 거예요</button>
							<button type="button">친구와 마실 거예요</button>
							<button type="button">선물할 거예요</button>
						</div>
					</div>
				</div>
			</div>
			<div id="Q5">
				<div id="wineSelect_main">
					<p class="logo"><a href="/main/">Somme</a></p>
					<div id="wineselect_box">
						<span>5/5</span>
						<div>
							<progress value="80" max="100" id="jb"></progress>
						</div>
						<p class="num">Q5.</p>
						<p class="content">오늘의 술자리 분위기는?</p>
						<div class="wineselect_box2">
							<button type="button">음악을 들으며 차분하게</button>
							<button type="button">시끌벅적 수다 떨면서</button>
							<button type="button">재미있는 예능 보면서</button>
							<button type="button">기쁜 소식을 축하하며</button>
						</div>
					</div>
				</div>
			</div>
			<div id="Q6">
				<div id="wineSelect_main">
					<p class="logo"><a href="/main/">Somme</a></p>
					<div id="wineselect_box">
						<div>
							<progress value="100" max="100" id="jb"></progress>
						</div>
						<img style="width: 120px; height: 120px; margin: 20px 0;"
							src="/resources/image/welcome.png">
						<p style="font-size: 20px; font-weight: bold; margin: 40px 0;">좋아요!
							결과를 확인하러 가볼까요?</p>
						<div class="wineselect_box2">
							<button type="submit">결과 확인</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

</body>
</html>