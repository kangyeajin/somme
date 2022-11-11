<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Somme</title>
<link rel="stylesheet" type="text/css" href="/resources/css/review_write.css">
<link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">
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

<body>
	<div class="scrollBar">
		<!-- header-->
		<%@ include file="../include/header.jsp"%>


		<!-- 리뷰작성 폼 -->
		<form name="frm" method="post" action="/review/review_update">
			<div class="review_write_title">
				<p>리뷰작성</p>
				<hr size="2" width="200px" noshade>
			</div>

			<div id="review">
				<input type="hidden" name="prodno" value="${reviewVO.prodno}">
				<input type="hidden" name="reviewno" value="${reviewVO.reviewno}">
				<sec:authorize access="isAuthenticated()">
					<input type="hidden" name="id" value="<sec:authentication property="principal.username" />"> 
				</sec:authorize>
				<c:if test="${not empty loginUser}">
					<input type="hidden" name="id" value="${loginUser.id}"> 
				</c:if>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<table id="review_write">
					<tr id="title">
						<td class="col1">제목</td>
						<td class="col2"><input name="subject" maxlength="30"
							oninput="numberMaxLength(this)" type="text"
							value="${reviewVO.subject}" style="width: 450px;"></td>
					</tr>
					<tr id="pwd">
						<td class="col1">비밀번호</td>
						<td class="col2"><input type="password" name="pwd"
							maxlength="15" value="${reviewVO.pwd}" style="width: 200px;"></td>
					</tr>
					<tr id="date">
						<td class="col1">작성일자</td>
						<td class="col2" id="current_date"><input type="text"
							name="indate" style="width: 200px;"></td>
					</tr>
					<tr id="content">
						<td colspan="2" class="col2"><textarea name="content"
								maxlength="310" oninput="numberMaxLength(this)" cols="100"
								rows="30">${reviewVO.content}</textarea></td>
					</tr>
					<tr class="file">
						<td class="col1">첨부파일</td>
						<td class="col2"><input type="file" name='uploadFile'
							multiple
							style="height: 20px; width: 200px; font-family: 'RIDIBatang';">
						</td>
					</tr>
				</table>
				<div id="button_update">
					<button type="submit">수정하기</button>
				</div>
				<div class='uploadResult'> 
          			<ul>
          				<!-- 썸넬 들어옴 -->
          			</ul>
       			 </div>
			</div>
			<input type='hidden' name='pageNum' value='${cri.pageNum}'>
			<input type='hidden' name='amount' value='${cri.amount}'>
			<input type='hidden' name='type' value='${cri.type}'>
			<input type='hidden' name='keyword' value='${cri.keyword}'>
		</form>

		<!-- 푸터 -->
		<%@ include file="../include/footer.jsp"%>
  <script>

$(document).ready(function(){
	(function(){
		var reviewno = '<c:out value="${reviewVO.reviewno}"/>';
		
		$.getJSON("/review/getAttachList", {reviewno: reviewno}, function(arr){
	          
		       console.log(arr);
		       
		       var str = "";
		       
		       $(arr).each(function(i, attach){
		       
		         //image type
		         if(attach.fileType){
		           var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
		           
		           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
		           str += "<span>"+attach.fileName+"</span>";
		           str += "<button type='button' data-file=\'"+fileCallPath+"\'data-type='image'"
		           str += "class='btn-circle'><i class='fa fa-times'></i></button><br>";
		           str += "<img src='/display?fileName="+fileCallPath+"'>";
		           str += "</div>";
		           str +"</li>";
		         }else{
		             
		           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
		           str += "<span> "+ attach.fileName+"</span><br/>";
		           str += "<button type='button' data-file=\'"+fileCallPath+"\'data-type='image'"
		           str += "class='btn-circle'><i vlass='fa fa-times'></i></button><br>";
		           str += "<img src='/resources/img/file.png'></a>";
		           str += "</div>";
		           str +"</li>";
		         }
		       });
		       
		       $(".uploadResult ul").html(str);
		       
		});
	})();
	
	//일단 화면에서만 사라지게
	$(".uploadResult").on("click", "button", function(e){
		console.log("delete file");
		if(confirm("파일을 삭제합니다.")){
			var targetLi = $(this).closest("li");
			targetLi.remove();
		}
	})
	
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
					str += "<img src='/resources/img/attach.png'></a>";
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
		
	$("button[type='submit']").on("click",function(e){
		e.preventDefault();
		 if( frm.subject.value == "" ) {
		        frm.subject.focus();
		        alert("제목을 입력해 주세요.");
		        return false; 
		    }else if( frm.content.value == "" ) {
		        frm.content.focus();
		        alert("내용을 입력해 주세요.");
		        return false; 
		    }else if( frm.pwd.value == "" ) {
		        frm.pwd.focus();
		        alert("비밀번호를 입력해 주세요.");
		        return false; 
		    }    

		 var formObj = $("form");
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
});
</script>
		<!-- 작성일자 자동 입력 -->
		<script>
    date = new Date(+new Date() + 3240 * 10000).toISOString().split("T")[0];
    document.getElementById("current_date").innerHTML = date;
  </script>

		<script src="js/wine_list.js"></script>

	</div>
</body>

</html>