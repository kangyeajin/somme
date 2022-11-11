function numberMaxLength(e){
	if(e.maxLength < e.value.length){
		alert("글자 제한 수를 넘었습니다");
         // 지정해놓음 최대 글자수로 줄임
         e.value = e.value.slice(0,e.maxLength);
     }

}