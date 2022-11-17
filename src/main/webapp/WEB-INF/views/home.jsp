<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Somme</title>
<link href="<c:url value="/resources/css/intro.css"/>" rel='stylesheet' />

<style>
@font-face {
	font-family: 'RIDIBatang';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff')
		format('woff');

}

@font-face{
	font-family: 'Molle';
	src: url('/resources/fonts/Molle-Italic.ttf') format('truetype');
}
#myVideo {
	position: fixed;
	right: 0;
	bottom: 0;
	min-width: 100%;
	min-height: 100%;
}
</style>
</head>

<body>

	<video autoplay muted loop id="myVideo">
		<source src='<c:url value="/resources/image/background.mp4"/>'
			type="video/mp4">
	</video>

	<div class="box">
		<a id="logo">Somme</a>
		<h2>만 19세 이상 음주 가능한 연령입니까?</h2>
		<div class="btn">
			<a href="/main/" button class="btn1 btn-wine"
				type="button">예</a>
			<button class="btn2 btn-wine" type="button"
				onclick="alert('19세 미만은 이용하실 수 없습니다.')">아니요</button>
		</div>
		<div class="text">
			<p>이 사이트는 만 19세 이상만 입장 가능합니다.</p>
		</div>
	</div>

</body>
</html>
<!-- <script>
self.location ="/home111";
</script> -->

