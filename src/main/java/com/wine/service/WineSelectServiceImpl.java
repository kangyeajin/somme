package com.wine.service;

import org.springframework.stereotype.Service;

import com.wine.mapper.WineSelectMapper;
import com.wine.model.WineSelectVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class WineSelectServiceImpl implements WineSelectService {

	private WineSelectMapper mapper;
	
	@Override
	public WineSelectVO getList(Long resultno) {
		return mapper.getList(resultno);
	}

	@Override
	public void readCount() {
		mapper.readCount();
	}

	@Override
	public Long count() {
		return mapper.count();
	}

}
