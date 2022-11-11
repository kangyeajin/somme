<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/wineselect_result.css">
<title>Somme</title>
<style>
@font-face {
	font-family: 'RIDIBatang';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff')
		format('woff');
	font-family: 'Molle';
	src: url('fonts/Molle-Italic.ttf') format('truetype');
}

</style>
<script type="text/javascript">
	history.replaceState({}, null, location.pathname);
</script>
</head>
<body>
	<div id="result">
		<div id="wineselect_result">
				<fieldset class="result_box">
					<p class="result">${wineSelectList.intro}</p>
				</fieldset>
				<div id="result_content">
					<ul class="title_text">
						<li>당신이 마시고 싶은 와인은..</li>
						<li>${wineSelectList.intro}</li>
						<li></li>
					</ul>
					<img src="/resources/image/${wineSelectList.img}">
					<ul class="text">
						<li>&#10004; ${wineSelectList.subject}</li>
						<li>${wineSelectList.content}</li>
					</ul>
					<div class="wineselect_box2">
					<form id="form" action="/wineselect/wineselect">
						<button style="display:none">${wineSelectList.prodno}</button>
						<button class="btn" type="button">구매하러 가기</button>
						<button class="btn" type="button">테스트 다시하기</button>
					</form>
					</div>
				</div>
		</div>
	</div>

</body>
<script>

$(document).ready(function(){
	var form= $("#form");
	$(".btn").on("click",function(e){
		e.preventDefault();
		var btn = $(this).text();   
		var pno = $(this).prev().text();  

		if(btn == "구매하러 가기"){
			form.append("<input type='hidden' name='prodno' value='"+pno+"'>");
			form.attr("action","/product/detail");
			form.submit();
		}else{
			form.empty();
			form.attr("action","/wineselect/wineselect");
		}
		form.submit();
	});
});
</script>
</html>