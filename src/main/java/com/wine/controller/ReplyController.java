package com.wine.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wine.model.Criteria;
import com.wine.model.ReplyPageDTO;
import com.wine.model.ReplyVO;
import com.wine.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
/* @PreAuthorize("isAuthenticated()") */
public class ReplyController {

	private ReplyService service;

	// 들어오는 데이터 타입 정의 			//반환하는 데이터 타입 정의 			=>JSON방식으로만 처리하도록 함
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	// JSON데이터를 ReplyVO타입으로 변환하도록 함(JSON->자바객체)
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		log.info("ReplyVO: " + vo);
		
		if(vo.getNth()==1) {
			log.info("ReplyVO: " + vo+ vo.getReReplyno());

			int insertCount = service.register(vo, vo.getReReplyno());

			log.info("Reply INSERT COUNT: " + insertCount);

			//insert성공 했으면 성공 뿌려주고, 아니면 에러 뿌려줘
			return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}else {
			int insertCount = service.registerKey(vo);
			
			log.info("Reply INSERT COUNT: " + insertCount);
			
			//insert성공 했으면 성공 뿌려주고, 아니면 에러 뿌려줘
			return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	//목록
	@GetMapping(value = "/pages/{reviewno}/{page}",
			produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("reviewno") Long reviewno){
		Criteria cri = new Criteria(page, 10);
		log.info("get Reply List reviewno: "+reviewno);
		log.info("cri:"+cri);
		
		return new ResponseEntity<>(service.getListPage(cri, reviewno),HttpStatus.OK);
	}
	
	//상세 조회
	@GetMapping(value = "/{replyno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("replyno") Long replyno){
		log.info("get : "+replyno);
		return new ResponseEntity<>(service.get(replyno), HttpStatus.OK);
	}
	
	//삭제
	@DeleteMapping(value = "/{replyno}", produces = {MediaType.TEXT_PLAIN_VALUE})	//replyno값으로 데이터를 삭제
	public ResponseEntity<String> remove(@PathVariable("replyno") Long replyno){
		log.info("remove: "+replyno);
		
		return service.remove(replyno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
											: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//수정(PUT방식이나 PATCH방식을 이용하여 처리한다.)
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, 
			value="/{reReplyno}", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	//실제 데이터는 JSON포맷이므로 변환하여 처리
	public ResponseEntity<String> removeDown(@PathVariable("reReplyno") Long reReplyno){
		log.info("replyno: "+reReplyno);
		
		return service.removeDown(reReplyno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	
}
