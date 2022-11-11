package com.wine.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wine.mapper.WorkerMapper;
import com.wine.model.WorkerVO;

@Service
public class WorkerServiceImpl implements WorkerService{
	
	@Autowired
	private WorkerMapper mapper;

	@Override
	public WorkerVO adminlogin(String id, String pwd) {
		return mapper.adminlogin(id, pwd);
	}
}
