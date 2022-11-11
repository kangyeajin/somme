<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="java.util.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Somme</title>
<style>

	body{margin-top:30px;}
  div,h2,h1{ 
	display: table; 
	margin: 0 auto;
	margin-top:30px;
  }
  a{
  	display: table; 
  	margin: 0 auto;
  	margin-top:30px;
  }
  span{  
  	font-family: 'Molle', cursive;
  	font-size: 30px;
  	font:bold;
  }
  img{
    display: table; 
	margin: 0 auto;
  	width:60%;
  	hight:60%;
  }
</style>
<script>
function back(){
	window.history.back();
}
</script>
</head>
<body>
<div>
<h2><c:out value="${msg}"/></h2>
<h2><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/></h2>
	<img src="/resources/image/error.png">
	<h1>접근할 수 없는 경로입니다.</h1>
</div>

<a href="javascript:back();"><span>Somme</span>으로 돌아가기 </a>
</body>
</html>
