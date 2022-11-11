<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../include/adminheader.jsp"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="/resources/css/memberlist.css">
  <link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<style>
[type="button"] {
   all: unset;
}

[type="button"]:hover {
   text-decoration: underline;
   cursor:pointer;
   color:red;
}
.bold{ font-weight: bold;}

#main_footer {
  position : relative;
  top: 50px;
  width: 1000px;
  display: inline-block;
}


#main_footer_box{
  text-align: center;
  /* border: solid 3px #a1a1a1; */
}
#main_footer_box div{
  display: inline-block;
}

#btn_creat button,#input button{
  font-family: 'RIDIBatang';
  padding: 3px 30px;
}


#main_footer #main_footer_box #btn_pge {
  /* border: solid 1px red; */
  width: 240px;
  margin-bottom : 50px;
}

</style>

</head>

<body>

  
  	<script>
function allChk(obj){
    var chkObj = document.getElementsByName("RowCheck");
    var rowCnt = chkObj.length - 1;
    var check = obj.checked;
    if (check) {﻿
        for (var i=0; i<=rowCnt; i++){
         if(chkObj[i].type == "checkbox")
             chkObj[i].checked = true;
        }
    } else {
        for (var i=0; i<=rowCnt; i++) {
         if(chkObj[i].type == "checkbox"){
             chkObj[i].checked = false;
         }
        }
    }
} 

function fn_userDel() {

    var userid = "";
    var memberChk = document.getElementsByName("RowCheck");
    var chked = false;
    var indexid = false;
    for (i = 0; i < memberChk.length; i++) {
        if (memberChk[i].checked) {
            if (indexid) {
                userid = userid + '-';
            }
            userid = userid + memberChk[i].value;
            indexid = true;
        }
    }
    if (!indexid) {
        alert("삭제할 회원을 선택해주세요");
        return;
    }else{
	    var agree = confirm("삭제 하시겠습니까?");
	    if (agree) {
	    	frm.action = "/admin/member/multiMemberDelete";
			frm.submit();
	    }
    }

}
$(document).ready(function(){
	var aForm = $("#actionForm");
	
	$("#btn_pge a").on("click",function(e){
		e.preventDefault();
		console.log('click');
		aForm.find("input[name='pageNum']").val($(this).attr("href"));
		aForm.submit();
	});
	
    //조회페이지 이동 시 페이지 값을 같이 넘김
    $(".move").on("click", function(e){
        e.preventDefault();
        //클릭된 href값(bno)를 input에 담아 갖고감 - 페이지 값들은 form안에 이미 있음
        aForm.append("<input type='hidden' name='prodno' value='"+ $(this).attr("href")+"'>");
        aForm.attr("action","/admin/member/memberList"); //action 수정
        aForm.submit();
      });
    
	   //검색
	   var searchForm = $('#searchForm');   //변수에 form의 값을 담아줌
	    $("#searchForm button").on("click", function(e){
	        console.log("=========================")
	       if(!searchForm.find("option:selected").val()){//옵션을 선택하지 않은 경우
	          alert("검색종류를 선택하세요");
	          return false;
	       }
	       if(!searchForm.find("input[name='keyword']").val()){//검색 키워드를 입력하지 않은 경우
	          alert("키워드를 입력하세요");
	          return false;
	       }
	       searchForm.find("input[name='pageNum']").val("1");//페이지의 첫번째로 이동
	        e.preventDefault();//버튼의 기본 이벤트 동작을 막음
	       
	        searchForm.submit();
	        console.log("==========submit===========")
	      });
	
});﻿
</script>

    <div id="table" align="center">
    <form name="frm" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type='hidden' name='pageNum' value='${pageMaker.cri2.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri2.amount}'>
			<input type='hidden' name='keyword' value='${pageMaker.cri2.keyword}'>
			<input type='hidden' name='type' value='${pageMaker.cri2.type}'>
					
        <table class="list">
            <tr>
                <td colspan="11" style="border: gray; text-align: right">
                <h2 style="text-align: center">회원리스트</h2>
                &nbsp;
                </td>
            </tr>
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>생년월일</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>우편번호</th>
                <th>주소</th>
                <th>상세주소</th>
                <th>가입일</th>
                <th>가입상태</th>
                <th><input type="button" value="선택삭제" onclick="fn_userDel()">
					<input style="boder: none; vertical-align: middle; margin-left: 5px;"
					id="allCheck" type="checkbox" onclick="allChk(this);" /></th>
            </tr>
            <c:forEach var="MemberVO" items="${memberList}">
                <tr class="record">
                    <td>${MemberVO.id}</td>
                    <td>${MemberVO.name}</td>                    
                    <td>${MemberVO.bdate}</td>
                    <td>${MemberVO.phone}</td>
                    <td>${MemberVO.email}</td>
                    <td>${MemberVO.zipNum}</td>
                    <td>${MemberVO.addr1}</td>
                    <td>${MemberVO.addr2}</td>
                    <td>${MemberVO.indate}</td>
                    <td>${MemberVO.useyn}</td>
                    <td><input type="checkbox" name="RowCheck" value="${MemberVO.id}"/></td>
                </tr>
            </c:forEach>
        </table>
        		</form>
        		
        		<form id='actionForm' action="/admin/member/memberList" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri2.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri2.amount}'>
			<input type='hidden' name='keyword' value='${pageMaker.cri2.keyword}'>
			<input type='hidden' name='type' value='${pageMaker.cri2.type}'>			
		</form>
		
		<div id="main_footer">
			<div id="main_footer_box">
				<div id="btn_pge">
					<c:if test="${pageMaker.prev}">
						<a href="${pageMaker.startPage -1}">
						<button style="padding: 0 6px;">&lt;</button></a>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<a href="${num}"><span
							class="${pageMaker.cri2.pageNum == num? 'bold':''}">
								${num}&nbsp;</span></a>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<a href="${pageMaker.endPage +1}"><button
								style="padding: 0 6px;">&gt;</button></a>
					</c:if>
				</div>
			</div>
		</div>
		
		<form id='searchForm' action="/admin/member/memberList" method='get'>
		<div id="input" style="margin-bottom: 100px;">
		<select name="type" style="font-size: 15px;">
			<option
				<c:out value='${(pageMaker.cri2.type == "I")? "selected" : ""}'/>
					value="I">아이디</option>
			<option
				<c:out value='${(pageMaker.cri2.type == "N")? "selected" : ""}'/>
					value="N">이름</option>
			<option
				<c:out value='${(pageMaker.cri2.type == "IN")? "selected" : ""}'/>
					value="IN">아이디+이름</option>
			<option
				<c:out value='${(pageMaker.cri2.type == "P")? "selected" : ""}'/>
					value="P">전화번호</option>
			<option
				<c:out value='${(pageMaker.cri2.type == "U")? "selected" : ""}'/>
					value="U">가입상태(y/n)</option>	
		</select>
		<span>
		<input type="text" name="keyword" placeholder="검색할 내용을 입력하세요"
			   style="width: 300px; font-size: 15px; margin-top: 70px;"
			   value='<c:out value="${pageMaker.cri2.keyword}"/>'>
		</span>
		
		<button class='btn-default'>&nbsp; 검색&nbsp;</button>
		
		</div>
		</form>
		
    </div>

	
<%@ include file="../../include/adminfooter.jsp"%> 
	
</body>
</html>