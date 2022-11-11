<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--board 참고함 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Somme</title>
<style>
  #pay_opt{
    font-family: 'RIDIBatang';
    font-size: 16px;
  }

  #output {
    font-size: 18px;
    font-weight: bold;
    color: blue;
  }

  #notice{
    border: 1px solid #a1a1a1;
    width: 350px;
    padding: 15px 0;
    border-radius: 10px;
    line-height: 20px;
  }

  #ok{
    padding: 5px 20px;
    border: 1px solid #a1a1a1;
    background-color: white;
    border-radius: 5px;
  }

  #ok:hover{
    padding: 5px 20px;
    border: 1px solid #a1a1a1;
    background-color: #a1a1a1;
    border-radius: 5px;
    color: white;
  }

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
<div align="center" id="pay_opt">
  <h1>방문 결제</h1>
  <form action="WineshopServlet" name="form" method="get" action="WineshopServlet?command=insert_order">			
    <p style="font-size: 18px;"><br>주문해주셔서 감사합니다^^<br><br></p>
    
    <p style="line-height: 20px;">7일 이내로 방문 결제 부탁드립니다
    <br>결제일이 지나면 주문은 자동취소됩니다
    <br> 배송비는 현장에서 제외하고 결제 됩니다
    <br>
    
    </p>
    <p id="notice"> 주소 : 서울특별시 강남구 역삼동 와인타워 3층
    <br> 운영시간 : AM 10:00 ~ PM 18:00 
    <br> 문의사항 : 010-1212-1212 </p>
     
    <br>
    <input id="ok" type="submit" value="확 인" onClick="self.close();">
    <br>
  </form>
</div>
<script>
window.resizeTo(540, 480);
</script>
</body>
</html>