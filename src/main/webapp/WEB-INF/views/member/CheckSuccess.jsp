<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
if (window.name == "update") {
window.opener.parent.location.href = 
	"memberUpdate";
	
} else if(window.name == "delete") {
	 if (confirm("탈퇴를 진행하시겠습니까?") == true){ 
		alert("탈퇴에 성공하셨습니다");
		 window.opener.parent.location.href = 
				"memberdelete";
		 }else{
			 alert("탈퇴를 취소합니다.");
		 }
	
	}

window.close();
</script>
</body>
</html>

