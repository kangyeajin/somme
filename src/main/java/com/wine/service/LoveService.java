package com.wine.service;

import com.wine.model.LoveVO;

public interface LoveService {
	//정보
	public LoveVO getList(String id, Long reviewno);
	//처음 눌렀을 때
	public int loveSet(LoveVO lVo);
		
	//꽉찬 좋아요
	public int loveUp(Long loveno);
	//좋아요
	public int loveDown(Long loveno);

	public int loveCount(Long reviewno);
	
}
