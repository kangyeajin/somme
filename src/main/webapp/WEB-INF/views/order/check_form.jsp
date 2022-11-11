<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무통장 입금</title>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<style>
  select {
    width: 130px;
    text-align: center;
    padding: 5px 2px;
    margin-bottom: 15px;
  }
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
    width: 300px;
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
  <h1>무통장 입금</h1>
  <form action="WineshopServlet" name="form" method="get">			
    <p style="font-size: 18px;"><br>주문해주셔서 감사합니다^^<br><br></p>
    
    <p>은행을 선택해 주세요</p>
      <select name="location">
      <option value="1111-11-1111111">KEB하나은행</option>
      <option value="2222-22-2222222">SC제일은행</option>
      <option value="3333-33-3333333">국민은행</option>
      <option value="4444-44-4444444">신한은행</option>
      <option value="5555-55-5555555">외환은행</option>
      <option value="6666-66-6666666">우리은행</option>
      <option value="7777-77-7777777">한국시티은행</option>
      <option value="8888-88-8888888">카카오뱅크</option>
    </select>
    <div id="output">입금 계좌: 1111-11-1111111 </div>

    <br>
    <p style="line-height: 20px;">3일 이내로 입금 부탁드립니다
    <br>결제일이 지나면 주문은 자동취소됩니다
    <br>
    </p>
    
    <p id="notice">문의사항 : 010-1212-1212
    <br> 운영시간 : AM 10:00 ~ PM 18:00 </p>
     
    <br>
    <input id="ok" type="submit" value="확 인" onClick="self.close();">
    <br>
  </form>
</div>
<script>
$("select[name=location]").change(function(){
    console.log($(this).val()); //value값 가져오기
    console.log($("select[name=location] option:selected").text()); //text값 가져오기
    document.getElementById("output").innerHTML = "입금 계좌: " + $(this).val();
  }); 
  
window.resizeTo(540, 550);
</script>
</body>
</html>