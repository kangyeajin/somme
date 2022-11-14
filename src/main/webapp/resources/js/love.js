/**
 * 
 */

console.log("Love Module........");

/*즉시실행 함수!!*/
var loveService = (function(){
		
	//정보
	function getList(love, callback, error){
		console.log("getList loveService........."+love.reviewno+", "+love.id);
		
		//원하는 해당자료의 json데이터를 얻기위하여 호출
		$.getJSON("/loves/"+love.reviewno+"/"+love.id,		//[1]url
			function(data){										//[2]data
				if(callback){	//값이 오면
					callback(data);
				}
			}).fail(function(xhr, status, err){					//[3]success
				if(error){
					error();
				}
			});
	}
	
	//하트 총 개수
	function getCount(param, callback, error){
		var reviewno = param.reviewno;
		console.log("getList loveService........reviewno"+reviewno);
		
		//원하는 해당자료의 json데이터를 얻기위하여 호출
		$.getJSON("/loves/love_count/"+reviewno,		//[1]url
				function(data){										//[2]data
			if(callback){	//값이 오면
				callback(data);	
			}
		}).fail(function(xhr, status, err){					//[3]success
			if(error){
				error();
			}
		});
	}
	
	//첫 좋아요
	function add(love, callback, error) {
		console.log("add loveService..............."+JSON.stringify(love));
		
		$.ajax({
			type : 'post',	//전송 방식
			url : '/loves/new',	//전송 페이지(action)
			data : JSON.stringify(love),	//넘길 파라미터(전송할 데이터)//reply를 JSON 문자열로 변환
			contentType : "application/json; charset=utf-8", //보내는 데이터의 타입
			success : function(result, status, xhr) {	//전송 성공시 실행할 코드
				if (callback) {	//만약에 콜백함수가 값을 주면
					callback(result);	//실행해!
				}
			},
			error : function(xhr, status, er) {		//실패시 실행할 코드
				if (error) {
					error(er);
				}
			}
		})
	}
	
	
	//좋아요
	function love(love, callback, error){
		console.log("loveService.............."+JSON.stringify(love));
		$.ajax({
			type : 'patch',
			url : '/loves/'+ love.reviewno +'/'+love.id+'/'+love.loveno+"/"+love.loveyn,
			data : JSON.stringify(love),
			contentType : "application/json; charest=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	return {
		getList : getList,
		getCount : getCount,
		add : add,
		love : love
	};
})();