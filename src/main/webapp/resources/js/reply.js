/**
 * 
 */

console.log("Reply Module........");

/*즉시실행 함수!!*/
var replyService = (function(){
		
	//댓글 등록
	function add(reply, callback, error) {
		console.log("add reply..............."+JSON.stringify(reply));
		
		$.ajax({
			type : 'post',	//전송 방식
			url : '/replies/new',	//전송 페이지(action)
			data : JSON.stringify(reply),	//넘길 파라미터(전송할 데이터)//reply를 JSON 문자열로 변환
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
	//리댓글 등록
	function addRe(reply, callback, error) {
		console.log("addRe reply..............."+JSON.stringify(reply));

		$.ajax({
			type : 'post',	//전송 방식
			url : '/replies/new_re',	//전송 페이지(action)
			data : JSON.stringify(reply),	//넘길 파라미터(전송할 데이터)//reply를 JSON 문자열로 변환
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
	
	//댓글 목록
	function getList(param, callback, error){
		console.log("getList reply...............");
		var reviewno = param.reviewno;
		var page = param.page || 1;
		
		//원하는 해당자료의 json데이터를 얻기위하여 호출
		$.getJSON("/replies/pages/"+reviewno+"/"+page+".json",		//[1]url
			function(data){										//[2]data
				if(callback){	//값이 오면
					//callback(data);	//댓글 목록만 가져오는 경우
					callback(data.replyCnt, data.list);		//댓글 숫자와 목록을 가져오는 경우
				}
			}).fail(function(xhr, status, err){					//[3]success
				if(error){
					error();
				}
			});
	}
	
	//삭제
	function remove(replyno, callback, error){
		$.ajax({
			type : 'delete',
			url : '/replies/'+replyno,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	function removeDown(reply, callback, error){
		$.ajax({
			type : 'put',
			url : '/replies/'+ reply.reReplyno,
			data : JSON.stringify(reply),
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
	
	//수정
	function update(reply, callback, error){
		console.log("replyno: "+reply.replyno);
		
		$.ajax({
			type : 'put',
			url : '/replies/'+ reply.replyno,
			data : JSON.stringify(reply),
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
	
	//조회
	function get(replyno, callback, error){
		$.get("/replies/"+replyno+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	//시간 표기
	function displayTime(timeValue){
		//현재 시간(날짜)
		var today = new Date();
		//현재 시간과 작성 시간의 차이
		var gap = today.getTime() - timeValue;
		//작성 시간
		var dateObj = new Date(timeValue);
		var str="";
		
		//하루 차이보다 적으면 작성 시간 입력(시.분.초)
		if( gap < (1000*60*60*24)){
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh > 9 ? '' : '0') + hh,':', (mi > 9 ? '' : '0') + mi,
				':', (ss > 9 ? '' : '0') + ss ].join('');
		
		//하루가 넘으면 작성 날짜 입력(연.월.일)
		}else{
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
				(dd > 9 ? '' : '0') + dd ].join('');
		}
	};
	
	return {
		add : add,
		getList : getList,
		remove : remove,
		removeDown : removeDown,
		update : update,
		get : get,
		displayTime : displayTime
	};
})();