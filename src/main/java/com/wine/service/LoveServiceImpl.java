package com.wine.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wine.mapper.LoveMapper;
import com.wine.model.LoveVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class LoveServiceImpl implements LoveService {

	@Setter(onMethod_ = @Autowired)
	private LoveMapper mapper;

	@Override
	public LoveVO getList(String id, Long reviewno) {
		return mapper.getList(id, reviewno);
	}
	
	@Override
	public int loveSet(LoveVO lVo) {
		return mapper.loveSet(lVo);
	}

	@Override
	public int loveUp(Long loveno) {
		return mapper.loveUp(loveno);
	}

	@Override
	public int loveDown(Long loveno) {
		return mapper.loveDown(loveno);
	}

	@Override
	public int loveCount(Long reviewno) {
		return mapper.loveCount(reviewno);
	}


}
