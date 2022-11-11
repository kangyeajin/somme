// 수량 버튼 조작
let quantity = $(".quantity").val();
$(".plus_btn").on("click", function(){
  $(".quantity").val(++quantity);
});
$(".minus_btn").on("click", function(){
  if(quantity > 1){
    $(".quantity").val(--quantity);	
  }
});


// 수량표시----------------------
function count(type)  {
  // 결과를 표시할 element
  const result2Element = document.getElementById('result2');

  const priceElement = document.getElementById('price');
  const price2Element = document.getElementById('price2');
  
  const origin_priceElement = document.getElementById('origin_price');

  // 현재 화면에 표시된 값
  let number = result2Element.innerText;
  let price = priceElement.innerText;
  let origin_price = origin_priceElement.innerText;
  
  // 더하기/빼기
  if(type === 'plus') {
    number = parseInt(number) + 1;
    price = price.split(',').join("");
    console.log(price);
    price = parseInt(price) + Number(origin_price);
  }else if(type === 'minus')  {
    if(number > 1){
      number = parseInt(number) - 1;
      price = price.split(',').join("");
      price = parseInt(price) - Number(origin_price);
    }
  }
  
  // 결과 출력
  result2Element.innerText = number;
  priceElement.innerText = price.toLocaleString();
  price2Element.innerText = price.toLocaleString();
}


// 사진확대-------------------------------------
window.onload = function () {
	
	var target = $('.target');
	var zoom = target.data('zoom');
	
	$(".wrap")
		.on('mousemove', magnify)
		.prepend("<div class='magnifier'></div>")
		.children('.magnifier').css({
			"background": "url('" + target.attr("src") + "') no-repeat",
			// 이미지를 zoom 배율만큼 확대해 배치한다.
			"background-size": target.width() * zoom + "px " + target.height() * zoom+ "px"
		});
	
	var magnifier = $('.magnifier');
	
	function magnify(e) {
	
		// 마우스 위치에서 .magnify의 위치를 차감해 컨테이너에 대한 마우스 좌표를 얻는다.
		var mouseX = e.pageX - $(this).offset().left;
		var mouseY = e.pageY - $(this).offset().top;
	
		// 컨테이너 밖으로 마우스가 벗어나면 돋보기를 없앤다.
		if (mouseX < $(this).width() && mouseY < $(this).height() && mouseX > 0 && mouseY > 0) {
			magnifier.fadeIn(100);
		} else {
			magnifier.fadeOut(100);
		}
	
		//돋보기가 존재할 때
		if (magnifier.is(":visible")) {
	
			// zoom으로 인해 확대된 이미지에 비례한 mouse 좌표를 얻는다.
			var rx = -(mouseX * zoom - magnifier.width() /2 );
			var ry = -(mouseY * zoom - magnifier.height() /2 );
	
			//돋보기를 마우스 위치에 따라 움직인다.
			//돋보기의 width, height 절반을 마우스 좌표에서 차감해 마우스와 돋보기 위치를 일치시킨다.
			var px = mouseX - magnifier.width() / 2;
			var py = mouseY - magnifier.height() / 2;
	
			//적용
			magnifier.css({
				left: px,
				top: py,
				backgroundPosition: rx + "px " + ry + "px"
			});
		}
	}

};
