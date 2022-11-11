<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">
<link rel="stylesheet" type="text/css" href="/resources/css/productwrite.css">

<script type="text/javascript" src="/resources/js/product.js"></script>

<body>
<%@ include file="../../include/adminheader.jsp"%> 



  
<h2>상품 등록</h2>

	<div id="table" align="center">
		<form method="post" enctype="multipart/form-data" name="frm" action="/admin/product/uploadFormAction">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<table>
				<tr>
					<th>종류</th>
					  <td colspan="1">
					    <select name="kind" style="width: 100px; height: 25px;">
					        <c:forEach items="${kindList}" var="kind" varStatus="status">
      							<option value="${kind}">${kind}</option>
   							</c:forEach>
   						</select>
   						</td>
   					<th>국가</th>
					  <td colspan="4">
					    <select name="kind_con" style="width: 100px; height: 25px;">
					        <c:forEach items="${kind_conList}" var="kind_con" varStatus="status">
      							<option value="${kind_con}">${kind_con}</option>
   							</c:forEach>
   						</select>
   						</td>
				</tr>
				<tr>
				  <th>상품명</th>
  				  	<td width="343" colspan="5">
       				<input type="text" name="name_kr" maxlength="100" style="width: 400px; height: 25px;">
  					</td>
  				</tr>
				<tr>
				  <th>영문명</th>
  				  	<td width="343" colspan="5">
       				<input type="text" name="name_en" maxlength="100" style="width: 400px; height: 25px;">
  					</td>
  				</tr>
				<tr>
					<th>가격</th>
					<td colspan="1">
					<input type="text" name="price" style="width: 220px; height: 25px;"> 원
				  	</td>
				  <th>베스트와인</th>
					  <td colspan="4">
					    <select name="mainprod" style="width: 100px; height: 25px;">
					        <c:forEach items="${mainprodList}" var="mainprod" varStatus="status">
      							<option value="${mainprod}">${mainprod}</option>
   							</c:forEach>
   						</select>
   						</td>
					
  				</tr> 						
				<tr>
					<th>상품이미지</th>
					<td width="343" colspan="5">
					<input type="file" name="uploadFile"></td>
				</tr>
				<tr>
				    <th>상세설명</th>
				    <td colspan="5">
				      <textarea name="content_1" rows="30" cols="130"></textarea>
				    </td>
				</tr>
				<tr>
					<th>상세이미지</th>
					<td width="343" colspan="5">
					<input type="file" name="uploadFile"></td>
				</tr>				
			</table>
			<br> <input type="submit" value="등록" onclick="return productCheck()"> 
			   	 <input type="reset"	value="다시작성"> 
				 <input type="button" value="목록" onclick="location.href='/admin/product/productList'">
		</form>
	</div>
	
<%@ include file="../../include/adminfooter.jsp"%> 

</body>
