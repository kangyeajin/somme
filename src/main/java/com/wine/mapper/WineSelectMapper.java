package com.wine.mapper;

import com.wine.model.WineSelectVO;

public interface WineSelectMapper {
	public WineSelectVO getList(Long resultno);
	public void readCount();
	public Long count();
}
