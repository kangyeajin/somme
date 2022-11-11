package com.wine.service;

import java.util.List;

import com.wine.model.Criteria;
import com.wine.model.ReplyPageDTO;
import com.wine.model.ReplyVO;

public interface ReplyService {
	//등록
	public int registerKey(ReplyVO vo);
	public int register(ReplyVO vo, Long replyno);
	//상세
	public ReplyVO get(Long replyno);
	public int modify(ReplyVO vo);
	public int remove(Long replyno);
	public int removeDown(Long reReplyno);
	public List<ReplyVO> getList(Criteria cri, Long reviewno);
	public ReplyPageDTO getListPage(Criteria cri, Long reviewno);
}
