package com.wine.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wine.model.Criteria;
import com.wine.model.ReplyVO;

public interface ReplyMapper {
	
	//댓글달기
	public int insertSelectKey(ReplyVO vo);
	
	//리댓달기
	public int insert(ReplyVO vo);
	
	//특정 댓글 읽기
	public ReplyVO read(Long replyno);
	
	public int delete (Long reviewno);
	public int reSumUp(Long replyno);
	public int reSumDown(Long replyno);
	
	public int update(ReplyVO reply);
	
											//XML에서 Param("cri")와 매칭됨.
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("reviewno") Long reviewno);

	//특정 게시글의 전체 댓글수
	public int getCountByReviewno(Long reviewno);
}
