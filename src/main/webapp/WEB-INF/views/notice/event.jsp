<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Somme</title>
  <link rel="stylesheet" type="text/css" href="/resources/css/event.css">
  <link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

  <style>
    @font-face {
      font-family: 'RIDIBatang';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
      font-family: 'Molle';
      src: url('fonts/Molle-Italic.ttf') format('truetype');
    }
.pop{
	width:1050px;
	height:250px;
}
</style>

</head>
<body>
  <div class="scrollBar">
  <!-- header-->
	<%@ include file="../include/header.jsp"%>

<section id="event">
  
  <div>
    <p> Event </p>
    <hr class="line" size="2" width="200px" margin-bottom="30px" noshade>
  </div>
  <div>
    <ul>
    <c:forEach var="uploadEventList" items="${uploadEventList}" varStatus="status">
      <c:url value="/display" var="img">
		<c:param name="fileName" value="${uploadEventList.attachVO.uploadPath}/${uploadEventList.attachVO.uuid}_${uploadEventList.attachVO.fileName}" />
	  </c:url>
      <li><a href="${uploadEventList.url}">
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

  <!-- 푸터 -->
	<%@ include file="../include/footer.jsp"%>
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
</script>
</div>
</body>
</html>