<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Somme</title>
<link rel="stylesheet" type="text/css" href="/resources/css/review_write.css?ver=1">
<link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">
<script src="/resources/js/qna_write.js" type="text/javascript"></script>
<script src="/resources/js/notices.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
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


</head>

<body onload="hidefield()">
	<div class="scrollBar">
		<!-- header-->
		<%@ include file="../include/header.jsp"%>

		<!-- 리뷰작성 폼 -->
		<form name="frm" method="post" action="/qna/QNA_write">
			<sec:authorize access="isAuthenticated()">
			<input type="hidden" name="id" value="<sec:authentication property="principal.username" />"> 
			</sec:authorize>
			<c:if test="${not empty loginUser}">
			<input type="hidden" name="id" value="${loginUser.id}"> 
			</c:if>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="review_write_title">
				<p>Q&amp;A</p>
				<hr size="2" width="200px" noshade>
			</div>
			<div id="review">
				<table id="review_write">
					<tr id="title">
						<td class="col1">제목</td>
						<td class="col2"><select id="qnaList" name="subject"
							onchange="showfield(this.options[this.selectedIndex].value)"
							style="font-size: 15px; width: 450px;">
								<c:forEach items="${qnaList}" var="qnaList" varStatus="status">
									<option value="${qnaList}">${qnaList}</option>
								</c:forEach>
						</select>
							<div id="self">
								<input type="text" placeholder="제목을 입력해 주세요" maxlength="30"
									oninput="numberMaxLength(this)" name="whatever"
									style="width: 439px; padding:5px 0; margin-top:5px;" />
							</div></td>
					</tr>
					<tr id="name">
						<td class="col1">비밀번호</td>
						<td class="col2"><input type="password" name="pwd"
							maxlength="15" style="width: 200px;"></td>
					</tr>
					<tr id="date">
						<td class="col1">작성일자</td>
						<td class="col2" id="current_date"><input type="text"
							style="width: 200px;"></td>
					</tr>
					<tr id="content">
						<td colspan="2" class="col2"><textarea name="content"
								maxlength="310" oninput="numberMaxLength(this)" cols="100"
								rows="30"></textarea></td>
					</tr>
					<tr class="file">
						<td class="col1">첨부파일</td>
						<td class="col2"><input type="file" name='uploadFile' multiple
							style="height: 20px; width: 200px; font-family: 'RIDIBatang';">
						</td>
					</tr>
				</table>
				 <div class='uploadResult'> 
          			<ul>
          				<!-- 썸넬 들어옴 -->
          			</ul>
       			 </div>
				<div id="button_update">
					<button type="submit" >등록하기</button>
				</div>

			</div>
		</form>

		<!-- 푸터 -->
		<%@ include file="../include/footer.jsp"%>

		<!-- 작성일자 자동 입력 -->
		<script>
			date = new Date(+new Date() + 3240 * 10000).toISOString()
					.split("T")[0];
			document.getElementById("current_date").innerHTML = date;
		</script>
<script>
	$(document).ready(function(e){
		//form에 정보 저장
	  var formObj = $("form");
	  
	  $("button[type='submit']").on("click", function(e){
		    var frm = document.frm;
		    if (frm.content.value == "") {
		        frm.content.focus();
		        alert("내용을 입력해 주세요.");
		        return false;
		    } else if (frm.pwd.value == "") {
		        frm.pwd.focus();
		        alert("비밀번호를 입력해 주세요.");
		        return false;
		    }
	    e.preventDefault();
	    
	    console.log("submit clicked");
	    
	    var str = "";
	    
	    $(".uploadResult ul li").each(function(i, obj){
	      
	      var jobj = $(obj);
	      
	      console.dir(jobj);
	      console.log("-------------------------");
	      console.log(jobj.data("filename"));
	      
	      
	      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	      
	    });
	    
	    console.log(str);
	    
	    formObj.append(str).submit();
	    
	  });
		
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		//크기 제한
		var maxSize = 5242880; //5MB
		
		function checkExtension(fileName, fileSize){
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		//썸넬 띄워줄 함수
		  function showUploadResult(uploadResultArr){
			    
			    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
			    
			    var uploadUL = $(".uploadResult ul");
			    
			    var str ="";
			    
			    $(uploadResultArr).each(function(i, obj){
			    
					if(obj.image){
						var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
						str += "<li data-path='"+obj.uploadPath+"'";
						str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
						str +" ><div>";
						str += "<span> "+ obj.fileName+"</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' "
						str += "data-type='image' class='btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='/display?fileName="+fileCallPath+"'>";
						str += "</div>";
						str +"</li>";
					}else{
						var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
					    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					      
						str += "<li "
							/* 등록할때 쓸 정보들 추가 */
						str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
						str += "<span> "+ obj.fileName+"</span>";
							/* 삭제할 때 쓸려고 파일명(uuid) 포함해줬음! */
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
						str += "class='btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='/resources/image/file.png'></a>";
						str += "</div>";
						str +"</li>";
					}

			    });
			    
			    uploadUL.append(str);
			  }

		//토큰값 설정
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
		
		//파일 첨부
		$("input[type='file']").change(function(e){
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			for(var i =0; i<files.length; i++){
				//파일마다 유효성검사
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
				//통과하면 form에 추가
				formData.append("uploadFile",files[i]);
			}
			
			$.ajax({
				url:'/uploadAjaxAction',//로딩할 페이지
				processData: false,	//필수
				contentType: false,	//필수
				beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				data: formData,	//넘길 파라미터
					type: 'POST',	//전송 타입
					dataType:'json',	//ajax를 호출했을 때 데이터 타입
					success: function(result){
						 console.log(result);
						 showUploadResult(result);
					 }
			});
		});
		
		//x버튼 누르면 삭제
		$(".uploadResult").on("click", "button", function(e){
  			 console.log("delete file");
  			  
  			 var targetFile = $(this).data('file');
  			 var type = $(this).data('type');
  			 
  			 var targetLi = $(this).closest("li");
  			 
  			 $.ajax({
  				 url: '/deleteFile',
  				 data: {fileName: targetFile, type:type},
  				 beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				 },
  				 dataType:'text',
  				 type:'POST',
  				 success: function(result){
  					 //delete됐으면 화면에서도 지워줌
  					 targetLi.remove();
  				 }
  			 })
		})
		
	});
</script>
	</div>
</body>

</html>