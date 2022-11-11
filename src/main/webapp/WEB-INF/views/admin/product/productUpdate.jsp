<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.2.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">
<link rel="stylesheet" type="text/css" href="/resources/css/productwrite.css">

<body>
<%@ include file="../../include/adminheader.jsp"%> 
	

  
  <script>

  function productCheckform() {
      var frm = document.frm;
    if( frm.name_kr.value == "" ) {
        frm.name_kr.focus();
        alert("상품명을 입력해 주세요.");
        return false;
    }else if( frm.name_en.value == "" ) {
        frm.name_en.focus();
        alert("영문명을 입력해 주세요.");
        return false; 
    }else if( frm.price.value == "" ) {
        frm.price.focus();
        alert("가격을 입력해 주세요.");
        return false; 
    }else if (isNaN(document.frm.price.value)) {
		frm.price.focus();
		alert("숫자를 입력해야 합니다");
		return false;
    }
    
    else{
    	alert("수정되었습니다.");
    	frm.encoding = "multipart/form-data";

		// productWrite.jsp 폼 페이지에서 입력받은 값을
		// 디비에 추가하기 위한 페이지인 product_save.jsp로 이동하되
		// 입력받은 상품 코드를 쿼리 스트링 형태로 전달한다.
		// 상품 코드로 폴더를 만들어 거기에 이미지 파일을 업로드한다.
		frm.action = "/admin/product/productUpdateFormAction";
		document.frm.submit();
		return true;
}
    
    
    
  </script>

	<h2>상품 수정</h2>

	<div id="table" align="center">
	  <form name="frm" id="from" method="post" enctype="multipart/form-data" action="/admin/product/productUpdateFormAction">
			<input type="hidden" name="prodno" value="${productVO.prodno}">
			<input type="hidden" name="content_2" value="${productVO.content_2}">
			<input type="hidden" name="image" value="${productVO.image}">
			
			<input type='hidden' name='pageNum' value='<c:out value="${cri2.pageNum}"/>'>
			<input type='hidden' name='amount' value='<c:out value="${cri2.amount}"/>'>
			<input type='hidden' name='keyword' value='${pageMaker.cri2.keyword}'>
			<input type='hidden' name='type' value='${pageMaker.cri2.type}'>
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			
			<table>
				<tr>
					<th>종류</th>
					<td colspan="1">
					<select id="kindSelect" name="kind" style="width: 200px; height: 25px;">		
					        <c:forEach items="${kindList}" var="kind" varStatus="status">
      							<option value="${kind}">${kind}</option>
   							</c:forEach>
					</select></td>
			
					
					<th>국가</th>
					<td colspan="4">
					<select id="kind_conSelect" name="kind_con" style="width: 200px; height: 25px;">		
					        <c:forEach items="${kind_conList}" var="kind_con" varStatus="status">
      							<option value="${kind_con}">${kind_con}</option>
   							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td width="343" colspan="5"><input type="text" name="name_kr"
						maxlength="100" style="width: 400px; height: 25px;"
						value="${productVO.name_kr}"></td>
				</tr>
				
				<tr>
					<th>영문명</th>
					<td width="343" colspan="5"><input type="text" name="name_en"
						maxlength="100" style="width: 400px; height: 25px;"
						value="${productVO.name_en}"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td colspan="1"><input type="text" name="price"
						style="width: 220px; height: 25px;" value="${productVO.price}">원
					</td>
					<th>베스트와인</th>
					<td colspan="4">
					<select id="mainprodSelect" name="mainprod" style="width: 200px; height: 25px;">		
					        <c:forEach items="${mainprodList}" var="mainprod" varStatus="status">
      							<option value="${mainprod}">${mainprod}</option>
   							</c:forEach>
					</select></td>

				</tr>
				<tr>
					<th>상품이미지</th>
					<td width="343" colspan="5"><input type="file" name="uploadFile">*변경 시에만 선택해주세요*</td>
				</tr>
				<tr>
					<th>상세설명</th>
					<td colspan="5"><textarea name="content_1" rows="30"
							cols="130">${productVO.content_1}</textarea></td>
				</tr>
				<tr>
					<th>상세이미지</th>
					<td width="343" colspan="5"><input type="file"
						name="uploadFile">*변경 시에만 선택해주세요*</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="수정" onclick="return productCheckform()">
			<button type="button" data-oper='list'>목록</button>
		</form>
	</div>

<%@ include file="../../include/adminfooter.jsp"%> 

<script>
$(document).ready(function() {
	var frm = $("#from");
	$('button').on("click", function(e) {
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if (operation === 'list') {
			//move to list
			frm.attr("action", "/admin/product/productList").attr("method","get");
			var PageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var typeTag = $("input[name='type']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			
			frm.empty();
			frm.append(PageNumTag);
			frm.append(amountTag);
			frm.append(typeTag);
			frm.append(keywordTag);
		}
		
		frm.submit();
	});
});
</script>

<script>
$('#kindSelect').val('${productVO.kind}').prop("selected",true);
$('#kind_conSelect').val('${productVO.kind_con}').prop("selected",true);
$('#mainprodSelect').val('${productVO.mainprod}').prop("selected",true);

</script>

</body>
