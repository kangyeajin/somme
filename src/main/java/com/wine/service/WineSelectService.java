package com.wine.service;

import com.wine.model.WineSelectVO;

public interface WineSelectService {
	public WineSelectVO getList(Long resultno);
	public void readCount();
	public Long count();
}
