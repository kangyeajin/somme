package com.wine.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wine.mapper.ReplyMapper;
import com.wine.model.Criteria;
import com.wine.model.ReplyPageDTO;
import com.wine.model.ReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReplyServiceImpl implements ReplyService {

	private ReplyMapper mapper;
	
	@Transactional
	@Override
	public int register(ReplyVO vo, Long replyno) {
		log.info("refister.........."+vo);
		mapper.reSumUp(replyno);
		return mapper.insert(vo);
	}

	@Override
	public int registerKey(ReplyVO vo) {
		log.info("refister.........."+vo);
		return mapper.insertSelectKey(vo);
	}

	@Override
	public ReplyVO get(Long replyno) {
		log.info("get.........."+replyno);
		return mapper.read(replyno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("modify.........."+vo);
		return mapper.update(vo);
	}

	@Override
	public int remove(Long replyno) {
		log.info("remove.........."+replyno);
		return mapper.delete(replyno);
	}
	
	@Override
	public int removeDown(Long reReplyno) {
		return mapper.reSumDown(reReplyno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long reviewno) {
		log.info("getList.........."+reviewno);
		return mapper.getListWithPaging(cri, reviewno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long reviewno) {
		//댓글 총갯수, 페이징처리된 댓글 목록
		return new ReplyPageDTO(
				mapper.getCountByReviewno(reviewno),
				mapper.getListWithPaging(cri, reviewno));
	}

}
