<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%> 

<link href="<c:url value="/resources/css/header.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/footer.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/login.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/scrollbar.css"/>" rel='stylesheet' />
    
    <style>

input[type=submit] {
  background-color: #BDBDBD;
  border: none;
  color: white;
  padding: 16px 32px;
  text-decoration: none;
  cursor: pointer;
  border-radius: 5px;
}

input[type="submit"]:hover {
  background-color: #A4A4A4;
  border: none;
  color: white;
  padding: 16px 32px;
  text-decoration: none;
  cursor: pointer;
  border-radius: 5px;
}

    </style>
    
</head>

<body>
    <div class="scrollBar">
    <script>

        window.addEventListener('load', function () {
            var allElements = document.getElementsByTagName('*');
            Array.prototype.forEach.call(allElements, function (el) {
                var includePath = el.dataset.includePath;
                if (includePath) {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            el.outerHTML = this.responseText;
                        }
                    };
                    xhttp.open('GET', includePath, true);
                    xhttp.send();
                }
            });
        });
    </script>

<div id="loginpage">
<h2>관리자 로그인</h2>
    <div id="login">
    <div id="switch">
        <p><a href="/member/loginForm">일반</a></p>
        </div>
            <form name="frm" method="post" action="/admin/login">
                <fieldset class="login_box">
                    <div class="login">
                        <label for="id"></label>
                        <c:choose>
                        	<c:when test="${empty id}">
                       		<input type="text" name="id" placeholder="아이디" size="15">
                       		<div class="login">
                        		<label for="pwd"></label>
                        		<input type="password" name="pwd" placeholder="비밀번호" size="15">
                    		</div>
                    		</c:when>
                    		
                        	<c:otherwise>
                       		<input type="text" name="id" placeholder="아이디" size="15" value="${id}">
                       		<div class="login">
                        		<label for="pwd"></label>
                        		<input type="password" name="pwd" placeholder="비밀번호" size="15">
                    		</div>
                       		<script type="text/javascript">
                       		document.frm.pwd.focus();
                       		</script>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                    
                    
                    <input class="btn" type="submit" value="로그인" style="height:50px;">
                     <div style="text-align: center; padding-top:10px;">${message}</div>                    

                </fieldset>
            </form>
    </div>
</div>
</div>


  <!-- 푸터 -->
<%@ include file="../include/footer.jsp"%>
