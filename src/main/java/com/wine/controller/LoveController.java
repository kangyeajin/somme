package com.wine.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wine.model.Criteria;
import com.wine.model.LoveVO;
import com.wine.model.ReplyPageDTO;
import com.wine.model.ReplyVO;
import com.wine.service.LoveService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/loves/")
@RestController
@Log4j
@AllArgsConstructor
public class LoveController {

	private LoveService service;

	// 정보
	@GetMapping(value = "/{reviewno}/{id}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<LoveVO> getList(@PathVariable("id") String id, @PathVariable("reviewno") Long reviewno) {
		log.info("get List reviewno: " + reviewno);
		log.info("id:" + id);
		
		return new ResponseEntity<>(service.getList(id, reviewno), HttpStatus.OK);
	}

	// 하트 총 개수 
		@GetMapping(value = "love_count/{reviewno}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE })
		public ResponseEntity<Integer> get(@PathVariable("reviewno") Long reviewno) {
			log.info("get : " + reviewno);
			return new ResponseEntity<>(service.loveCount(reviewno), HttpStatus.OK);
		}
	
	// 첫좋아요
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	// JSON데이터를 ReplyVO타입으로 변환하도록 함(JSON->자바객체)
	public ResponseEntity<String> create(@RequestBody LoveVO vo) {
		log.info("LoveVO: " + vo);

		// insert성공 했으면 성공 뿌려주고, 아니면 에러 뿌려줘
		return service.loveSet(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 좋아요
	@RequestMapping(method = {RequestMethod.PATCH }, 
			value = "/{reviewno}/{id}/{loveno}/{loveyn}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	// 실제 데이터는 JSON포맷이므로 변환하여 처리
	public ResponseEntity<String> loveUp(@PathVariable("loveno") Long loveno, @PathVariable("loveyn") Long loveyn) {
		log.info("loveno: " + loveno);
		log.info("loveyn : " + loveyn);

		if (loveyn == 0) {
			log.info("UP: " + loveyn);
			return service.loveUp(loveno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		} else {
			log.info("DOWN: " + loveyn);
			return service.loveDown(loveno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
