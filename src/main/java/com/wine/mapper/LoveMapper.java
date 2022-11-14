package com.wine.mapper;

import org.apache.ibatis.annotations.Param;

import com.wine.model.LoveVO;

public interface LoveMapper {
	public LoveVO getList(@Param("id") String id, @Param("reviewno") Long reviewno);
	//처음 눌렀을 때
	public int loveSet(LoveVO lVo);
	
	//꽉찬 좋아요
	public int loveUp(Long loveno);
	//좋아요
	public int loveDown(Long loveno);
	
	//리뷰마다 좋아요 수
	public int loveCount(Long reivewno);
}
